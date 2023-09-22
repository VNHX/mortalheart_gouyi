
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_controller.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_ListViews.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_goodsListView.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget cartContentView (BuildContext context, CartController controller) {
  return GetBuilder<CartController>(
        init: controller,


        initState: (state) {
          print("*---*>:CartView GetBuilder -initState");
          print(state);

          ///这里每次update都会执行
          controller.getLocalCartList();
        },
        didChangeDependencies: (state) {
          print("*---*>:CartView GetBuilder -didChangeDependencies");
          print(state);
        },
        didUpdateWidget: (oldWidget, state) {
          print("*---*>:CartView GetBuilder -didUpdateWidget");
          print(state);
        },
        dispose: (state) {
          print("*---*>:CartView GetBuilder -dispose");
          print(state);
        },
        builder: (controller) {
           return controller.cartList.isNotEmpty
              ? Stack(
            children: [
              cartListViews(context,controller),
            ],
          )
              : ListView(children: [
            commonEmptyView("购物车空空如也"),
             cartGoodsListView(context, controller)
          ]);;
        },
  );
}