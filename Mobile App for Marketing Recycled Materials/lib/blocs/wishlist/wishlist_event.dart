part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadWishlist extends WishlistEvent {}

class AddProductToWishlist extends WishlistEvent {
  final Product product;

  const AddProductToWishlist(this.product);

  List<Object> get props => [product];
}

class RemoveProductFromWishlist extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishlist(this.product);

  List<Object> get props => [product];
}
