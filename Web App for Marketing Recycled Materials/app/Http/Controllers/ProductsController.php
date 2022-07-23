<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Kreait\Laravel\Firebase\Facades\Firebase;
use Kreait\Firebase\Contract\Firestore;

class ProductsController extends Controller
{
    public function __construct(){
        static::$database = self::firestoreDatabaseInstance();
    
    }

    public function index(){
        $productCollection = parent::$database->collection('products');
        $products =$productCollection->documents();
        // dd($products);
        return view('product.index')->with(["products" => $products]);
    }

    public function create(){

        return view('product.create');
    }
  
    public function edit($id){
        $docRef = self::$database->collection('products')->document($id);
        //$query = $docRef->where('id', '=', $id);
        $snapshot = $docRef->snapshot();
        $product = $snapshot;

        return view('product.edit')->with("product", $product);
    }

    public function update(Request $request, $id){
        $request->validate([
            "name" => ['nullable','string'],
            "id" => ['nullable','integer'],
            "isPopular" => ['nullable','boolean'],
            "isRecommended" => ['nullable','boolean'],
        ]);

        $docRef = self::$database->collection('products')->document($id);
        $snapshot = $docRef->snapshot();

        $docRef->set([
            'id'            =>  $request->id,
            'name'          =>  $request->name,
            'isPopular'     =>  ($request->isPopular == 1),
            'isRecommended' =>  ($request->isRecommended == 1),
            ],
            ["merge" => true]
        );

        return redirect('/product')->with(["sms" => "PRODUCT {$snapshot['name']} UPDATED"]);
    }
    
    public function delete(Request $request, $id){
        $docRef = self::$database->collection('products')->document($id);
        $docRef->delete();

        return redirect()->back()->with(["sms" => "PRODUCT DELETED"]);
    }
}
