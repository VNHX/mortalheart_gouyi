import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';

Widget homeListTabsViews (context,HomeController controller) {
  return Container(
    height: GouyiScreenAdapter.h(40),
    margin: EdgeInsets.only(left: GouyiScreenAdapter.w(4),
      right:GouyiScreenAdapter.w(4),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:controller.goodsTbsList.map<Widget>((element)=>Obx(() => InkWell(
        onTap: ()=>{
          controller.goodTbsClick(element.type)
        },highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(element.title!,style: TextStyle(
                color: controller.goodsTbsType.value == element.type!?GouyiColors.string2Color('#666EE8'):Colors.black,
                fontSize: GouyiScreenAdapter.fs(15),
                fontWeight:  controller.goodsTbsType.value == element.type!? FontWeight.w600 :FontWeight.w100
            ),),
            SizedBox(height: GouyiScreenAdapter.h(2),),
            Text(element.name!,style: TextStyle(
                color: controller.goodsTbsType.value== element.type!?GouyiColors.string2Color('#666EE8'):GouyiColors.string2Color('#CCCCCC')
            ),)
          ],
        ),
      ))).toList(),
    ),
  );
}