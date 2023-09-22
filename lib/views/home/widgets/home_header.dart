import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';
import 'package:mortalheart_gouyi/widgets/marquee_widget.dart';

Widget homeHeader(BuildContext context,HomeController controller) {
  // TODO: implement build
  return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(() => Opacity(
            opacity: controller.homeHeaderOpacity.value,
            child: SizedBox(
              height: GouyiScreenAdapter.h(55) + getStatusHeight(context),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: controller.headerBackgroundImage.value.isNotEmpty
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: controller.headerBackgroundImage.value!,
                          )
                        : Container(
                            color: Colors.redAccent,
                          ),
                  ),
                  Positioned(
                    top: GouyiScreenAdapter.h(35),
                    left: GouyiScreenAdapter.w(20),
                    child: InkWell(
                      onTap: () =>{
                        Get.toNamed('/signIn')
                      },
                      child:  SizedBox(
                          width: GouyiScreenAdapter.w(20),
                          height: GouyiScreenAdapter.h(20),
                          child: assetImage(
                              GouyiFontIcon.icSignIn,
                              GouyiScreenAdapter.w(15),
                              GouyiScreenAdapter.h(15))),
                    ),
                  ),
                  Positioned(
                    top: GouyiScreenAdapter.h(35),
                    right: GouyiScreenAdapter.w(20),
                    child:InkWell(
                      onTap: ()=>{
                        Get.toNamed('/message')
                      },
                      child: SizedBox(
                          width: GouyiScreenAdapter.w(20),
                          height: GouyiScreenAdapter.h(20),
                          child: assetImage(
                              GouyiFontIcon.icMessage,
                              GouyiScreenAdapter.w(15),
                              GouyiScreenAdapter.h(15)))
                    ),
                  ),
                  Positioned(
                      top: GouyiScreenAdapter.h(60),
                      child: Container(
                        width: GouyiScreenAdapter.w(340),
                        height: GouyiScreenAdapter.h(26),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: GouyiScreenAdapter.w(20),
                                height: GouyiScreenAdapter.h(20),
                                child: assetImage(
                                    GouyiFontIcon.search,
                                    GouyiScreenAdapter.w(5),
                                    GouyiScreenAdapter.h(5))),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: GouyiScreenAdapter.h(30),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () => {
                                  Get.toNamed("/search")
                                  },
                                  child: buildMarqueeWidget(controller),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () =>{
                                controller.openscan()
                              },
                              child: SizedBox(
                                  width: GouyiScreenAdapter.w(20),
                                  height: GouyiScreenAdapter.h(20),
                                  child: assetImage(
                                      GouyiFontIcon.icScan,
                                      GouyiScreenAdapter.w(15),
                                      GouyiScreenAdapter.h(15))),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 2, right: 2),
                              width: 1,
                              height: 12,
                              child: const DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                              ),
                            ),
                            InkWell(
                              onTap: () =>{
                                controller.openscan()
                              },
                              child: SizedBox(
                                  width: GouyiScreenAdapter.w(20),
                                  height: GouyiScreenAdapter.h(20),
                                  child: assetImage(
                                      GouyiFontIcon.icCamera,
                                      GouyiScreenAdapter.w(15),
                                      GouyiScreenAdapter.h(15))),
                            ),

                          ],
                        ),
                      )),
                ],
              ),
            ),
          )
      )
  );
}

MarqueeWidget buildMarqueeWidget(HomeController controller) {
  List itemStr = controller.searchList ?? [];

  ///上下轮播 安全提示
  return MarqueeWidget(
    //子Item构建器
    itemBuilder: (BuildContext context, int index) {
      //通常可以是一个 Text文本
      return Text(
        controller.searchList.isNotEmpty?itemStr[index].title:'',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: GouyiColors.gray154, height: GouyiScreenAdapter.h(2.0)),
      );
    },
    //循环的提示消息数量
    count: itemStr.length,
  );
}
