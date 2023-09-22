
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_controller.dart';
import 'package:mortalheart_gouyi/views/category/category_controller.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';
import 'package:mortalheart_gouyi/views/navigation/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
          () => NavigationController(),
    );
    /// 首页
    Get.lazyPut<HomeController>(() => HomeController(),);
    /// 分类
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
    ///:购物车
    Get.lazyPut<CartController>(
          () => CartController(),
      fenix: true,
    );
    ///:我的
    Get.lazyPut<MieController>(
          () => MieController(),
      fenix: true,
    );
  }
}
