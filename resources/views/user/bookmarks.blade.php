<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<head>
    <!-- Add your CSS styles here to style the tiles -->
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .post-tile {
            background-color: #f3f4f6;
            border: 1px solid #e5e7eb;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .post-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .post-content {
            font-size: 16px;
            flex-grow: 1;
        } .container {
            max-width: 1200px; /* Adjust the max-width to your desired value */
            margin: 0 auto;
            padding: 20px;
        }

        .post-tile {
            background-color: #f3f4f6;
            border: 1px solid #e5e7eb;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .post-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .post-content {
            font-size: 16px;
            flex-grow: 1;
        } 
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"><b>Blog Site</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link active" href="dashboard">My Dashboard </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="dashall">All Posts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('user.bookmarks') }}">My Bookmarks</a>
                </li>
              
            </ul>

            <ul class="navbar-nav ml-auto">
                <!-- User Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        
                        @if ($LoggedUser && $LoggedUser['img'])
                            <img src="{{ asset('/' . $LoggedUser['img']) }}" width="30" height="30" class="rounded-circle mr-2" alt="Profile Image">
                        @else
                            <img src="{{ asset('/uploads/default.jpg') }}" width="30" height="30" class="rounded-circle mr-2" alt="Default Profile">
                        @endif
                        
                        @if($LoggedUser)
                            <span class="text-dark">{{ $LoggedUser['name'] }}</span>
                        @endif
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <form id="logout-form" action="{{ route('user.logout') }}" method="post">
                            @csrf
                            <button type="submit" class="dropdown-item ai-icon" style="border: none; background: none;">
                                <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" class="text-danger" width="18"
                                    height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4">
                                    </path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg>
                                <span class="ml-2">Logout</span>
                            </button>
                        </form>
                    </div>
                </li>
            </ul>
        
        </div>
    </nav>
    <main role="main" class="container">
    <div class="my-3  bg-white rounded box-shadow">
        <h1 class="text-center">My Bookmarked Posts</h1>
        <h6 class="border-bottom border-gray pb-2 mb-4">Recent updates</h6>

        <!-- Loop through the posts and display them as tiles -->
        <div class="row">
            @foreach ($bookmarkedPosts as $bookmark)
                @php
                    $post = $bookmark->post;
                @endphp

                <div class="col-md-4 mb-4">
                    <div class="card">
                        {{-- <img src="{{ asset('storage/' . $post->img) }}" alt="Image" class="card-img-top"> --}}
                        @if($post->img)
                            {{-- <img src="{{ asset('storage/' . $post->img) }}" alt="Post Image" class="img-fluid mb-2" style="max-height: 300px;"> --}}
                            <img src="{{ asset('/' . $post->img) }}" alt="Post Image" class="img-fluid mb-2" style="max-height: 300px;">
                        @endif
                        <div class="card-body">
                            <h5 class="card-title">Created By: {{ $post->user->name ?? 'Unknown' }}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Title: {{ $post->title }}</h6>
                            <p class="card-text">Content: {{ $post->content }}</p>
                            <p class="card-text">Created At: {{ $post->created_at }}</p>

                            <form action="{{ route('bookmark.toggle', $post->id) }}" method="POST">
                                @csrf
                                @php
                                    $isBookmarked = $post->bookmarks->contains('user_id', $LoggedUser->id);
                                @endphp
                                <button type="submit" class="btn btn-sm {{ $isBookmarked ? 'btn-danger' : 'btn-outline-primary' }}">
                                    {{ $isBookmarked ? 'Unbookmark' : 'Bookmark' }}
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <!-- End of posts -->
    </div>
    {{  $bookmarkedPosts->links() }}
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>