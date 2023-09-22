import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_views.dart';
import 'package:mortalheart_gouyi/views/details/active_page/binding/active_binding.dart';
import 'package:mortalheart_gouyi/views/details/active_page/active_views.dart';
import 'package:mortalheart_gouyi/views/details/openScan/binding/scan_binding.dart';
import 'package:mortalheart_gouyi/views/details/openScan/scan_views.dart';
import 'package:mortalheart_gouyi/views/details/search_page/binding/search_binding.dart';
import 'package:mortalheart_gouyi/views/details/search_page/search_views.dart';
import 'package:mortalheart_gouyi/views/goodsContent/binding/goods_content_binding.dart';
import 'package:mortalheart_gouyi/views/goodsContent/goods_content_views.dart';
import 'package:mortalheart_gouyi/views/login/accountPasswordLogin/account_password_login_views.dart';
import 'package:mortalheart_gouyi/views/login/accountPasswordLogin/binding/account_password_login_binding.dart';
import 'package:mortalheart_gouyi/views/login/oneClickLogin/binding/one_click_login_binding.dart';
import 'package:mortalheart_gouyi/views/login/oneClickLogin/one_click_login_view.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/binding/verification_code_login_binding.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/verification_code_login_views.dart';
import 'package:mortalheart_gouyi/views/message/binding/message_binding.dart';
import 'package:mortalheart_gouyi/views/message/message_views.dart';
import 'package:mortalheart_gouyi/views/navigation/binding/navigation_binding.dart';
import 'package:mortalheart_gouyi/views/navigation/navigation_views.dart';
import 'package:mortalheart_gouyi/views/sign_in/binding/sign_in_binding.dart';
import 'package:mortalheart_gouyi/views/sign_in/sign_in_views.dart';
import 'package:mortalheart_gouyi/views/splash/binding/splash_binding.dart';
import 'package:mortalheart_gouyi/views/splash/splash_page.dart';
import 'routing_constants.dart';

/// 路由管理
/// 如何拦截要登录的页面？
/// 只需要在 GetPage 里面加上 middlewares: [RouteAuthMiddleware(priority: 1),] 即可
abstract class AppPages {
  static const INITIAL = Routes.splashRoute;
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.navigationRoute,
        page: ()=> const NavigationViews(),
        binding:NavigationBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.activeRoute,
      page:()=>const ActiveViews(),
      binding: ActiveBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.cartRoute,
      page: () => const CartViews(),
    ),
    GetPage(
      name: Routes.searchRoute,
      page: () => const SearchViews(),
      binding: SearchBinding(),
      transition: Transition.fadeIn, //进入搜索页面的动画特殊定义
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.scanRoute,
      page: () => const ScanViews(),
      transition: Transition.rightToLeft,
      binding: ScanBinding(),
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: ()=> const SignInViews(),
      binding: SignInBinding(),
      transition: Transition.fadeIn, //进入搜索页面的动画特殊定义
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.goodsContentRoute,
      page: () => const GoodsContentViews(),
      binding: GoodsContentBinding(),
    ),
    GetPage(
      name: Routes.messageRoute,
      page: ()=> const MessageViews(),
      binding: MessageBinding()
    ),
    GetPage(
      name: Routes.oneClickLoginRoute,
      page: () => const OneClickLoginView(),
      binding: OneClickLoginBinding()
    ),
    GetPage(
      name: Routes.verificationCodeLoginRoute,
      page: () => const VerificationCodeLoginViews(),
      binding:VerificationCodeLoginBinding(),
    ),
    GetPage(
      name: Routes.accountPasswordLoginRoute,
      page: () => const AccountPasswordLoginViews(),
      binding: AccountPasswordLoginBinding(),
    )
  ];
}
