<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Google\Cloud\Firestore\FirestoreClient;

class FirestoreController extends Controller
{

  protected static $db;

  protected static function firestoreDatabaseInstance(){
    $db = new FirestoreClient([
      'projectId'=> 'sehat-62ae3'
    ]);

    return $db;
  }

  public function __construct(){
    static::$db = self::firestoreDatabaseInstance();

  }

  public function index(){
    $docRef = self::$db->collection('users');
    $snapshot =$docRef->documents();
    
    foreach ($snapshot as $user) {
      printf('User: %s' . PHP_EOL, $user->id());
      printf('First: %s' . PHP_EOL, $user['nama']);
      printf('Email: %s' . PHP_EOL, $user['email']);
      printf('Pass: %s' . PHP_EOL, $user['pass']);
      printf(PHP_EOL);
  }

    return json_encode($user);
  }
  
  public function create(){
    $docRef = self::$db->collection('users');
    $docRef->add([      
        'nama' => 'ali',
        'email' => 'alibaba@gmail.com',
        'pass' => '12345'
    ]);
    printf('Added data to the lovelace document in the users collection.' . PHP_EOL);
    return json_encode ($docRef);
  }

  public function edit($id){
    //$id = '4Ee3sRyEaoMSJc9XCHfr';
    $docRef = self::$db->collection('users')->document($id);
    $docRef->set([
      'nama' => 'aul',
      'email' => 'aul@gmail.com',
      'pass' => '123458287'
    ]);
    printf('Edit data to the aturing document in the users collection.' . PHP_EOL);
  }

  public function destroy($id){

    $docRef = self::$db->collection('users')->document($id);
    $docRef->delete();
    printf('Delete data to the aturing document in the users collection.' . PHP_EOL);
  }

  public function show(){
    $docRef = self::$db->collection('users');
    $query = $docRef->where('nama', '=', 'ali');
    $documents = $query->documents();

    return dd ($documents);
  }

}
