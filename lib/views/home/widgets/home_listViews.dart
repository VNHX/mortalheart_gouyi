import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';

Widget homeListViews(BuildContext context,HomeController controller) {
  return Obx(() => MasonryGridView.count(
    padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
    crossAxisCount: 2,
    mainAxisSpacing: GouyiScreenAdapter.w(10), //垂直间距
    crossAxisSpacing: GouyiScreenAdapter.h(5), //水平间距
    itemCount: controller.goodsList.length,
    shrinkWrap: true, //收缩，让子元素自适应宽度
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          Get.toNamed("/goods-content", arguments: {
            "sid": controller.goodsList[index]['_id'],
            "isCanJumpCart": true,
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(5)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(GouyiScreenAdapter.w(5)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: controller.goodsList[index]['pic'].toString(),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    GouyiScreenAdapter.w(10),
                    GouyiScreenAdapter.h(0),
                    GouyiScreenAdapter.w(10),
                    GouyiScreenAdapter.h(5)),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${controller.goodsList[index]['title']}",
                  style: TextStyle(
                      fontSize: GouyiScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10)),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${controller.goodsList[index]['sub_title']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: GouyiScreenAdapter.fs(12),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    GouyiScreenAdapter.w(10),
                    GouyiScreenAdapter.h(15),
                    GouyiScreenAdapter.w(10),
                    GouyiScreenAdapter.h(10)),
                alignment: Alignment.centerLeft,
                child: Text(
                  "¥${controller.goodsList[index]['price']}",
                  style: TextStyle(
                      fontSize: GouyiScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }, //禁止自身滚动，让外面的listView滚动
  )
  );
}
