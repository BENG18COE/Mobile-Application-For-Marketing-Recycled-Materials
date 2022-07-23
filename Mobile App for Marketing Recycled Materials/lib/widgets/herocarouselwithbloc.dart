// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trial/blocs/blocls.dart';
// import 'package:trial/models/models.dart';
//
// class HeroCarouselCard extends StatelessWidget {
//   final Category? category;
//   final Product? product;
//   const HeroCarouselCard({
//     Key? key,
//     this.category,
//     this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
//       if (state is ProductLoading) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//
//       if (state is ProductLoaded) {
//         return InkWell(
//           onTap: () {
//             if (this.product == null) {
//               Navigator.pushNamed(
//                 context,
//                 '/catalog',
//                 arguments: category,
//               );
//             }
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 5.0,
//               vertical: 20,
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(5.0)),
//               child: Stack(
//                 children: <Widget>[
//                   Image.network(
//                     product == null ? category!.imageUrl : product!.imageUrl,
//                     fit: BoxFit.cover,
//                     width: 1000.0,
//                   ),
//                   Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(200, 0, 0, 0),
//                             Color.fromARGB(0, 0, 0, 0)
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 20.0),
//                       child: Text(
//                         product == null ? category!.name : '',
//                         style: Theme.of(context).textTheme.headline2!.copyWith(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       } else {
//         return Text('Something Went Wrong');
//       }
//     });
//   }
// }