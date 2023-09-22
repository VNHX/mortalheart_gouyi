import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';

Widget mieOrderRecord (BuildContext context, MieController controller) {
  return Obx(
        () => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
      // height: DoScreenAdapter.h(90),
      child: Column(
        children: [
          SizedBox(
            height: GouyiScreenAdapter.h(30),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      // "收藏",
                      controller.isLogin.value
                          ? "收藏 ${controller.model.value['collect']}"
                          : "收藏",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: GouyiScreenAdapter.w(0.5),
                                color: Colors.black12),
                            right: BorderSide(
                                width: GouyiScreenAdapter.w(0.5),
                                color: Colors.black12))),
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      // "足迹",
                      controller.isLogin.value
                          ? "足迹 ${controller.model.value['footmark']}"
                          : "足迹",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      // "关注",
                      controller.isLogin.value
                          ? "关注 ${controller.model.value['follow']}"
                          : "关注",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(height: GouyiScreenAdapter.h(1), color: Colors.black12),
          Container(
            height: GouyiScreenAdapter.h(50),
            margin: EdgeInsets.symmetric(vertical: GouyiScreenAdapter.w(5)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.payment_outlined),
                          Text(
                            "待付款",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.delivery_dining_outlined),
                          Text(
                            "待收货",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.comment_outlined),
                          Text(
                            "待评价",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.change_circle_outlined),
                          Text(
                            "退换/售后",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.list_alt_outlined),
                          Text(
                            "全部订单",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}