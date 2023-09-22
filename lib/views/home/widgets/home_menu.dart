import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';

const rowNum = 5;
const pageNum = rowNum * 2;
Widget homeMenu(BuildContext context,HomeController controller) {
    return Container(
      color: Colors.white,
      width: GouyiScreenAdapter.w(375),
      height: GouyiScreenAdapter.h(145),
      child: Column(
        children: [
          Expanded(flex: 1, child: menuPageList(context, controller)),
          Container(
              height: GouyiScreenAdapter.h(25),
              alignment: Alignment.center,
              child: indicator(context, controller))
        ],
      ),
    );
}

Widget indicator(BuildContext context,HomeController controller) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: (controller.menuList.length % pageNum) > 0
          ? (controller.menuList.length ~/ pageNum) + 1
          : (controller.menuList.length ~/ pageNum),
      itemBuilder: (context, index) {
        return Container(
            alignment: const Alignment(0, .5),
            height: GouyiScreenAdapter.w(10),
            width: GouyiScreenAdapter.h(10),
            child: Obx(() => controller.menuSliderIndex.value == index
                ? AnimatedOpacity(
                    opacity:
                        controller.menuSliderIndex.value == index ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1000),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      height: GouyiScreenAdapter.w(5),
                      width: GouyiScreenAdapter.h(10),
                      decoration: BoxDecoration(
                          color: GouyiColors.string2Color('#666EE8'),
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  )
                : CircleAvatar(
                    radius: 3,
                    backgroundColor: GouyiColors.string2Color('#999999'),
                    child: Container(
                      alignment: const Alignment(0, .5),
                      height: GouyiScreenAdapter.w(10),
                      width: GouyiScreenAdapter.h(10),
                    ),
                  )));
      });
}

Widget menuPageList(BuildContext context,HomeController controller) {
  return PageView.builder(
    itemCount: (controller.menuList.length % pageNum) > 0
        ? (controller.menuList.length ~/ pageNum) + 1
        : (controller.menuList.length ~/ pageNum),
    onPageChanged: controller.setMenuSliderIndex,
    itemBuilder: (BuildContext context, int index) {
      return GridView.builder(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (index < (controller.menuList.length ~/ pageNum))
              ? pageNum
              : (controller.menuList.length % pageNum),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowNum,
            crossAxisSpacing: GouyiScreenAdapter.w(5),
            mainAxisSpacing: GouyiScreenAdapter.h(5),
          ),
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {},
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: GouyiScreenAdapter.w(30),
                      width: GouyiScreenAdapter.h(30),
                      fit: BoxFit.cover,
                      imageUrl: controller.menuList[index * pageNum + position].menuIcon!
                          .toString(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: GouyiScreenAdapter.h(5)),
                      child: Text(
                        controller.menuList[index * pageNum + position].menuName
                            .toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    },
  );
}
