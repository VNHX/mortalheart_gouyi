import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget mieService (BuildContext context, MieController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
    child: Column(
      children: [
        Container(
          // color: Colors.purple,
          padding: EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10)),
          child: commonHeader(
              title: "服务",
              onTap: () {
                EasyLoading.showToast("全部服务页面");
              },
              trailing: Row(
                children: [
                  Text(
                    "查看更多",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12), color: Colors.black38),
                  ),
                  SizedBox(
                    width: GouyiScreenAdapter.w(5),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                    color: Colors.black38,
                  ),
                ],
              )

          ),
        ),
        Container(
            height: GouyiScreenAdapter.h(140),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.serviceList.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: GouyiScreenAdapter.w(10),
                  crossAxisSpacing: GouyiScreenAdapter.w(10),
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    EasyLoading.showToast(
                        controller.serviceList[index]["title"]);

                    ///使用唯一的标识符，因为名称和图标有可能更换
                    switch (controller.serviceList[index]["uniId"]) {
                      case "s0":
                      // print("我要安装");
                        break;
                      case "s1":
                      // print("我要维修");
                        break;
                      case "s2":
                      // print("我要退换");
                        break;
                      case "s3":
                      // print("服务进度");
                        break;
                      case "s4":
                      // print("以旧换新");
                        break;
                      case "s5":
                      // print("维修价格");
                        break;
                      case "s6":
                      // print("我要贴膜");
                        break;
                      case "s7":
                      // print("全服服务");
                        break;
                      default:
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        controller.serviceList[index]["icon"],
                        color: controller.serviceList[index]["color"],
                      ),
                      SizedBox(
                        height: GouyiScreenAdapter.h(10),
                      ),
                      Text(
                        controller.serviceList[index]["title"],
                        style: TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
                      ),
                    ],
                  ),
                );
              },
            )),
      ],
    ),
  );
}