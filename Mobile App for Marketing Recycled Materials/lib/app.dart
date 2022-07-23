import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/features/authentication/bloc/authentication_bloc.dart';
import 'package:trial/screens/screens.dart';
import 'package:trial/utils/constants.dart';
import 'package:trial/view/view.dart';

class App extends StatelessWidget {
  static const String routeName = '/app';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => App());
  }

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BlocNavigate(),
        title: Constants.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const HomeScreen();
        } else {
          return const WelcomeView();
        }
      },
    );
  }
}
