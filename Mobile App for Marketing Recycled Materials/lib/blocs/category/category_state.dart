part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({this.categories = const <Category>[]});

  @override
  // TODO: implement props
  List<Object> get props => [categories];
}
