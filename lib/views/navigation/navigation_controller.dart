
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_views.dart';
import 'package:mortalheart_gouyi/views/category/category_views.dart';
import 'package:mortalheart_gouyi/views/home/home_views.dart';
import 'package:mortalheart_gouyi/views/me/mie_views.dart';

class NavigationController extends GetxController {

  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    const HomeViews(),
    const CategoryViews(),
    const CartViews(),
    const MieViews(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //设置当前索引
  void setCurrentIndex(index) {
    print(index);
    currentIndex.value = index;
  }

}