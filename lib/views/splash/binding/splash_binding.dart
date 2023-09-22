
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_controller.dart';
import 'package:mortalheart_gouyi/views/category/category_controller.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';
import 'package:mortalheart_gouyi/views/navigation/navigation_controller.dart';
import 'package:mortalheart_gouyi/views/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(
          NavigationController(),
    );
    /// 首页
    Get.put<HomeController>( HomeController(),);
    /// 分类
    Get.put<CategoryController>(
         CategoryController(),
    );
    ///:购物车
    Get.put<CartController>(
           CartController(),
    );
    ///:我的
    Get.put<MieController>(
          MieController(),
    );
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );

  }
}