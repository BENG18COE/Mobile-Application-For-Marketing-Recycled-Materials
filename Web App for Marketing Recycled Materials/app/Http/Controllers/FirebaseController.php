<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Kreait\Firebase;
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
use Kreait\Firebase\Database;

class FirebaseController extends Controller
{
    //protected static $database;
    public function index(){
        $serviceAccount = ServiceAccount::fromJsonFile(__DIR__.'/key.json');
        $firebase = (new Factory)
        ->withServiceAccount($serviceAccount)        
        //->withDatabaseUri('https://sehatpedia-b58e5.firebaseio.com/')        
        ->create();        
        $database = $firebase->getDatabase();
        $ref = $database
        ->getReference('blog/posts')
        ->push([
            'title' => 'Post title',
            'body' => 'This should probably be longer.'
        ]);
        //return
        return $ref->getValue();       
    }
}
