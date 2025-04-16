<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<head>
    <body>
<div class="container">
    <h1>Edit Post</h1>

    @if(session('error'))
    <div class="alert alert-danger">
        {{ session('error') }}
    </div>
    @endif

    <form action="{{ route('post.update', ['id' => $post->id]) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="{{ old('title', $post->title) }}">
        </div>

        <div class="form-group">
            <label for="content">Content</label>
            <textarea class="form-control" id="content" name="content">{{ old('content', $post->content) }}</textarea>
        </div>

        <div class="form-group">
            {{-- <label for="img">Image</label>
            <input type="file" class="form-control-file" id="img" name="img"> --}}
            <label for="img">Change Image</label>
            <input type="file" class="form-control-file" id="img" name="img" accept="image/*">
            @if ($post->img)
            {{-- <img src="{{ asset('storage/' . $post->img) }}" alt="Current Image" width="100"> --}}
            <img src="{{ asset('storage/' . $post->img) }}" alt="Current Image" class="img-fluid mb-2" style="max-height: 300px;">
            @endif
        </div>
        <div class="form-group">
            <label for="visibility">Visibility</label>
            <select class="form-control" id="visibility" name="visibility" required>
                <option value="public" {{ $post->visibility === 'public' ? 'selected' : '' }}>Public</option>
                <option value="private" {{ $post->visibility === 'private' ? 'selected' : '' }}>Private</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div> 
</main> <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
