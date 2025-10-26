<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DummyUsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $userData= [
            [
                'name'=>'mas analis',
                'email'=>'analis@gmail.com',
                'role'=>'analis',
                'password'=>bcrypt('123456'),
            ],
            [
                'name'=>'mas korlab',
                'email'=>'korlab@gmail.com',
                'role'=>'korlab',
                'password'=>bcrypt('123456'),
            ],
            [
                'name'=>'mas manajer',
                'email'=>'manajer@gmail.com',
                'role'=>'manajer',
                'password'=>bcrypt('123456'),
            ],
        ];

        foreach($userData as $key => $val){
            User::create($val);
        }
    }
}
