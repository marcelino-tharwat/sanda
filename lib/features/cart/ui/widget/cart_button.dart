import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/cart/data/model/product_card_model.dart';
import 'package:sanda/features/cart/logic/cart_cubit.dart';

class CartButtons extends StatefulWidget {
  ProductCardModel productCardModel;
  double total;
  CartButtons(
    this.total,
    this.productCardModel, {
    super.key,
  });

  @override
  State<CartButtons> createState() => _CartButtonsState();
}

class _CartButtonsState extends State<CartButtons> {
  // int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            context
                .read<CartCubit>()
                .removeFromCart(widget.productCardModel.id, 1);
            context.read<CartCubit>().getCart(1);
            setState(() {});
          },
          icon: const Icon(CupertinoIcons.trash),
          color: ColorsManager.mainBlue,
        ),
        verticalSpace(10),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.productCardModel.quantity > 0) {
                    widget.productCardModel.quantity--;
                  }
                });
              },
              icon: const Icon(CupertinoIcons.minus_circled),
              color: ColorsManager.mainBlue,
            ),
            horizontalSpace(6),
            Text(
              widget.productCardModel.quantity.toString(),
              style: TextStyles.font12mainBlueRegular,
            ),
            horizontalSpace(6),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.productCardModel.quantity++;
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
    );
  }
}
