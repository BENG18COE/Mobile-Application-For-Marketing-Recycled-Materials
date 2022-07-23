// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trial/blocs/wishlist/wishlist_bloc.dart';
// import 'package:trial/widgets/widgets.dart';
//
// class WishlistScreen extends StatelessWidget {
//   static const String routeName = '/wishlist';
//   static Route route() {
//     return MaterialPageRoute(
//         settings: RouteSettings(name: routeName),
//         builder: (_) => WishlistScreen());
//   }
//
//   const WishlistScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Wish List'),
//       bottomNavigationBar: CustomNavBar(
//         screen: routeName,
//       ),
//       body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
//         if (state is WishlistLoading) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (state is WishlistLoaded) {
//           return GridView.builder(
//             padding: EdgeInsets.symmetric(
//               horizontal: 8.0,
//               vertical: 16.0,
//             ),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//               childAspectRatio: 2.4,
//             ),
//             itemCount: state.wishlist.products.length,
//             itemBuilder: (BuildContext context, int index) {
//               // return Center(
//               //   child: ProductCard(
//               //     product: state.wishlist.products[index],
//               //     widthFactor: 1.1,
//               //     leftpostion: 100,
//               //     isWishlist: true,
//               //   ),
//               // );
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: GridView.builder(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 8.0, vertical: 16.0),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     childAspectRatio: 2.25,
//                   ),
//                   itemCount: state.wishlist.products.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Center(
//                       child: ProductCard.wishlist(
//                         product: state.wishlist.products[index],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         } else {
//           return Text('Something went Wrong');
//         }
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/blocs/wishlist/wishlist_bloc.dart';
import 'package:trial/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Wishlist'),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            if (state is WishlistLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.25,
                  ),
                  itemCount: state.wishlist.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ProductCard.wishlist(
                        product: state.wishlist.products[index],
                      ),
                    );
                  },
                ),
              );
            }
            return Text('Something went wrong!');
          },
        ));
  }
}