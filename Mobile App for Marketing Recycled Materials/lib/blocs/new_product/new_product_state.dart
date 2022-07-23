// part of 'new_product_bloc.dart';
//
// abstract class NewProductState extends Equatable {
//   const NewProductState();
// }
//
// class NewProductInitiate extends NewProductState {
//   @override
//   List<Object?> get props => [];
// }
//
// class NewProductUpload extends NewProductState {
//   NewProductUpload(
//       {required this.name,
//       required this.category,
//       required this.imageUrl,
//       required this.description,
//       required this.price,
//       required this.isRecommended,
//       required this.isPopular,
//       required this.quantity});
//
//   final String name;
//   final String category;
//   final String imageUrl;
//   final String description;
//   final double price;
//   final bool isRecommended;
//   final bool isPopular;
//   int quantity;
//
//   NewProductUpload copyWith({
//     String? name,
//     String? category,
//     String? imageUrl,
//     String? description,
//     double? price,
//     bool? isRecommended,
//     bool? isPopular,
//     int? quality,
//   }) {
//     return NewProductUpload(
//         name: name = this.name,
//         category: category = this.category,
//         imageUrl: imageUrl = this.imageUrl,
//         description: description = this.description,
//         price: price = this.price,
//         isRecommended: isRecommended = this.isRecommended,
//         isPopular: isPopular = this.isPopular,
//         quantity: quantity = this.quantity);
//   }
//
//   @override
//   List<Object?> get props => [
//         name,
//         category,
//         imageUrl,
//         description,
//         price,
//         isRecommended,
//         isPopular,
//         quantity,
//       ];
// }
