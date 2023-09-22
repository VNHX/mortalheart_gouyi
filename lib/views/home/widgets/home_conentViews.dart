import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';
import 'package:mortalheart_gouyi/views/home/widgets/twoLevel_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_ad_bannerImage.dart';
import 'home_banner_swiper.dart';
import 'home_best_goods.dart';
import 'home_listViews.dart';
import 'home_list_tabsViews.dart';
import 'home_menu.dart';
import 'home_tabs.dart';

Widget homeContentView(BuildContext context, HomeController controller) {
  final tasHeight = controller.tabs.isNotEmpty ? 94.0 : 99.0;
  return Positioned(
      top: -GouyiScreenAdapter.h(0),
      left: 0,
      right: 0,
      bottom: 0,
      child: RefreshConfiguration.copyAncestor(
          enableScrollWhenTwoLevel: true,
          /// 下拉二楼继续滑动
          maxOverScrollExtent: 120,
          /// 下拉最大高度
          context: context,
          child: SmartRefresher(
              enableTwoLevel: true,
              enablePullDown: true,
              enablePullUp: true,
              controller: controller.refreshController,
              header:  const TwoLevelHeader(
                releaseText: '下拉更新',
                refreshingText: '更新中...',
                canTwoLevelText: '继续下拉有惊喜',
                completeText: '更新完成',
                idleText: '下拉更新',
                textStyle: TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/eKYR1R2PXx.jpg"),
                      fit: BoxFit.cover,
                      // 很重要的属性,这会影响你打开二楼和关闭二楼的动画效果
                      alignment: Alignment.topCenter),
                ),
                twoLevelWidget: TwoLevelWidget(),
              ),
              //自定义上拉样式
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Text body;
                  if (mode == LoadStatus.idle) {
                    //闲置状态
                    body = const Text("上拉加载更多");
                  } else if (mode == LoadStatus.loading) {
                    //加载状态
                    body = const Text("正在努力加载中...");
                  } else if (mode == LoadStatus.failed) {
                    //加载数据失败
                    body = const Text("加载失败，稍后重试");
                  } else {
                    //没有数据
                    body = const Text("没有更多数据了");
                  }
                  return SizedBox(
                    height: GouyiScreenAdapter.h(20),
                    child: Center(child: body),
                  );
                },

              ),
              onRefresh: controller.onRefresh,
              onLoading: controller.onLoading,
              child: ListView(
                      controller: controller.scrollController,
                      children: [
                           Obx(() =>  SizedBox(
                             height: GouyiScreenAdapter.h(controller.homeHeaderOpacity.value==1.0?tasHeight:0),
                           ),
                           ) ,
                        /// 首页商品类别 | 分类
                        if(controller.tabs.isNotEmpty &&controller.homeHeaderOpacity.value ==1.0)
                        homeTabs(context,controller),
                        /// 轮播图
                        if(controller.bannerList.isNotEmpty)
                        homeBannerSwiper(context, controller),
                        /// ad
                        if(controller.adUrl.isNotEmpty)
                        homeAdBannerImage(context,controller),
                        /// menu
                        if(controller.menuList.isNotEmpty)
                        homeMenu(context,controller),
                        /// 各种活动、各种小部件
                        if(controller.bestGoodsList.isNotEmpty)
                        homeBestGoods(context,controller),
                        /// 商品_tabs
                        if(controller.goodsTbsList.isNotEmpty)
                        homeListTabsViews(context,controller),
                        /// tabs_商品
                        if(controller.goodsList.isNotEmpty)
                        homeListViews(context,controller),
              ])
          )
      )
  );
}
