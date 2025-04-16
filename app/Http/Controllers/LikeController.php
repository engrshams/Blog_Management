<?php
namespace App\Http\Controllers;
use App\Models\Like;
use Illuminate\Http\Request;

class LikeController extends Controller{
    public function toggle(Request $request){
        $userId = session('LoggedUser');
        $postId = $request->input('post_id');
        $like = Like::where('user_id', $userId)->where('post_id', $postId)->first();
        if ($like) {
            $like->delete(); // Unlike
        } else {
            Like::create(['user_id' => $userId, 'post_id' => $postId]); // Like
        }
        $likeCount = Like::where('post_id', $postId)->count();
        return response()->json(['liked' => !$like, 'likeCount' => $likeCount]);
    }
}
