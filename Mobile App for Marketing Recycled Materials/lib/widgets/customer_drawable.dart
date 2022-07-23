import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/view/view.dart';

import '../features/authentication/bloc/authentication_bloc.dart';

class CustomDrawer extends StatelessWidget {
  //static const routeName = '/routeName'; //for navigation route
  //bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailure) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const WelcomeView()),
              (Route<dynamic> route) => false);
        }
      },
      buildWhen: ((previous, current) {
        if (current is AuthenticationFailure) {
          return false;
        }
        return true;
      }),
      builder: (context, state) {
        return DrawerHeader(
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.lightGreen.shade900,
                          width: 4,
                        ),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new AssetImage(
                                'assets/images/friendship.png')))),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: new Text((state as AuthenticationSuccess).displayName!,
                      textScaleFactor: 1.5),
                )
              ],
            ),
            Divider(),
            ListTile(
              title: Text(
                (state as AuthenticationSuccess).userCategory!,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                (state as AuthenticationSuccess).userEmail!,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            // Divider(),
            // ListTile(
            //   title: Text(
            //     'location',
            //     style: TextStyle(color: Colors.black87),
            //   ),
            // ),
            Divider(),
            ListTile(
              onTap: () async {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationSignedOut());
              },
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Center(
              child: Text(
                'Marketing Recycled Materials',
                style: TextStyle(color: Colors.lightGreen.shade900),
              ),
            )
          ]),
        );
      },
    );
  }
}
