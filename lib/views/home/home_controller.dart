
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:mortalheart_gouyi/api/home.dart';
import 'package:mortalheart_gouyi/models/home_goods_tbs_model.dart';
import 'package:mortalheart_gouyi/models/home_model.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/utils/http/api_response.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController{
  final ScrollController scrollController = ScrollController();
  final SwiperController swiperController = SwiperController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  final PageController pageController = PageController();
  /// 背景图片 https://img-qn.51miz.com/preview/element/00/01/16/16/E-1161680-1DF4A9DA.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fw/720
  final headerBackgroundImage = RxString('');
  final homeHeaderOpacity = 1.0.obs;
  final adUrl =''.obs;
  RxList<HomeModelDataSearchList> searchList = <HomeModelDataSearchList>[].obs;
  RxList<HomeModelDataTabList> tabs = <HomeModelDataTabList>[].obs;
  RxList<HomeModelDataNineMenuList> menuList = <HomeModelDataNineMenuList>[].obs;
  RxList<HomeModelDataBannerList> bannerList = <HomeModelDataBannerList>[].obs;
  RxList<HomeModelDataGoodsTbsList> goodsTbsList  = <HomeModelDataGoodsTbsList>[].obs;
  RxList<HomeModelDataWidgetsList> bestGoodsList  = <HomeModelDataWidgetsList>[].obs;
  final menuSliderIndex = 0.obs;
  final goodsItemModel = RxList([]);
  final goodsList = RxList([]);
  final goodsTbsType = '1'.obs;
  final twiceTriggerDistance = 180 - (GouyiScreenAdapter.statusH() + 48 + 40);
  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
    reuqestHomeData();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
    scrollController.dispose();
    pageController.dispose();
    // swiperController.dispose();
  }
  /// 加载数据
  void reuqestHomeData() async{
    ApiResponse<HomeModel>  data = await HomeApi.getScienceArticle();
    final result = data.data?.data;
    searchList.value = result!.searchList!;
    tabs.value = result!.tabList!;
    bannerList.value = result!.bannerList!;
    menuList.value = result!.nineMenuList!;
    goodsTbsList.value = result!.goodsTbsList!;
    adUrl.value = result!.adUrl!;
    bestGoodsList.value = result!.widgetsList!;
    update();
  }

  ///下拉刷新
  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    print("onRefresh");
    refreshController.refreshCompleted();
    reuqestHomeData();
  }
  /// 上拉加载
  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    print("onLoading");
    reuqestHomeData();
    refreshController.loadComplete();
  }

  void openScan() {}
  /// 首页tabs分类
  Future<void> onTabChange(code, List tabs) async {


  }

  ///滚动监听
  void _addScrollListener() {
    scrollController.addListener(() {
      double scrollPixels = scrollController.position.pixels;
      // print('-----scroll: ${scrollController.position.pixels}----mode: ${refreshController.headerStatus}');
      if (scrollPixels < 0) {
        homeHeaderOpacity.value = 0.0;
      } else {
        homeHeaderOpacity.value = 1.0;
      }
        /// 二层楼时是否继续隐藏头部
      if (refreshController.headerStatus == RefreshStatus.twoLevelOpening ||
          refreshController.headerStatus == RefreshStatus.twoLeveling ||
          refreshController.headerStatus == RefreshStatus.refreshing) {
        // 隐藏头部：opacity=0
        homeHeaderOpacity.value = 0.0;
      } else if (scrollPixels < -twiceTriggerDistance!) {
        homeHeaderOpacity.value = 0.0;
      } else if (scrollPixels >= 0) {
        homeHeaderOpacity.value =1.0;
      } else {
        homeHeaderOpacity.value = 1 + scrollPixels / twiceTriggerDistance!;
      }
    });
  }
  /// 菜单 滑动
  Future<void> setMenuSliderIndex(int index) async {
    menuSliderIndex.value = index;
  }

  void openscan() async {
    var options = const ScanOptions(
      autoEnableFlash: false,
      android: AndroidOptions(
        aspectTolerance: 0.6,
        useAutoFocus: false,
      ),
      strings: {
        'cancel': "取消",
        'flash_on': "打开闪光灯",
        'flash_off': "关闭闪光灯",
      },
    );

    var result = await BarcodeScanner.scan(options: options);
    print(result.rawContent); // The barcode content
    // Get.toNamed('/scan');
    // EasyLoading.showToast('开发中');
  }

  goodTbsClick(String? elment) {
    goodsTbsType.value = elment!;
    if(elment=='1'){
      goodsList.value = [];
    }else if(elment == '2') {
      goodsList.value =[];
    }else if(elment == '3') {
      goodsList.value = [];
    }else if(elment == '4') {
      goodsList.value = [];
    }
    update();
  }

  start(Duration duration) {
    // 初始化时间
    // 开启定时器
  }
  void startTimer() {
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   seconds.value--;
    //   if(seconds == 0) {
    //     minutes--;
    //     seconds = 59;
    //   }
    //   //...更新其他计时
    // });
  }

}
