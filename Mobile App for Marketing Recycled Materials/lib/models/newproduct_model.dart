import 'dart:convert';

import 'package:equatable/equatable.dart';

class NewProduct extends Equatable {
  final int id;
  final String name;
  final String category;
  final String imageUrl;
  final String description;
  late final double price;
  final bool isRecommended;
  final bool isPopular;
  late final int quantity;

  NewProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    this.price = 0,
    required this.isRecommended,
    required this.isPopular,
    this.quantity = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      name,
      category,
      imageUrl,
      description,
      price,
      isRecommended,
      isPopular,
      quantity,
    ];
  }

  NewProduct copyWith(
    int? id,
    String? name,
    String? category,
    String? imageUrl,
    String? description,
    double? price,
    bool? isRecommended,
    bool? isPopular,
    int? quantity,
  ) {
    return NewProduct(
      id: id = this.id,
      name: name = this.name,
      category: category = this.category,
      imageUrl: imageUrl = this.imageUrl,
      description: description = this.description,
      price: price = this.price,
      isRecommended: isRecommended = this.isRecommended,
      isPopular: isPopular = this.isPopular,
      quantity: quantity = this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'quantity': quantity,
    };
  }

  factory NewProduct.fromMap(Map<String, dynamic> map) {
    return NewProduct(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        description: map['description'],
        price: map['price'],
        imageUrl: map['imageUrl'],
        isRecommended: map['isRecommended'],
        isPopular: map['isPopular'],
        quantity: map['quantity']);
  }

  String toJson() => jsonEncode(toMap());

  factory NewProduct.fromJson(String source) =>
      NewProduct.fromJson(jsonDecode(source));

  @override
  bool get Stringfy => true;

  static List<NewProduct> products = [
    NewProduct(
      name: 'simtank1',
      category: 'Dumped Plastic Tanks',
      imageUrl:
          'http://tanks.techno-plast.com/wp-content/uploads/2020/12/13-e1608183390693-480x480.jpg',
      price: 20000,
      isRecommended: true,
      isPopular: false,
      id: 1,
      quantity: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
    NewProduct(
      name: 'simtank2',
      category: 'Dumped Plastic Tanks',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyGhA4ITgxvqSdQkSIDYgbsZJZWqed_C80m_iKN49kSmoJDXt4ePHULoyKM9GwreZXV10&usqp=CAU',
      price: 60000,
      isRecommended: false,
      isPopular: true,
      id: 1,
      quantity: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
    NewProduct(
      name: 'cupper',
      category: 'Dumped Cars',
      imageUrl:
          'https://c8.alamy.com/comp/B5AXBW/crashed-cars-awaiting-breaking-at-a-car-scrapyard-october-1959-a823-B5AXBW.jpg',
      price: 150000,
      isRecommended: true,
      isPopular: true,
      id: 1,
      quantity: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
    NewProduct(
      name: 'old Toyota',
      category: 'Dumped Cars',
      imageUrl:
          'https://media.istockphoto.com/photos/old-rusty-car-body-picture-id686017202?s=612x612',
      price: 200000,
      isRecommended: false,
      isPopular: true,
      id: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
    NewProduct(
      name: 'Iron container',
      category: 'Unused Container',
      imageUrl:
          'https://assets.primecreative.com.au/imagegen/p/800/600/assets/momoads/2022/01/21/161501/IMG_0503.jpg',
      price: 400000,
      isRecommended: true,
      isPopular: true,
      id: 1,
      quantity: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
    NewProduct(
      name: 'Iron Container2',
      category: 'Unused Container',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFKcDwiy83_wHA9n_1xaPpg0_vevvaL09gvQ&usqp=CAU',
      price: 700000,
      isRecommended: false,
      isPopular: true,
      id: 1,
      quantity: 1,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi odio leo, rutrum at commodo non, consequat eu eros. Donec leo tortor, tincidunt at leo non, semper commodo orci. Curabitur ac nibh vel mauris vulputate mollis in in nibh. Aenean aliquam et ipsum sed fringilla. Duis elit sem, eleifend non sapien tincidunt, molestie eleifend dolor. Curabitur et sagittis velit. Sed tincidunt leo eu orci porttitor, a ullamcorper sem eleifend. Praesent eu convallis eros. Etiam placerat et libero ut sagittis. Mauris ultricies mi sed metus ultrices, quis pulvinar eros ultrices. Donec pellentesque massa nec dictum tristique.',
    ),
  ];
}
