import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';

AppBar mieHeaderBar(BuildContext context, MieController controller) {
  return AppBar(
    centerTitle: true,
    backgroundColor:
    const Color.fromRGBO(246, 246, 246, 1), //Colors.transparent=白色透明度为0
    elevation: 0,
    // leading: Row(
    //   children: [
    //     const Icon(
    //       Icons.child_care_sharp,
    //       color: Colors.black87,
    //       size: 20,
    //     ),
    //     Text(
    //       "用户昵称",
    //       style: TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
    //     ),
    //   ],
    // ),
    // leadingWidth: GouyiScreenAdapter.w(100),
    actions: [
      InkWell(
        onTap: () {
        },
        child: Container(
          padding: EdgeInsets.only(right: GouyiScreenAdapter.w(10)),
          child: Row(
            children: [
              Text(
                "会员码",
                style: TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
              ),
              SizedBox(
                width: GouyiScreenAdapter.w(5),
              ),
              const Icon(
                Icons.qr_code,
                color: Colors.black87,
                size: 20,
              )
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
        },
        child: Container(
            padding: EdgeInsets.only(
                right: GouyiScreenAdapter.w(10), left: GouyiScreenAdapter.w(5)),
            child: const Icon(
              Icons.settings,
              color: Colors.black87,
              size: 20,
            )),
      ),
      InkWell(
        onTap: () {
        },
        child: Container(
            padding: EdgeInsets.only(
                right: GouyiScreenAdapter.w(10), left: GouyiScreenAdapter.w(5)),
            child: const Icon(
              Icons.image,
              color: Colors.black87,
              size: 20,
            )),
      ),
    ],
  );
}