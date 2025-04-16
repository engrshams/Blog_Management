<?php
namespace App\Models;
// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Post;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable{
    use HasFactory, Notifiable;
    protected $fillable = ['name','email','password','img',];
    protected $hidden = ['password',
        //'remember_token',
    ];
    public function posts(){
        return $this->hasMany(Post::class);}
    public function bookmarks(){
        return $this->hasMany(Bookmark::class);}
    public function likes() {
        return $this->hasMany(Like::class);
    }
    public function comments() {
        return $this->hasMany(Comment::class);
    }
    protected function casts(): array{
        return [//
            ];}
}