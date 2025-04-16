<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
    public function up(): void{
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('content');            
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            //$table->binary('img')->nullable(); // Use binary for BLOB
            $table->string('img')->nullable(); // Assuming now using file path
            $table->enum('visibility', ['public', 'private'])->default('public')->index();
            $table->timestamps();
        });
    }
    public function down(): void{
        Schema::dropIfExists('posts');
    }
};