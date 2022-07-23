part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object> get props => [products];
}
