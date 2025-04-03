import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/data/repo/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  Future<void> getCategory({required String categoryName}) async {
    emit(CategoryLoading());
    var response = await categoryRepo.getCategory(categoryName: categoryName);
    response.fold(
      (failure) => emit(
        CategoryFailure(errorMessage: failure.errorMessage),
      ),
      (categoryList) => emit(
        CategorySuccess(categoryList: categoryList),
      ),
    );
  }
}
