part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  // TODO: implement props
  List<Object> get props => [];

  get cart => null;
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});

  List<Object> get props => [cart];
}

class CartError extends CartState {}
