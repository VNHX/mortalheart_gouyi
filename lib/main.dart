
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/router/router.dart';
import 'package:mortalheart_gouyi/router/routing_constants.dart';
import 'package:mortalheart_gouyi/utils/sp_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        // 配置设计稿的宽度和高度
        // designSize: const Size(1080, 2400),
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        ///与键盘是否遮挡输入框有关
        rebuildFactor: RebuildFactors.sizeAndViewInsets,
        builder: (context, child) {
         return RefreshConfiguration(
             footerTriggerDistance: 15,
             dragSpeedRatio: 0.91,
             headerBuilder: () => const MaterialClassicHeader(),
            footerBuilder: () => const ClassicFooter(),
            enableLoadingWhenNoData: false,
            enableRefreshVibrate: false,
            enableLoadMoreVibrate: false,
            shouldFooterFollowWhenNotFull: (state) {
            // If you want load more with noMoreData state ,may be you should return false
            return false;
            },
          child:  GetMaterialApp(
                  debugShowCheckedModeBanner:false,
                  title: '快乐购',
                  theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                  ),
                 initialRoute: AppPages.INITIAL,
                 defaultTransition: Transition.rightToLeft,
                 getPages: AppPages.pages,
                 builder: EasyLoading.init(),
          ),
                );
    }
    );
  }
}