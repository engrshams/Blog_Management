<?php
namespace App\Http\Controllers;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class UserController extends Controller{
    public function login(){
        return view('user.login');}
    public function register(){
        return view('user.register');}

    public function save(Request $request){
        //dd($request->all());
        $request->validate([
            'name' => 'required|string|unique:users|max:255',
            'email' => 'required|string|unique:users|email',
            'password' => 'required|max:12|min:3|confirmed',
            'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',//image – Ensures the file is an image, mimes: (allowed types) excludes webp, bmp, etc., even though they're valid for image.  
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;

        $imgPath = null;
        if ($request->hasFile('img')) {
            //$imgPath = $request->file('img')->store('uploads', 'public'); // stored in storage/app/public/posts
            $img = $request->file('img');
            $imageName = time() . '.' . $img->getClientOriginalExtension();
            $imgPath = 'uploads/'. $imageName;
            $img->move(public_path('uploads'), $imageName);
            $user->img=$imgPath;
        }
        //dd($user->img);        
        $user->save();
        //dd($user);
        //dd('Saved successfully'); // If this doesn’t show, something's wrong earlier
        return redirect()->route('user.login')->with('success','User Created Successfully, Please Login');
    }

    public function check(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|max:12|min:3',
        ]);
        $userInfo = User::where('email', $request->email)->first();
        if (!$userInfo) {
            return back()->with('fail','We don\'t recognize your email address');
        }
        if ($request->password==$userInfo->password) {
            $request->session()->put('LoggedUser', $userInfo->id);
            return redirect('user/dashall');
        }
        else {
            return back()->with('fail','Password is incorrect');
        }
        //return redirect()->route('user.register')->with('success','User Created Successfully, Please Login');
    }

    public function dashboard(){
        // $LoggedUser=User::with('posts')->find(session('LoggedUser'))->orderBy('id', 'desc');
        $LoggedUser = User::with(['posts' => function ($query) {
            $query->orderBy('id', 'desc');
        }])->find(session('LoggedUser'));

        if ($LoggedUser) {
            return view('user.dashboard',['LoggedUser'=>$LoggedUser]);
        }
        else {
            return redirect('/user/login')->with('fail','Please Login First');
        }        
    }


    public function dashboardAll(Request $request){
        // likes relationship is eager-loaded in controller:
        $query = Post::with([
                    'user:id,name',           // Load post's creator
                    'likes',                  // Load likes (you use this for count and toggle)
                    'bookmarks',              // Needed to check if a post is bookmarked
                    'tags',                   // Optional but good for filter/display
                    'comments.replies.user',  // 🔥 Recursively load replies and reply authors
                    'comments.user'           // Load top-level comment authors
                ])  
                ->where('visibility', 'public');

        // Apply search if query is present
        if ($request->has('search')) {
            $search = $request->input('search');

            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                ->orWhere('content', 'like', "%{$search}%")
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%");
                })
                ->orWhereHas('tags', function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%");
                });
            });
        }

        $posts = $query->orderBy('id', 'desc')->simplePaginate(3);
        $LoggedUser = User::find(session('LoggedUser'));

        return view('user.dashall', compact('posts', 'LoggedUser'));
    }        



    public function logout(){
        if (Session()->has('LoggedUser')) {
            Session()->pull('LoggedUser');
            return redirect('/user/login');
        }        
    }
}
