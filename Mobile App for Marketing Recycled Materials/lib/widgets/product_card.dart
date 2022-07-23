import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/blocs/cart/cart_bloc.dart';
import 'package:trial/models/models.dart';

import '../blocs/blocls.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final double widthFactor;
//   final double leftpostion;
//   final bool isWishlist;
//   const ProductCard({
//     Key? key,
//     required this.product,
//     this.widthFactor = 2.5,
//     this.leftpostion = 5,
//     this.isWishlist = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final double widthvalue = MediaQuery.of(context).size.width / widthFactor;
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, '/product', arguments: product);
//       },
//       child: Stack(
//         children: [
//           Container(
//             width: widthvalue,
//             height: 150,
//             child: Image.network(
//               product.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: 60,
//             left: leftpostion,
//             child: Container(
//               width: widthvalue - 5 - leftpostion,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: Colors.black.withAlpha(50),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 65,
//             left: leftpostion + 5,
//             child: Container(
//               width: widthvalue - 15 - leftpostion,
//               height: 70,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 3,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.name,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline5!
//                                 .copyWith(color: Colors.white),
//                           ),
//                           Text(
//                             'Tsh${product.price}',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline6!
//                                 .copyWith(color: Colors.white),
//                           )
//                         ],
//                       ),
//                     ),
//                     BlocBuilder<CartBloc, CartState>(
//                       builder: (context, state) {
//                         if (state is CartLoading) {
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                         if (state is CartLoaded) {
//                           return Expanded(
//                             child: IconButton(
//                               onPressed: () {
//                                 context
//                                     .read<CartBloc>()
//                                     .add(AddProduct(product));
//                                 final snackBar = SnackBar(
//                                     content: Text('added to your Cartlist'));
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               },
//                               icon: Icon(
//                                 Icons.add_circle,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Text('something went wrong');
//                         }
//                       },
//                     ),
//                     isWishlist
//                         ? Expanded(
//                             child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.delete,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )
//                         : SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class ProductCard extends StatelessWidget {
  const ProductCard.catalog({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.25,
    this.height = 250,
    this.isCatalog = true,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.wishlist({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.1,
    this.height = 150,
    this.isCatalog = false,
    this.isWishlist = true,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.cart({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = true,
    this.isSummary = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ProductCard.summary({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Product product;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final bool isSummary;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        if (isCatalog || isWishlist)
          Navigator.pushNamed(
            context,
            '/product',
            arguments: product,
          );
      },
      child: isCart || isSummary
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: 100,
                    height: height,
                    product: product,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductInformation(
                      product: product,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary: isSummary ? true : false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProductActions(
                    product: product,
                    isCatalog: isCatalog,
                    isWishlist: isWishlist,
                    isCart: isCart,
                    iconColor: iconColor,
                    quantity: quantity,
                  )
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth,
                  height: height,
                  product: product,
                ),
                ProductBackground(
                  adjWidth: adjWidth,
                  widgets: [
                    ProductInformation(
                      product: product,
                      fontColor: fontColor,
                    ),
                    ProductActions(
                      product: product,
                      isCatalog: isCatalog,
                      isWishlist: isWishlist,
                      isCart: isCart,
                      iconColor: iconColor,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjWidth,
    required this.height,
    required this.product,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth,
      height: height,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.product,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 85,
              child: Text(
                product.name,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: fontColor),
              ),
            ),
            Text(
              'Tsh${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: fontColor),
            ),
          ],
        ),
        isOrderSummary
            ? Text(
                'Qty. $quantity',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: fontColor),
              )
            : const SizedBox(),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  ProductActions({
    Key? key,
    required this.product,
    required this.isCatalog,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (state is CartLoaded) {
          ElevatedButton addProduct = ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to your Cart!'),
                ),
              );
              context.read<CartBloc>().add(AddProduct(product));
            },
            child: Text('add'),
          );

          ElevatedButton removeProduct = ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Cart!'),
                ),
              );
              context.read<CartBloc>().add(RemoveProduct(product));
            },
            child: Text('remove'),
          );

          // IconButton removeFromWishlist = IconButton(
          //   icon: Icon(
          //     Icons.delete,
          //     color: iconColor,
          //   ),
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text('Removed from your Wishlist!'),
          //       ),
          //     );
          //     context
          //         .read<WishlistBloc>()
          //         .add(RemoveProductFromWishlist(product));
          //   },
          // );
          ElevatedButton removeFromWishlist = ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Wishlist!'),
                ),
              );
              context
                  .read<WishlistBloc>()
                  .add(RemoveProductFromWishlist(product));
            },
            child: Text('remove'),
          );

          Text productQuantity = Text(
            '$quantity',
            style: Theme.of(context).textTheme.headline4,
          );

          if (isCatalog) {
            return Row(children: [addProduct]);
          } else if (isWishlist) {
            return Row(children: [
              addProduct,
              SizedBox(
                width: 2,
              ),
              removeFromWishlist
            ]);
          } else if (isCart) {
            return Row(children: [removeProduct, productQuantity, addProduct]);
          } else {
            return SizedBox();
          }
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: Colors.lightGreen[900]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}
