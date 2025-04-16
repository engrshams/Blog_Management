<?php
namespace App\Models;
use App\Models\User;
use App\Models\Bookmark;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model{
    use HasFactory;
    protected $fillable = ['title','content','user_id','img','visibility',];
    public function user(){
        return $this->belongsTo(User::class);}
    public function bookmarks(){
        return $this->hasMany(Bookmark::class);}          
    public function likes() {
        return $this->hasMany(Like::class);}    
    public function tags() {
        return $this->belongsToMany(Tag::class);}
    public function isLikedBy($userId) {
        return $this->likes->where('user_id', $userId)->count() > 0;
    }      
    public function comments() {
        return $this->hasMany(Comment::class)->whereNull('parent_id');
    }
}