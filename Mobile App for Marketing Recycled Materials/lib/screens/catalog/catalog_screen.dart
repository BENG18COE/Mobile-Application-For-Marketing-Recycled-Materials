import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/blocs/blocls.dart';
import 'package:trial/models/models.dart';
import 'package:trial/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (state is ProductLoaded) {
            final List<Product> categoryProducts = state.products
                .where((product) => product.category == category.name)
                .toList();

            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                // return Center(
                //   child: ProductCard(
                //     product: categoryProducts[index],
                //   ),
                // );

                return Center(
                  child: ProductCard.catalog(
                    product: categoryProducts[index],
                  ),
                );
              },
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}

// class CatalogScreen extends StatelessWidget {
//   static const String routeName = '/catalog';
//   static Route route({required Category category}) {
//     return MaterialPageRoute(
//         settings: RouteSettings(name: routeName),
//         builder: (_) => CatalogScreen(category: category));
//   }
//
//   final Category category;
//   const CatalogScreen({Key? key, required this.category}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Product> categoryProducts = Product.product
//         .where((product) => product.category == category.name)
//         .toList();
//     return Scaffold(
//       appBar: CustomAppBar(title: category.name),
//       bottomNavigationBar: customNavBar(),
//       body: GridView.builder(
//         padding: EdgeInsets.symmetric(
//           horizontal: 8.0,
//           vertical: 16.0,
//         ),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.15,
//         ),
//         itemCount: categoryProducts.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Center(
//             child: ProductCard(
//               product: categoryProducts[index],
//               widthFactor: 2.2,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
