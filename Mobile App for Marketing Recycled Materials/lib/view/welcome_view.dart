import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial/utils/constants.dart';
import 'package:trial/view/sign_up_view.dart';
import 'package:trial/view/view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  Constants.textSmallSignUp,
                  style: TextStyle(color: Constants.kDarkGreyColor),
                ),
                SizedBox(height: size.height * 0.1),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView()),
                      );
                    },
                    child: const Text(Constants.textStart),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Constants.kPrimaryColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.kLightgreenColor),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()),
                      );
                    },
                    child: const Text(
                      Constants.textSignUpBtn,
                      style: TextStyle(color: Constants.kBlackColor),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.kGreyColor),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}