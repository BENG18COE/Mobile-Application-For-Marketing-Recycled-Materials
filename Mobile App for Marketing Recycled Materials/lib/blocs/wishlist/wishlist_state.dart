part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
// TODO: implement props
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;
  const WishlistLoaded({this.wishlist = const Wishlist()});

  @override
// TODO: implement props
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
