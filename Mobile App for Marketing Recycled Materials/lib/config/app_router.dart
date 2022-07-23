import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trial/app.dart';
import 'package:trial/models/models.dart';
import 'package:trial/screens/profile/profile_screen.dart';
import 'package:trial/screens/screens.dart';
import 'package:trial/view/home_view.dart';
import 'package:trial/widgets/widgets.dart';

import '../location/location_main.dart';
import '../location/my_product_location.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case '/cart':
        return CartScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case '/catalog':
        return CatalogScreen.route(category: settings.arguments as Category);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case '/product':
        return ProductScreen.route(product: settings.arguments as Product);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case '/wishlist':
        return WishlistScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case '/signup':
        return SignupScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case '/signin':
        return SigninScreen.route();
      case SigninScreen.routeName:
        return SigninScreen.route();
      case 'splash':
        return SplashScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case 'checkout':
        return CheckoutScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case 'newproduct':
        return NewProductScreen.route();
      case NewProductScreen.routeName:
        return NewProductScreen.route();

      //added for Auth
      case 'splashpage':
        return SplashPage.route();
      case SplashPage.routeName:
        return SplashPage.route();
      case 'registerpage':
        return RegisterPage.route();
      case RegisterPage.routeName:
        return RegisterPage.route();
      case 'loginpage':
        return LoginPage.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case 'upload':
        return UploadPostPage.route();
      case UploadPostPage.routeName:
        return UploadPostPage.route();
      case 'app':
        return App.route();
      case App.routeName:
        return App.route();
      case 'profile':
        return ProfileScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case 'homeview':
        return HomeView.route();
      case HomeView.routeName:
        return HomeView.route();
      case 'myploc':
        return MyProductLocation.route();
      case MyProductLocation.routeName:
        return MyProductLocation.route();
      case 'payment-selection':
        return PaymentSelection.route();
      case PaymentSelection.routeName:
        return PaymentSelection.route();
      case 'location':
        return LocationMain.route();
      case LocationMain.routeName:
        return LocationMain.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: CustomAppBar(title: 'Error'),
              bottomNavigationBar: customNavBar(),
            ));
  }
}
