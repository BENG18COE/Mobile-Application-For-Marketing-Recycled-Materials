import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trial/screens/screens.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginpage';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => LoginPage());
  }

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email, password;
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var userCategory = '';
  var currentUser = '';
  bool isPrivileged = false;
  bool areYouRegistered = true;
  bool tryAgain = false;
  bool isLoading = false;
  late String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
          ? Colors.black12
          : Colors.white,
      appBar: NeumorphicAppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Text(''),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40,
                ),

                Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    color: Colors.white,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 0,
                    lightSource: LightSource.topLeft,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 180,
                    width: 180,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: Image.asset(
                      'assets/images/friendship.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                //             Neumorphic(
                //               style: NeumorphicStyle(
                //                 shape: NeumorphicShape.concave,
                //                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //                 depth: -4,
                //                 lightSource: LightSource.topLeft,
                // //                    color: Colors.grey
                //               ),
                //               child: TextFormField(
                //                   validator: MultiValidator([RequiredValidator(errorText: '*Required'),EmailValidator(errorText: 'Enter valid email')]),
                //                   decoration: InputDecoration(
                //                       hintText: "Enter Email",
                //                       border: InputBorder.none,
                //                       contentPadding: EdgeInsets.only(left:10)
                //                   ),
                //                   onSaved: (value){
                //                     email = value;
                //                   }
                //               ),
                //             ),
                //             SizedBox(height: 20,),
                //             Neumorphic(
                //               style: NeumorphicStyle(
                //                 shape: NeumorphicShape.concave,
                //                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                //                 depth: -4,
                //                 lightSource: LightSource.topLeft,
                // //                    color: Colors.grey
                //               ),
                //               child: TextFormField(
                //                   validator: MultiValidator([RequiredValidator(errorText: '*Required'),MinLengthValidator(6, errorText: 'Password should be at least 6')]),
                //                   decoration: InputDecoration(
                //                       hintText: "Enter Password",
                //                       border: InputBorder.none,
                //                       contentPadding: EdgeInsets.only(left:10)
                //                   ),
                //                   obscureText: true,
                //                   onChanged: (value){
                //                     password = value;
                //                   }
                //               ),
                //             ),
                //             SizedBox(height: 30,),
                NeumorphicButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // if(formkey.currentState!.validate()){
                    //   formkey.currentState!.save();
                    //   String? user;
                    //   if(email.toString().isNotEmpty && password.toString().isNotEmpty){
                    //     user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user.uid.toString();
                    //   }
                    //   if (user!=null) {
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    //       return HomePage();
                    //     }));
                    //   }
                    // }
                    signInwithGoogle();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
                SizedBox(
                  height: 20,
                ),

                !areYouRegistered
                    ? Neumorphic(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "ARE YOU REGISTERED!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          color: Colors.blue,
                          depth: 0,
                          //                lightSource: LightSource.topLeft,
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),

                SizedBox(
                  height: 20,
                ),
                NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
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
                )
              ],
            ),
          )),
    );
  }

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((value) async {
        currentUser = _auth.currentUser!.uid;
        user = _auth.currentUser!.uid.toString();
        isUserRegistered(user);
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        areYouRegistered = false;
        isLoading = false;
      });
      print(e.message);
      throw e;
    }
  }

  Future<void> isUserRegistered(String user) async {
    try {
      DocumentSnapshot ds =
          await FirebaseFirestore.instance.collection('users').doc(user).get();

      if (ds.exists) {
        setState(() async {
          // currentUser = FirebaseAuth.instance.currentUser!.uid;
          FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.toString())
              .get()
              .then((querySnapshot) {
            String privilege = querySnapshot.get('privilege').toString();
            if (privilege == 'master') {
              isPrivileged = true;
              print(privilege + "..hii ndio.." + isPrivileged.toString());
            }
            // querySnapshot.docs.forEach((element) {
            //   String privilege = element.get('privilege').toString();
            //   if(privilege != 'student'){
            //     isPrivileged = true;
            //   }
            // });
          });

          areYouRegistered = true;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user)
              .get()
              .then((value) {
            userCategory = value.get('userCategory');
            setState(() {
              userCategory = value.get('userCategory');
            });
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return SplashScreen(
                userCategory: userCategory,
                isPrivileged: isPrivileged,
              );
            }));
          });
        });
      } else {
        setState(() {
          areYouRegistered = false;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        areYouRegistered = false;
        isLoading = false;
      });
    }
  }
}
