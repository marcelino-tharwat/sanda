part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<ProductOrServiceModel> categoryList;

  CategorySuccess({required this.categoryList});
}

final class CategoryFailure extends CategoryState {

  final String errorMessage;

  CategoryFailure({required this.errorMessage});
}
