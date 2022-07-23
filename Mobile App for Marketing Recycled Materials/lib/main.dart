import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/config/app_router.dart';
import 'package:trial/config/theme.dart';
import 'package:trial/features/authentication/authentication/authentication_repository_impl.dart';
import 'package:trial/location/location_main.dart';
import 'package:trial/location/my_product_location.dart';
import 'package:trial/screens/profile/profile_screen.dart';
import 'package:trial/screens/profile_page/profile_page.dart';
import 'package:trial/screens/screens.dart';
import 'package:trial/view/home_view.dart';
import 'package:trial/view/sign_in_view.dart';
import 'app.dart';
import 'app_bloc_observer.dart';
import 'blocs/blocls.dart';
import 'features/authentication/bloc/authentication_bloc.dart';
import 'features/database/bloc/database_bloc.dart';
import 'features/database/database_repository_impl.dart';
import 'features/form-validation/bloc/form_bloc.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(AuthenticationRepositoryImpl())
                ..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) => FormBloc(
              AuthenticationRepositoryImpl(), DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(DatabaseRepositoryImpl()),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
        ),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
        // BlocProvider(
        //   create: (context) => CheckoutBloc(
        //     cartBloc: context.read<CartBloc>(),
        //     checkoutRepository: CheckoutRepository(),
        //   ),
        // ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            paymentBloc: context.read<PaymentBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trial',

        theme: theme(),

        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        // initialRoute: UploadPostPage.routeName,
        // initialRoute: HomeScreen.routeName,
        // initialRoute: HomeScreen.routeName,

        // home: SignInView(),
        //home: const App(),
        //initialRoute: App.routeName,
      ),
      // child: const App(),
    )),
    blocObserver: AppBlocObserver(),
  );
}
