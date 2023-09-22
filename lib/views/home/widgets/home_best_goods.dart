import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/models/home_model.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';
import 'package:mortalheart_gouyi/widgets/timer_block.dart';

Widget homeBestGoods(BuildContext context,HomeController controller) {
  return Container(
    margin: EdgeInsets.only(
      top:  GouyiScreenAdapter.h(4),
      left: GouyiScreenAdapter.w(4),
      right: GouyiScreenAdapter.w(4)
    ),
    child: Obx(() =>
        buildBastList(controller.bestGoodsList,controller)
    ),
  );
}
/// 小组件 布局分类
Widget buildBastList(RxList<HomeModelDataWidgetsList> bestGoodsList, HomeController controller) {
  return Column(
    children: bestGoodsList.map<Widget>((element) =>
  element.type=='单排'?
  singleRow(element,controller):element.type == '左一右三'?
  leftOneRightThree(element):element.type == '左一右二'?
  leftOneRightTwo(element):element.type == '左一右商品'
      ?leftOneRightProduct(element):element.type == '左二右二'?
  leftTwoRightTwo(element) : element.type == '左一右一'?
  leftOneRightOne(element):element.type == '三排'?
  threeRows(element):
  const Text('')
    ).toList(),
  );
}
/// 三排
Widget threeRows(HomeModelDataWidgetsList element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: GouyiScreenAdapter.h(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          color: Colors.white,
        ),
        width: GouyiScreenAdapter.w(120),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: Column(
          children: [
            const Text(
              "轻松购秒杀",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Container(
              height: GouyiScreenAdapter.h(70),
              margin: EdgeInsets.only(top: GouyiScreenAdapter.h(4)),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![0].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: GouyiScreenAdapter.w(120),
        height: GouyiScreenAdapter.h(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: Column(
          children: [
            const Text(
              "轻松购买菜",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Container(
              height: GouyiScreenAdapter.h(70),
              margin: EdgeInsets.only(top: GouyiScreenAdapter.h(4)),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![1].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),Container(
        width: GouyiScreenAdapter.w(120),
        height: GouyiScreenAdapter.h(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: Column(
          children: [
            const Text(
              "轻松购买菜",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Container(
              height: GouyiScreenAdapter.h(70),
              margin: EdgeInsets.only(top: GouyiScreenAdapter.h(4)),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![1].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
///左一右一
Widget leftOneRightOne(HomeModelDataWidgetsList element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: element.list!.map((e) =>
        Container(
          width: GouyiScreenAdapter.w(180),
          height: GouyiScreenAdapter.h(170),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          ),
          margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
          child: ClipRRect(
            borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
            child: CachedNetworkImage(
              imageUrl: e.imgUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
    ).toList(),
  );
}
/// 左二右二
Widget leftTwoRightTwo(HomeModelDataWidgetsList element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: GouyiScreenAdapter.w(181),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![0].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![1].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        width: GouyiScreenAdapter.w(181),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          // color: Colors.yellowAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![2].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![3].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
/// 左一右商品
Widget leftOneRightProduct(HomeModelDataWidgetsList element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: GouyiScreenAdapter.screenW()-GouyiScreenAdapter.w(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          color: Colors.red,
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: Row(
          children: [
            Container(
              width: GouyiScreenAdapter.w(97),
              height: GouyiScreenAdapter.h(95),
              margin: EdgeInsets.only(right:  GouyiScreenAdapter.h(4)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                color: Colors.teal,
              ),
              child: const Text('查看全部'),
            ),
            Row(
              children: [
                Container(
                  width: GouyiScreenAdapter.w(87),
                  height: GouyiScreenAdapter.h(95),
                  margin: EdgeInsets.only(right:  GouyiScreenAdapter.h(2)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  width: GouyiScreenAdapter.w(86),
                  height: GouyiScreenAdapter.h(95),
                  margin: EdgeInsets.only(right:  GouyiScreenAdapter.h(2)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  width: GouyiScreenAdapter.w(87),
                  height: GouyiScreenAdapter.h(95),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                    color: Colors.blueAccent,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}
/// 左一右二
Widget leftOneRightTwo(HomeModelDataWidgetsList element) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: GouyiScreenAdapter.w(181),
        height: GouyiScreenAdapter.h(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: ClipRRect(
          borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
          child: CachedNetworkImage(
            imageUrl: element.list![0].imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        width: GouyiScreenAdapter.w(181),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          // color: Colors.yellowAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![1].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: GouyiScreenAdapter.w(89),
              height: GouyiScreenAdapter.h(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![2].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
/// 左一右三
Widget leftOneRightThree(HomeModelDataWidgetsList element) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: GouyiScreenAdapter.w(181),
        height: GouyiScreenAdapter.h(104),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
        ),
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        child: ClipRRect(
          borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
          child: CachedNetworkImage(
            imageUrl: element.list![0].imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
        width: GouyiScreenAdapter.w(181),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
          // color: Colors.yellowAccent,
        ),
        child: Column(
          children: [
            Container(
              width: GouyiScreenAdapter.w(181),
              height: GouyiScreenAdapter.h(50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
              ),
              margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                child: CachedNetworkImage(
                  imageUrl: element.list![1].imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: GouyiScreenAdapter.w(89),
                  height: GouyiScreenAdapter.h(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                  ),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                    child: CachedNetworkImage(
                      imageUrl: element.list![2].imgUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: GouyiScreenAdapter.w(89),
                  height: GouyiScreenAdapter.h(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                  ),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                    child: CachedNetworkImage(
                      imageUrl: element.list![3].imgUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}
/// 单排
Widget singleRow(HomeModelDataWidgetsList element, HomeController controller) {
 return Container(
   height: GouyiScreenAdapter.h(160),
   margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
     color: Colors.white,
     boxShadow:[
       BoxShadow(
         color: Colors.grey.shade300,
         offset: const Offset(0, 0), // 偏移量
         blurRadius: GouyiScreenAdapter.w(6),
       )
     ]
   ),
   child:
       Column(
         children: [
           Container(
             width: GouyiScreenAdapter.screenW()-GouyiScreenAdapter.w(8),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
             ),
             margin: EdgeInsets.only(bottom:  GouyiScreenAdapter.h(4)),
             padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                   width: GouyiScreenAdapter.w(200),
                   child: Row(
                     children: [
                       SizedBox(
                         width: GouyiScreenAdapter.w(60),
                         child: Text('${element.title}',style: TextStyle(
                             color: GouyiColors.string2Color('#282828'),
                             fontWeight: FontWeight.w600,
                             fontSize: GouyiScreenAdapter.fs(13)
                         ),),
                       ),
                       Container(
                           margin: EdgeInsets.only(left: GouyiScreenAdapter.w(5)),
                           child:  Row(
                             children: [
                               TimerBlock(controller.hours),
                               Container(width: GouyiScreenAdapter.w(5),
                                 margin: EdgeInsets.only(left: GouyiScreenAdapter.w(3),right: GouyiScreenAdapter.w(3)),
                                 child: const Text(':',style: TextStyle(
                                   color: GouyiColors.theme,
                                 ),),),
                               TimerBlock(controller.minutes),
                               Container(width: GouyiScreenAdapter.w(5),
                                 margin: EdgeInsets.only(left: GouyiScreenAdapter.w(3),right: GouyiScreenAdapter.w(3)),
                                 child: const Text(':',style: TextStyle(
                                   color: GouyiColors.theme,
                                 ),),),
                               TimerBlock(controller.seconds),
                             ],
                           )
                       ),
                     ],
                   ),
                 ),
                 Container(
                   alignment: Alignment.centerRight,
                   child: Text('${element.name}'),
                 )
               ],
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:element.list!.map((e) =>
                 Column(
                   children: [
                     Container(
                       width: GouyiScreenAdapter.w(90),
                       height:GouyiScreenAdapter.h(100) ,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                       ),
                       child: ClipRRect(
                         borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                         child: CachedNetworkImage(
                           imageUrl: e.imgUrl!,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                     SizedBox(height: GouyiScreenAdapter.h(4),),
                     Text('￥ ${e.price}',style: const TextStyle(
                         color: GouyiColors.theme,
                         fontWeight: FontWeight.w600
                     ),)
                   ],
                 )

             ).toList(),
           )
         ],
       )
 );
}


