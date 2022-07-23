import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String? description;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description,
    //another
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
    };
  }

  ProductModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.data()!["id"],
        name = doc.data()!["name"],
        category = doc.data()!["category"],
        imageUrl = doc.data()!["imageUrl"],
        price = doc.data()!["price"],
        isRecommended = doc.data()!["isRecommended"],
        isPopular = doc.data()!["isPopular"],
        description = doc.data()!["description"];

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    String? imageUrl,
    double? price,
    bool? isRecommended,
    bool? isPopular,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isPopular: isPopular ?? this.isPopular,
      isRecommended: isRecommended ?? this.isRecommended,
      description: description ?? this.description,
    );
  }
}
