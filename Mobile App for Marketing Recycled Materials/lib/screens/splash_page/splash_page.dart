// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:trial/screens/screens.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splashpage';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => SplashPage());
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userCategory = '';
  bool isPrivileged = false;

  initState() {
    super.initState();
    isUserSignedIn();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> isUserSignedIn() async {
    String? user;
    try {
      user = await auth.currentUser!.uid.toString();

      FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .get()
          .then((querySnapshot) {
        String privilege = querySnapshot.get('privilege').toString();
        if (privilege == 'master') {
          isPrivileged = true;
          print(privilege + "..hii ndio.." + isPrivileged.toString());
        }
      });

      DocumentSnapshot ds =
          await FirebaseFirestore.instance.collection('users').doc(user).get();
      userCategory = ds.get('userCategory');
      setState(() {
        userCategory = ds.get('userCategory');
      });
    } catch (e) {}
    Future.delayed(Duration(seconds: 3), () {
      if (user != null && userCategory != '') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return SplashScreen(
            userCategory: userCategory,
            isPrivileged: isPrivileged,
          );
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return LoginPage();
        }));
      }
    });

    // setState(() {
    //   if(user != null)
    //   {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    //       return HomePage();
    //     }));
    //   }else{
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    //       return LoginPage();
    //     }));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.indigo.shade900,
              Colors.indigo.shade900,
              Colors.indigo.shade900
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                color: Colors.white,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 0,
                lightSource: LightSource.topLeft,
              ),
              child: Container(
                margin: EdgeInsets.all(8),
                height: 200,
                width: 200,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                ),
                child: Image.asset(
                  'assets/images/friendship.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
