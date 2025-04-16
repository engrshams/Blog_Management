<?php
namespace Database\Seeders;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
class DatabaseSeeder extends Seeder{
    public function run(): void{
        User::factory()->create([
            'name' => 'Engr. Shams',
            'email' => 'engr.sams@gmail.com',
            'password' => 'password',
        ]);
        User::factory()->create([
            'name' => 'Engr. Suhaan',
            'email' => 'engr.shams@yahoo.com',
            'password' => 'password',
        ]);

        $this->call([PostSeeder::class,]);
    }
}
