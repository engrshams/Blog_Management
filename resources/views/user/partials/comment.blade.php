@php
    $isReply = $comment->parent_id !== null;
@endphp

<div class="comment mt-3 {{ $isReply ? 'nested-comment' : '' }}">
    <strong>{{ $comment->user->name ?? 'Anonymous' }}</strong> said:
    <p>{{ $comment->body }}</p>
    <small>{{ $comment->created_at->diffForHumans() }}</small>

    @if($post->user_id === $LoggedUser->id)
        <form method="POST" class="d-inline comment-delete-form" data-comment-id="{{ $comment->id }}">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-sm btn-link text-danger p-0 ml-2">Delete</button>
        </form>
    @endif

    <a href="#" class="reply-toggle text-primary d-block mt-2" style="font-size: 0.9rem;">Reply</a>

    <!-- Reply Form -->
    <form action="{{ route('comments.store', $post->id) }}" method="POST" class="reply-form ajax-reply-form mt-2" style="display: none;">
        @csrf
        <div class="form-group">
            <textarea name="body" class="form-control" rows="2" placeholder="Write a reply..."></textarea>
            <div class="text-danger small error-msg mt-1" style="display:none;"></div>
        </div>
        <input type="hidden" name="parent_id" value="{{ $comment->id }}">
        <button type="submit" class="btn btn-sm btn-secondary">Post Reply</button>
    </form>

    <!-- Recursive: load replies -->
    @if ($comment->replies->count())
        @foreach ($comment->replies as $reply)
            @include('user.partials.comment', ['comment' => $reply, 'post' => $post])
        @endforeach
    @endif
</div>