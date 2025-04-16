<?php
namespace App\Http\Controllers;
use App\Models\Post;
use App\Models\User;
use App\Models\Bookmark;
use Illuminate\Http\Request;

class BookmarkController extends Controller{
    
    public function toggle(Request $request, Post $post){
    $userId = session('LoggedUser');

    $bookmarked = $post->bookmarks()->where('user_id', $userId)->exists();

    if ($bookmarked) {
        $post->bookmarks()->where('user_id', $userId)->delete();
    } else {
        $post->bookmarks()->create(['user_id' => $userId]);
    }

    if ($request->ajax()) {
        return response()->json([
            'success' => true,
            'bookmarked' => !$bookmarked,
        ]);
    }

    return back();
}

    public function bookmarkedPosts(){
        $user = User::find(session('LoggedUser'));
        $bookmarkedPosts = $user->bookmarks()->with('post.user')->latest()->simplePaginate(3);

        return view('user.bookmarks', [
            'LoggedUser' => $user,
            'bookmarkedPosts' => $bookmarkedPosts
        ]);
    }
}