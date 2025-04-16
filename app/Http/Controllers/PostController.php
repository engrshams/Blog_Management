<?php
namespace App\Http\Controllers;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
class PostController extends Controller{

    public function index(){
        $posts = Post::where('visibility', 'public')->orderBy('id', 'desc')
             ->with('user:id,name') // select only needed user fields
             ->simplePaginate(3);
        return view('welcome',compact('posts'));}


    public function create(){
        return view('user.create');}


    public function store(Request $request){
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',//image – Ensures the file is an image, mimes: (allowed types) excludes webp, bmp, etc., even though they're valid for image.  
            'visibility' => 'required|in:public,private',
            'tags' => 'nullable|string'
        ]);        
        $post = new Post();
        $post->title = $request->title;
        $post->content = $request->content;
        $post->visibility = $request->input('visibility');
        $imgPath = null;
        if ($request->hasFile('img')) {
            //$imgPath = $request->file('img')->store('uploads', 'public'); // stored in storage/app/public/posts
            $img = $request->file('img');
            $imageName = time() . '.' . $img->getClientOriginalExtension();
            $imgPath = 'uploads/'. $imageName;
            $img->move(public_path('uploads'), $imageName);
            $post->img=$imgPath;
        }
        $post->user_id = session('LoggedUser');
        $post->save();

        // Handle tags (minimal addition)
        if ($request->filled('tags')) {
            $tagNames = explode(',', $request->tags);
            $tagIds = [];
            foreach ($tagNames as $name) {
                $name = trim($name);
                if (!empty($name)) {
                    $tag = Tag::firstOrCreate(['name' => $name]);
                    $tagIds[] = $tag->id;
                }
            }
            $post->tags()->sync($tagIds);
        }

        return redirect()->route('user.dashboard')->with('success','Post Created Successfully');
    }


    public function destroy($id){
        $post = Post::find($id);
        if (!$post) {
            return redirect()->route('user.dashboard')->with('error', 'Post not found.');
        } 
        if(session('LoggedUser') !== $post->user_id){
            return redirect()->route('user.dashboard')->with('error', 'You are not authorized to delete this post.');
        }
        $post->delete();
        return redirect()->route('user.dashboard')->with('success', 'Post deleted successfully.');
    }


    public function edit($id){
        $post = Post::find($id);
        if (!$post) {
            return redirect()->route('user.dashboard')->with('error', 'Post not found.');
        } 
        if(!session('LoggedUser')){
            return redirect()->route('user.dashboard')->with('error', 'You must be logged in to edit a post.');
        }
        if(session('LoggedUser') !== $post->user_id){
            return redirect()->route('user.dashboard')->with('error', 'You are not authorized to delete this post.');
        }
        return view('user.edit',['post'=>$post]);
    }


    public function update(Request $request,$id){
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',            
            'visibility' => 'required|in:public,private',
        ]);
        $post = Post::find($id);
        if (!$post) {
            return redirect()->route('user.dashboard')->with('error', 'Post not found.');
        }
        if(!session('LoggedUser')){
            return redirect()->route('user.dashboard')->with('error', 'You must be logged in to edit a post.');
        }
        if(session('LoggedUser') !== $post->user_id){
            return redirect()->route('user.dashboard')->with('error', 'You are not authorized to delete this post.');
        }
        $post->title = $request->input('title');
        $post->content = $request->input('content'); // Update the content;
        $post->visibility = $request->input('visibility');
        
        // Handle the image upload if it exists in the request
        if ($request->hasFile('img')) {
            // Validate image
            $request->validate([
                'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            // If the product has an existing image, delete it
            if ($post->img && file_exists(public_path($post->img))) {
                unlink(public_path($post->img));
            }

            // Process the new image upload
            $img = $request->file('img');
            $fileName = time() . '.' . $img->getClientOriginalExtension();
            $filePath = 'uploads/' . $fileName;
            $img->move(public_path('uploads'), $fileName);
            // Assign the new image path to the product
            $post->img = $filePath;
        }
        $post->save();
        return redirect()->route('user.dashboard')->with('success','Post Updated Successfully');
    }
}
