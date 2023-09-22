import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/navigation/navigation_controller.dart';

class NavigationViews extends GetView<NavigationController> {
  const NavigationViews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              enableFeedback: false,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor:GouyiColors.string2Color('#666EE8'),
              unselectedItemColor: Colors.black,
              currentIndex: controller.currentIndex.value,
              selectedLabelStyle:
                  TextStyle(fontSize: GouyiScreenAdapter.fs(14)),
              unselectedLabelStyle:
                  TextStyle(fontSize: GouyiScreenAdapter.fs(14)),
              onTap: (value) {
                controller.setCurrentIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: assetImage(GouyiFontIcon.home, GouyiScreenAdapter.w(25),
                      GouyiScreenAdapter.h(20)),
                  activeIcon: assetImage(GouyiFontIcon.homeActive,
                      GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                  label: "首页",
                ),
                BottomNavigationBarItem(
                    icon: assetImage(GouyiFontIcon.category,
                        GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                    activeIcon: assetImage(GouyiFontIcon.categoryActive,
                        GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                    label: "分类"),
                BottomNavigationBarItem(
                    icon: badges.Badge(
                      position: badges.BadgePosition.topEnd(
                          top: GouyiScreenAdapter.h(-5),
                          end: GouyiScreenAdapter.w(-15)),
                      badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeStyle: badges.BadgeStyle(
                          padding: EdgeInsets.all(GouyiScreenAdapter.w(5))),
                      badgeContent: Container(
                        alignment: Alignment.center,
                        child: Text("99",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(10),
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      child: assetImage(GouyiFontIcon.cart,
                          GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                    ),
                    activeIcon: badges.Badge(
                        position: badges.BadgePosition.topEnd(
                            top: GouyiScreenAdapter.h(-5),
                            end: GouyiScreenAdapter.w(-15)),
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        badgeStyle: badges.BadgeStyle(
                            padding: EdgeInsets.all(GouyiScreenAdapter.w(5))),
                        badgeContent: Container(
                          alignment: Alignment.center,
                          child: Text("99",
                              style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(10),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        child: assetImage(
                            GouyiFontIcon.cartActive,
                            GouyiScreenAdapter.w(25),
                            GouyiScreenAdapter.h(20))),
                    label: "购物车"),
                BottomNavigationBarItem(
                    icon: assetImage(GouyiFontIcon.mie,
                        GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                    activeIcon: assetImage(GouyiFontIcon.mieActive,
                        GouyiScreenAdapter.w(25), GouyiScreenAdapter.h(20)),
                    label: "我的")
              ]),
        ),
      ),
    );
  }
}
