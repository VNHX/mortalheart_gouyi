import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';

Widget mieGoodsListView (BuildContext context, MieController controller) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(
            GouyiScreenAdapter.w(10),
            GouyiScreenAdapter.h(10),
            GouyiScreenAdapter.w(0),
            GouyiScreenAdapter.h(10)),
        child: const Text(
          "为你精选",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      Obx(() => MasonryGridView.count(
        // padding: EdgeInsets.all(DoScreenAdapter.w(10)),
        crossAxisCount: 2,
        mainAxisSpacing: GouyiScreenAdapter.w(10), //垂直间距
        crossAxisSpacing: GouyiScreenAdapter.h(8), //水平间距
        itemCount: controller.goodsList.length,
        shrinkWrap: true, //收缩，让子元素自适应宽度
        physics:
        const NeverScrollableScrollPhysics(), //禁止自身滚动，让外面的listView滚动
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

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
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        GouyiScreenAdapter.w(10),
                        GouyiScreenAdapter.h(0),
                        GouyiScreenAdapter.w(10),
                        GouyiScreenAdapter.h(5)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${controller.goodsList[index].title}",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: GouyiScreenAdapter.w(10)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${controller.goodsList[index].subTitle}",
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
                      "¥${controller.goodsList[index].price}",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(14),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    ],
  );
}