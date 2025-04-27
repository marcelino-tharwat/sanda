import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/font_weight_helper.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/cart/data/model/product_card_model.dart';
import 'package:sanda/features/cart/logic/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0.0;
  @override
  void initState() {
    super.initState();
    // ننده كل مرة الشاشة تفتح
    context.read<CartCubit>().getCart(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              current is GetCartSuccess ||
              current is CartFailed ||
              current is CartLoading,
          builder: (context, state) {
            List<ProductCardModel> productList = [];

            if (state is GetCartSuccess) {
              productList = state.productList;
              total = productList.fold<double>(
                  0.0, (sum, item) => sum + (item.price * item.quantity));
            }

            return Column(
              children: [
                // الجزء المتحرك
                Expanded(
                  child: _buildCartContent(state, productList),
                ),
                // الجزء الثابت الخاص بـ checkout
                _buildCheckoutSection(total, productList.length),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCartContent(
      CartState state, List<ProductCardModel> productList) {
    if (state is CartLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is GetCartSuccess) {
      if (productList.isEmpty) {
        return Center(
          child: Text(
            'Your cart is empty 🛒',
            style: TextStyles.font13darkGrayRegular,
          ),
        );
      }

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            Text(
              'Cart',
              style: TextStyles.font13mainBlueRegular.copyWith(
                  fontWeight: FontWeightHelper.extra_bold, fontSize: 18.sp),
            ),
            verticalSpace(30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          height: 52.h,
                          width: 52.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                            child: Image.asset(
                              'assets/images/nursing.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productList[index].name,
                              style: TextStyles.font13BlckRegular
                                  .copyWith(fontWeight: FontWeightHelper.Bold),
                            ),
                            Text(
                              productList[index].price.toString() + " \$",
                              style: TextStyles.font12darkGrayRegular
                                  .copyWith(fontWeight: FontWeightHelper.Bold),
                            ),
                            Text(
                              productList[index].description ?? '',
                              style: TextStyles.font12darkGrayRegular
                                  .copyWith(fontWeight: FontWeightHelper.Bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CartCubit>()
                                    .removeFromCart(productList[index].id, 1);
                                context.read<CartCubit>().getCart(1);
                                setState(() {});
                              },
                              icon: const Icon(CupertinoIcons.trash),
                              color: ColorsManager.mainBlue,
                            ),
                            verticalSpace(10),
                            Row(
                              children: [
                                productList[index].quantity <= 1
                                    ? Opacity(
                                        opacity: 0.5,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              CupertinoIcons.minus_circled),
                                          color: ColorsManager.mainBlue,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (productList[index].quantity >
                                                0) {
                                              productList[index].quantity--;
                                              total = productList.fold<double>(
                                                  0.0,
                                                  (sum, item) =>
                                                      sum +
                                                      (item.price *
                                                          item.quantity));
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                            CupertinoIcons.minus_circled),
                                        color: ColorsManager.mainBlue,
                                      ),
                                horizontalSpace(6),
                                Text(
                                  productList[index].quantity.toString(),
                                  style: TextStyles.font12mainBlueRegular,
                                ),
                                horizontalSpace(6),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      productList[index].quantity++;
                                      total = productList.fold<double>(
                                          0.0,
                                          (sum, item) =>
                                              sum +
                                              (item.price * item.quantity));
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.plus_circled,
                                  ),
                                  color: ColorsManager.mainBlue,
                                ),
                              ],
                            ),
                          ],
                        )
                        // CartButtons(total, productList[index]),
                      ],
                    ),
                    index == productList.length - 1
                        ? const SizedBox.shrink()
                        : const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      );
    } else if (state is CartFailed) {
      return Center(child: Text(state.errorMessage));
    } else {
      return const Center(
        child: Text('No cart data available'),
      );
    }
  }

  Widget _buildCheckoutSection(double total, int itemCount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Items',
                style: TextStyles.font13darkGrayRegular
                    .copyWith(fontWeight: FontWeightHelper.Bold),
              ),
              const Spacer(),
              Text(
                itemCount.toString(),
                style: TextStyles.font13blackRegular
                    .copyWith(fontWeight: FontWeightHelper.Bold),
              ),
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyles.font13darkGrayRegular
                    .copyWith(fontWeight: FontWeightHelper.Bold),
              ),
              const Spacer(),
              Text(
                total.toStringAsFixed(2),
                style: TextStyles.font13blackRegular
                    .copyWith(fontWeight: FontWeightHelper.Bold),
              ),
            ],
          ),
          verticalSpace(30),
          itemCount > 0
              ? AppTextButton(
                  bottonText: 'Checkout',
                  onPressed: () {
                    // أضف منطق الـ checkout هنا
                  },
                )
              : Opacity(
                  opacity: 0.5, // جعلها تبدو معطلة
                  child: AppTextButton(
                    bottonText: 'Checkout',
                    onPressed: () {
                      // لا تفعل شيئًا
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
