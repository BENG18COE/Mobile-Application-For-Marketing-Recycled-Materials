<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Kreait\Laravel\Firebase\Facades\Firebase;
use Kreait\Firebase\Contract\Firestore;

class UserController extends Controller
{
    public function __construct(){
        static::$database = self::firestoreDatabaseInstance();
    
    }

    public function index(){
        $userCollection = parent::$database->collection('Users');
        $users =$userCollection->documents();

        return view('user.index')->with(["users" => $users]);


    }

    public function create(){

        return view('user.create');
    }

    public function store(Request $request){
        $docRef = self::$db->collection('Users');
        $docRef->add([      
            'displayName' => $request->nama,
            'email' => $request->email,
            'password' =>bcrypt($request->password) 
        ]);

        return redirect('/users');
    }
    
    public function edit($id){
        $docRef = self::$database->collection('Users')->document($id);
        //$query = $docRef->where('id', '=', $id);
        $snapshot = $docRef->snapshot();
        $user = $snapshot;

        return view('user.edit')->with("user", $user);
    }

    public function update(Request $request, $id){
        $request->validate([
            "name" => ['nullable','string'],
            "category" => ['nullable','string'],
            "email" => ['email',]
        ]);

        $docRef = self::$database->collection('Users')->document($id);
        $snapshot = $docRef->snapshot();
        // dd($snapshot);

        $docRef->set([
            'displayName' => $request->name,
            'email' => $request->email,
            "userCategory" => $request->category
            ],
            ["merge" => true]
        );

        return redirect('/user')->with(["sms" => "USER {$snapshot['displayName']} UPDATED"]);
    }
    
    public function delete(Request $request, $id){
        $docRef = self::$database->collection('Users')->document($id);
        $docRef->delete();

        return redirect()->back()->with(["sms" => "USER DELETED"]);
    }
}
