import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';

Widget mieProfileHeader (BuildContext context, MieController controller) {
  return Obx(() => controller.isLogin.value
      ? SizedBox(
    height: GouyiScreenAdapter.h(40),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          highlightColor:Colors.transparent,
          splashColor:Colors.transparent,
          onTap: () {
          },
          child: CircleAvatar(
            radius: GouyiScreenAdapter.w(25),
            backgroundImage:
            const AssetImage(GouyiFontIcon.icAvatarDefault),
          ),

        ),
        SizedBox(
          width: GouyiScreenAdapter.w(10),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "姓名",
              "${controller.model.value}",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: GouyiScreenAdapter.h(5)),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(GouyiScreenAdapter.w(3)),
                  decoration: BoxDecoration(
                      color: GouyiColors.gray238,
                      borderRadius:
                      BorderRadius.circular(GouyiScreenAdapter.w(10))),
                  child: Text(
                    "账号ID${controller.model.value['sId']}",
                    style: TextStyle(fontSize: GouyiScreenAdapter.fs(10)),
                  ),
                ),
                SizedBox(width: GouyiScreenAdapter.w(10)),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                      padding: EdgeInsets.all(GouyiScreenAdapter.w(3)),
                      decoration: BoxDecoration(
                          color: GouyiColors.gray238,
                          borderRadius: BorderRadius.circular(
                              GouyiScreenAdapter.w(10))),
                      child: Row(
                        children: [
                          Text(
                            "勋章0枚",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(10)),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: Colors.black26,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  )
      : SizedBox(
    height: GouyiScreenAdapter.h(40),
    child: InkWell(
      onTap: () {
        ///一键登录页面
        Get.toNamed("/oneClickLoginView");
        ///验证码登录

      },
      child: Row(
        children: [
          CircleAvatar(
            radius: GouyiScreenAdapter.w(25),
            backgroundImage:
            const AssetImage(GouyiFontIcon.icAvatarDefault),
          ),
          SizedBox(
            width: GouyiScreenAdapter.w(10),
          ),
          const Text(
            "登录/注册",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 10,
            color: Colors.black26,
          )
        ],
      ),
    ),
  ));
}