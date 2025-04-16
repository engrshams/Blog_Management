<h1>This is dashboard</h1>

<a class="nav-link" href="#" role="burron" data-toggle="dropdown">
    <img src="/Images/profile/pic.jpg" width="20",alt="">
    <div class="header-info">
        @if($LoggedUser)
        <td>{{ $LoggedUser['name'] }}</td>
        @endif <small>User</small>
    </div>
</a>