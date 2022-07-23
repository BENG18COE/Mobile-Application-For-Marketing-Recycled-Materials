<?php

use Illuminate\Support\Facades\Route;
use Kreait\Laravel\Firebase\Facades\Firebase;
use Kreait\Firebase\Contract\Firestore;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    $defaultAuth = Firebase::auth();
     $firestore = app('firebase.firestore');
     $database = $firestore->database();
    // dd($database->document('Users/Jovinary'));

    $documents = $database->collection('Users');
    // $user =$database->collection('Users')->document()->snapshot();
    // print_r('USER ID ='.$user->id());
    // print_r("<br>". 'USER Name = '.$user->data()['displayName']);
    // print_r("<br>".'USER Age = '.$user->data()['age']);
   
    $users =$documents->documents();
    foreach ($users as $document) {
        if ($document->exists()) {

            print_r("<br>".'USER ID ='.$document->id());
            print_r("<br>". 'USER Name ='.$document->data()['displayName']);
            print_r("<br>".'USER Age = '.$document->data()['age']);


            // printf('Document data for document %s:' . PHP_EOL, $document->id());
            // print_r($document->data());
            // printf(PHP_EOL);
        } else {
            printf('Document %s does not exist!' . PHP_EOL, $document->id());
        }
    }

    
    // $documents->add([
    //     'name' => 'Kate'
    // ]);
    
    // foreach ($documents as $document) {
    //     echo $document->name(). "<br/>";
    //     // if (!$document->exists()) {
    //     //     echo $document->id() . ' Does Not Exist';
    //     // }
    // }


    return view('welcome');

    
}

);


// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/insert', function() {
// 	 $stuRef = app('firebase.firestore')->database()->collection('User')->newDocument();
// 	 $stuRef->set([
// 		'firstname' => 'Seven',
// 		'lastname' => 'Stac',
// 		'age'    => 19,
        
//  ]);
//  echo "<h1>".'inserted'."</h1>";
// });

// Route::get('/display', function(){
//   $student = app('firebase.firestore')->database()->collection('User')->document('166f34ea1c9641dab0a0')->snapshot();
//   print_r('Student ID ='.$student->id());
//   print_r("<br>". 'Student Name = '.$student->data()['firstname']);
//   print_r("<br>".'Student Age = '.$student->data()['age']);
// });

// Route::get('/update', function(){
//   $student = app('firebase.firestore')->database()->collection('User')->document('166f34ea1c9641dab0a0')
//  ->update([
//   ['path' => 'age', 'value' => '18']
//  ]);
//  echo "<h1>".'updated'."</h1>";
// });

// Route::get('/delete', function(){
//  app('firebase.firestore')->database()->collection('User')->document('166f34ea1c9641dab0a0')->delete();
//  echo "<h1>".'deleted'."</h1>";
// });

// Route::resource('/crud', App\Http\Controllers\CrudController::class);


Route::get('/insert', function() {
//     $stuRef = app('firebase.firestore')->database()->collection('User')->newDocument();
//     $stuRef->set([
//        'firstname' => 'Seven',
//        'lastname' => 'Stac',
//        'age'    => 19
// ]);
$firestore = app('firebase.firestore');
$database = $firestore->database();
$docRef = $database->collection('Users');
$docRef->add([      
    'displayName' => $request->displayName,
    'email' => $request->email,
    'password' =>bcrypt($request->password) 
]);

echo "<h1>".'inserted'."</h1>";
});

Route::get('/display', function(){

    $firestore = app('firebase.firestore');
    $database = $firestore->database();
   $documents = $database->collection('Users');
   $users =$documents->documents();
   foreach ($users as $document) {
       if ($document->exists()) {

           print_r("<br>".'USER ID ='.$document->id());
           print_r("<br>". 'USER Name ='.$document->data()['displayName']);
           print_r("<br>".'USER Age = '.$document->data()['age']);
       } else {
           printf('Document %s does not exist!' . PHP_EOL, $document->id());
       }
   }
   echo "<h1>".'display'."</h1>";
});





Route::get('/update', function (){

    $firestore = app('firebase.firestore');
    $database = $firestore->database();
    $documents = $database->collection('Users');
    $$docRef =$documents->document($id);
    $snapshot = $docRef->snapshot();
    $user = $snapshot;
    $docRef->set([
        'displayName' => $request->nama,
        'email' => $request->email,
        'password' => $request->get('password') ? bcrypt ($request->get('password')) : $user['pass']
      ]);
echo "<h1>".'updated'."</h1>";
});

Route::get('/delete', function(){
    $firestore = app('firebase.firestore');
    $database = $firestore->database();
   $documents = $database->collection('Users');   
   $docRef = $documents->collection('users')->document($id);
        $docRef->delete();
echo "<h1>".'deleted'."</h1>";
});



Route::resource('/crud', App\Http\Controllers\CrudController::class);