part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddProduct extends CartEvent {
  final Product product;

  const AddProduct(this.product);

  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product product;

  const RemoveProduct(this.product);

  List<Object> get props => [product];
}
