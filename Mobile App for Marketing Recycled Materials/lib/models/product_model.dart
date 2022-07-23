import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

// class Product extends Equatable {
//   final String id;
//   final String name;
//   final String category;
//   final String imageUrl;
//   final double price;
//   final bool isRecommended;
//   final bool isPopular;
//   final String? description;
//
//   const Product({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.imageUrl,
//     required this.price,
//     required this.isRecommended,
//     required this.isPopular,
//     this.description,
//   });
//
//   static Product fromSnapshot(DocumentSnapshot snap) {
//     Product product = Product(
//       id: snap.id,
//       name: snap['name'],
//       category: snap['category'],
//       imageUrl: snap['imageUrl'],
//       price: snap['price'],
//       isRecommended: snap['isRecommended'],
//       isPopular: snap['isPopular'],
//       description: snap['description'],
//     );
//     return product;
//   }
//
//   @override
//   List<Object?> get props => [
//         id,
//         name,
//         category,
//         imageUrl,
//         price,
//         isRecommended,
//         isPopular,
//         description,
//       ];
// }

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      description: snap['description'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        description,
      ];
}

// static List<Product> products = [
//   Product(
//     name: 'simtank1',
//     category: 'Dumped Plastic Tanks',
//     imageUrl:
//         'http://tanks.techno-plast.com/wp-content/uploads/2020/12/13-e1608183390693-480x480.jpg',
//     price: 20000,
//     isRecommended: true,
//     isPopular: false,
//   ),
//   Product(
//     name: 'simtank2',
//     category: 'Dumped Plastic Tanks',
//     imageUrl:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyGhA4ITgxvqSdQkSIDYgbsZJZWqed_C80m_iKN49kSmoJDXt4ePHULoyKM9GwreZXV10&usqp=CAU',
//     price: 60000,
//     isRecommended: false,
//     isPopular: true,
//   ),
//   Product(
//     name: 'cupper',
//     category: 'Dumped Cars',
//     imageUrl:
//         'https://c8.alamy.com/comp/B5AXBW/crashed-cars-awaiting-breaking-at-a-car-scrapyard-october-1959-a823-B5AXBW.jpg',
//     price: 150000,
//     isRecommended: true,
//     isPopular: true,
//   ),
//   Product(
//     name: 'old Toyota',
//     category: 'Dumped Cars',
//     imageUrl:
//         'https://media.istockphoto.com/photos/old-rusty-car-body-picture-id686017202?s=612x612',
//     price: 200000,
//     isRecommended: false,
//     isPopular: true,
//   ),
//   Product(
//     name: 'Iron container',
//     category: 'Unused Container',
//     imageUrl:
//         'https://assets.primecreative.com.au/imagegen/p/800/600/assets/momoads/2022/01/21/161501/IMG_0503.jpg',
//     price: 400000,
//     isRecommended: true,
//     isPopular: true,
//   ),
//   Product(
//     name: 'Iron Container2',
//     category: 'Unused Container',
//     imageUrl:
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFKcDwiy83_wHA9n_1xaPpg0_vevvaL09gvQ&usqp=CAU',
//     price: 700000,
//     isRecommended: false,
//     isPopular: true,
//   ),
//   // ];
// }
