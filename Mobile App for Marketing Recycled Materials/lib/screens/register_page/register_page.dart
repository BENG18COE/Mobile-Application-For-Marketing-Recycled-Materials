import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:trial/screens/screens.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/registerpage';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => RegisterPage());
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late File _file = File('');
  FirebaseAuth auth = FirebaseAuth.instance;
  late String imageUrl;
  late String companyId;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var usercat = '';
  var selectedCategoryId;
  bool isStudentPresent = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
          ? Colors.black12
          : Colors.white,
      appBar: NeumorphicAppBar(
        title: Text(
          "Register",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              NeumorphicButton(
                onPressed: pickImage,
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 0,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 180,
                  height: 180,
                  child: _file.path == ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text(
                              "Upload\nPhoto",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Image.file(
                          _file,
                          fit: BoxFit.cover,
                        ),
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -4,
                  lightSource: LightSource.topLeft,
//                    color: Colors.grey
                ),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: '*Required'),
                    MinLengthValidator(12, errorText: 'Invalid Index Number')
                  ]),
                  decoration: InputDecoration(
                    hintText: "Enter Company Id",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                  onChanged: (value) {
                    companyId = value;
                  },
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -4,
                  lightSource: LightSource.topLeft,
//                    color: Colors.grey
                ),
                child: DropdownButtonFormField<String>(
                  onChanged: (i) {
                    selectedCategoryId = i;
                    usercat = selectedCategoryId.toString();
                  },
                  // items: list.map((ob){
                  //   return DropdownMenuItem(child: Text(ob.name),value: ob.id,);
                  // }).toList(),
                  items: [
                    DropdownMenuItem(
                      child: Text("Register As Seller",
                          style: TextStyle(color: dropTextColor(context))),
                      value: 'seller',
                    ),
                    DropdownMenuItem(
                      child: Text("Register As Buyer",
                          style: TextStyle(color: dropTextColor(context))),
                      value: 'buyer',
                    ),
                    DropdownMenuItem(
                      child: Text('Register As Transport',
                          style: TextStyle(color: dropTextColor(context))),
                      value: 'transter',
                    ),
                  ],

                  decoration: InputDecoration(
                      hintText: "Select User Category",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10)),
                ),
              ),

              // SizedBox(height: 20,),

//             Neumorphic(
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.concave,
//                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//                 depth: -4,
//                 lightSource: LightSource.topLeft,
// //                    color: Colors.grey
//               ),
//               child: TextField(
//                 // controller: emailTec,
//                 decoration: InputDecoration(
//                     hintText: "Enter Password",
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left:10)
//                 ),
//                 obscureText: true,
//                 onChanged: (value){
//                   password = value;
//                 }
//               ),
//             ),

              // SizedBox(height: 20,),

//             Neumorphic(
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.concave,
//                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//                 depth: -4,
//                 lightSource: LightSource.topLeft,
// //                    color: Colors.grey
//               ),
//               child: TextField(
//                 // controller: passwordTec,
//                 decoration: InputDecoration(
//                     hintText: "Confirm Password",
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left:10)
//                 ),
//                 obscureText: true,
//                 onChanged: (value){
//                   confirmPassword = value;
//                 }
//               ),
//             ),

              SizedBox(
                height: 20,
              ),
              // AppUtils.loadingWidget(
              // stream:_bloc.registerStream(),
              // widget:
              NeumorphicButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (usercat != '') {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      signInwithGoogle(companyId);

                      // String user = _auth.currentUser!.uid.toString();
                      //
                      // if (isStudentPresent) {
                      //   var dbTimeKey = new DateTime.now();
                      //   var formatDate = new DateFormat('MMM d,yyyy');
                      //   var formatTime = new DateFormat('EEEE,hh:mm aaa');
                      //   String date = formatDate.format(dbTimeKey);
                      //   String time = formatTime.format(dbTimeKey);
                      //   String imageURL = await uploadFile(_file,dbTimeKey);
                      //   DocumentReference post = FirebaseFirestore.instance.collection('users').doc(user);
                      //   print('IMEFIKA');
                      //   post.set({'registration_no':regNumber,'image':imageURL,'campus':category,'privilege':'student','date':date,'time':time})
                      //       .then((value) => print('Post added'))
                      //       .then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                      //     // return LoginPage(Campus: category,);
                      //     return LoginPage();
                      //   })))
                      //       .catchError((error) => print('Failed to send post $error'));
                      // }

                    }
                  } else {
                    print('Invalid Index Number');
                  }
                  // user = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user.uid.toString();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //   return HomePage();
                  // }));
                },
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            "Register with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  color: Colors.blue,
                  depth: 0,
//                lightSource: LightSource.topLeft,
                ),
              ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  final picker = ImagePicker();
  pickImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _file = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  setProfile() async {
    String user = _auth.currentUser!.uid.toString();

    if (isStudentPresent) {
      var dbTimeKey = new DateTime.now();
      var formatDate = new DateFormat('MMM d,yyyy');
      var formatTime = new DateFormat('EEEE,hh:mm aaa');
      String date = formatDate.format(dbTimeKey);
      String time = formatTime.format(dbTimeKey);
      String imageURL = await uploadFile(_file, dbTimeKey);
      DocumentReference post =
          FirebaseFirestore.instance.collection('users').doc(user);
      print('IMEFIKA');
      post
          .set({
            'company': companyId,
            'image': imageURL,
            'campus': usercat,
            'privilege': 'client',
            'date': date,
            'time': time
          })
          .then((value) => print('Post added'))
          .then((value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                // return LoginPage(Campus: category,);
                return LoginPage();
              })))
          .catchError((error) => print('Failed to send post $error'));
    }
  }

  Future<String?> signInwithGoogle(String companyId) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).whenComplete(() {
        FirebaseFirestore.instance
            .collection('rns')
            .get()
            .then((querySnapshot) {
          int size = querySnapshot.docs.length;
          int index = 0;
          querySnapshot.docs.forEach((element) {
            if (companyId == element.get('number').toString()) {
              setState(() {
                isStudentPresent = true;
                setProfile();
                return;
              });
              return;
            } else if (index == size - 1) {
              Fluttertoast.showToast(
                  msg: "COMPANY ID NOT FOUND",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print('Company Id Not Found');
              setState(() {
                isLoading = false;
              });
            }
            index++;
            // queryDocumentSnapshot = querySnapshot;
            // currentDocumentId = element.id.toString();
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<String> uploadFile(File _image, var dbTimeKey) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(dbTimeKey.toString() + '.jpg');
    UploadTask uploadTasks = reference.putFile(_image);
    await uploadTasks.whenComplete(() async {
      try {
        imageUrl = await reference.getDownloadURL();
      } catch (onError) {
        print("Error");
      }
      print(imageUrl);
    });
    await reference.getDownloadURL().then((fileURL) => imageUrl = fileURL);
    return imageUrl;
  }

  Color dropTextColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }
}
