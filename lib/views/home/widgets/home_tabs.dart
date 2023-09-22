import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';

Widget homeTabs(BuildContext context,HomeController controller) {
  return Obx(() =>
      Opacity(
          opacity: controller.homeHeaderOpacity.value,
        child:  Container(
            height: GouyiScreenAdapter.h(controller.homeHeaderOpacity.value==1.0?25:0),
            width: GouyiScreenAdapter.screenW(),
            color: Colors.redAccent,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: getScreenWidth(context),
                  child: Obx(() => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tabs.length,
                    itemExtent: GouyiScreenAdapter.w(48),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => controller.onTabChange(
                              controller.tabs[index].code, controller.tabs),
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: GouyiScreenAdapter.w(48),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: GouyiScreenAdapter.w(20)),
                                    child: Text(
                                      controller.tabs[index].name ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ));
                    },
                  )),
                ),
                // InkWell(
                //     onTap: () => {},
                //     child: Container(
                //       alignment: Alignment.center,
                //       margin: const EdgeInsets.only(left: 5),
                //       child: Row(
                //         children: [
                //           Container(
                //             margin: const EdgeInsets.only(left: 5),
                //             child: const Text(
                //               "分类",
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 fontSize: 13,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ))
              ],
            )
        ),
      )
  );
}
