import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/features/cart/data/model/product_card_model.dart';
import 'package:sanda/features/cart/data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());

  ///add to cart
  Future<void> addToCart(int productId, int userId) async {
    emit(CartLoading());
    var response = await cartRepo.addToCart(productId, userId);
    response.fold(
      (failer) {
        emit(CartFailed(errorMessage: failer.errorMessage));
      },
      (message) {
        emit(AddToCartSuccess(message: message));
      },
    );
  }

  ///get cart
  Future<void> getCart(int userId) async {
    emit(CartLoading());
    var response = await cartRepo.getCart(userId);
    response.fold(
      (failure) {
        if (!isClosed) {
          emit(CartFailed(errorMessage: failure.errorMessage));
        }
      },
      (productList) {
        if (!isClosed) {
          emit(GetCartSuccess(productList: productList));
        }
      },
    );
  }

  ///remove from cart
  Future<void> removeFromCart(int productId, int userId) async {
    emit(CartLoading());
    var response = await cartRepo.removeFromCart(productId, userId);
    response.fold(
      (failer) {
        emit(CartFailed(errorMessage: failer.errorMessage));
      },
      (message) {
        emit(RemoveFromCartSuccess(message: message));
      },
    );
  }

  @override
  Future<void> close() {
    // هنا لو فيه أي حاجة عايزين ننظفها قبل ما نقفل الـ Cubit.
    return super.close();
  }
}
