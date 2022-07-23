import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  late String userCategory;
  var isPrivileged;
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => SplashScreen(
              isPrivileged: null,
              userCategory: '',
            ));
  }

  // static const String routeName = '/splash';
  SplashScreen(
      {Key? key, required this.userCategory, required this.isPrivileged})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Timer(Duration(seconds: 10), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Constants.statusBarColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/friendship.png"),
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: Constants.textIntro,
                          style: TextStyle(
                            color: Constants.kLightgreenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          )),
                      TextSpan(
                          text: Constants.textIntroDesc1,
                          style: TextStyle(
                              color: Constants.kDarkBlueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0)),
                      TextSpan(
                          text: Constants.textIntroDesc2,
                          style: TextStyle(
                              color: Constants.kLightgreenColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0)),
                    ])),
                SizedBox(height: size.height * 0.01),
                const Text(
                  Constants.textSmallWellcome,
                  style: TextStyle(color: Constants.kDarkGreyColor),
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ));
  }
}
