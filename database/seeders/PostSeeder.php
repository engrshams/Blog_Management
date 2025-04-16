<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use App\Models\Post;
class PostSeeder extends Seeder{
    public function run(): void{
        Post::insert([
            [
                'title' => 'Introduction to Laravel',
                'content' => 'Laravel is a powerful PHP framework for web development.',
                'user_id' => 1,
                'img'=>'uploads/1744562390.jpg',
                'visibility' => 'public',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Getting Started with Eloquent',
                'content' => 'Eloquent ORM simplifies database interactions in Laravel.',
                'user_id' => 2,
                'img'=>'uploads/1744562399.jpg',
                'visibility' => 'public',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Authentication in Laravel',
                'content' => 'Learn how to implement user authentication in Laravel applications.',
                'user_id' => 1,
                'img'=>'uploads/1744562405.jpg',
                'visibility' => 'public',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Laravel Blade Templating',
                'content' => 'Blade is a simple yet powerful templating engine in Laravel.',
                'user_id' => 2,
                'img'=>'uploads/1744562587.jpg',
                'visibility' => 'private',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Building RESTful APIs in Laravel',
                'content' => 'Create RESTful APIs with Laravel for modern web and mobile applications.',
                'user_id' => 1,
                'img'=>'uploads/1744562612.jpg',
                'visibility' => 'public',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}