<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class Bookmark extends Model{
    use HasFactory;
    protected $fillable = ['user_id','post_id',];
    // Relationship: A bookmark belongs to a user
    public function user(){
        return $this->belongsTo(User::class);}
    // Relationship: A bookmark belongs to a post
    public function post(){
        return $this->belongsTo(Post::class);}
}
