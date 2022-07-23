import 'package:equatable/equatable.dart';
import 'package:trial/models/models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  double deliveryFee(subtotal) {
    if (subtotal >= 200000) {
      return 0.0;
    } else {
      return subtotal * 0.1;
    }
  }

  String discountdelivery(subtotal) {
    if (subtotal >= 200000) {
      return 'You have a discount';
    } else {
      double missing = subtotal * 0.1;
      return 'you will pay normal delivery fees Tsh${missing} ';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get discountdeliveryString => discountdelivery(subtotal);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
}
