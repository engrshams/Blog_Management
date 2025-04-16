<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void{
        Schema::create('bookmarks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete(); // Foreign key from users table
            $table->foreignId('post_id')->constrained()->cascadeOnDelete(); // Foreign key from posts table
            $table->timestamps();
        });        
    }
    public function down(): void{
        Schema::dropIfExists('bookmarks');}
};
