<?php
namespace App\Http\Controllers;
use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller{
    
    public function store(Request $request, Post $post){
        $request->validate([
            'body' => 'required|string|min:1|max:1000',
            'parent_id' => 'nullable|integer|exists:comments,id',
        ]);

        $userId = session('LoggedUser') ?? null;
        if (!$userId) {
            return response()->json([
                'errors' => ['body' => ['You must be logged in to comment.']]
            ], 403);
        }

        // Optional: Limit nested replies to a max depth (e.g., 2 levels deep)
        $maxDepth = 4;
        $parentId = $request->parent_id;
        $depth = 1;

        if ($parentId) {
            $parentComment = Comment::find($parentId);

            // Make sure parent comment exists and belongs to the same post
            if (!$parentComment || $parentComment->post_id !== $post->id) {
                $error = ['parent_id' => 'Invalid parent comment.'];
                return $request->ajax()
                    ? response()->json(['error' => $error['parent_id']], 422)
                    : back()->withErrors($error);
            }
            

            // Check/Calculate nesting depth
            $current = $parentComment;
            while ($current->parent_id !== null) {
                $depth++;
                $current = $current->parent;
                if ($depth >= $maxDepth) {
                    break;
                }
            }

            if ($depth >= $maxDepth) {
                $message = 'You can only reply up to ' . $maxDepth . ' levels.';
                return $request->ajax()
                    ? response()->json(['error' => $message], 422)
                    : back()->withErrors(['body' => $message]);
            }
        }

        $comment=Comment::create([
            'body' => $request->body,
            //'user_id' => session('LoggedUser'),
            'user_id' => $request->session()->get('LoggedUser.id'),
            'post_id' => $post->id,
            'parent_id' => $parentId
        ]);

        $comment->load('user');

        // Check for AJAX request
        if ($request->ajax()) {
            return response()->json([
                'success' => true,
                'comment' => view('user.partials.comment', [
                    'comment' => $comment,
                    'post' => $post
                ])->render()
            ]);
        }

        return back();
    }


    public function destroy(Comment $comment){
        $userId = session('LoggedUser'); // or Auth::id() if using auth()

        // Ensure only the owner of the post can delete comments
        if ($comment->post->user_id !== $userId) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        // Delete the comment (and optionally its children)
        $comment->delete();

        return response()->json(['success' => true, 'message' => 'Comment deleted successfully']);
    }

}
