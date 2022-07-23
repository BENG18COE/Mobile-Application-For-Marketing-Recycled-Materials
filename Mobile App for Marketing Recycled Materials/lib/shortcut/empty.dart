import 'package:flutter/material.dart';
import 'package:trial/widgets/widgets.dart';

class Empty extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => Empty());
  }

  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wish List'),
      bottomNavigationBar: customNavBar(),
    );
  }
}
