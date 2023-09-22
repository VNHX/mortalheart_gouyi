import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MieController extends GetxController{
  RefreshController refreshController = RefreshController(initialRefresh: false);
  RxList bannerList = [].obs;
  RxList goodsList = [].obs;
  RxBool isLogin = false.obs;
  RxBool isEnableDarkMode = Get.isDarkMode.obs;
  late  RxMap<dynamic, String> model = {
    'sId':'',
    'username':'',
    'tel':'',
    'password':'',
    'salt':'',
    'gold':'',
    'coupon':'',
    'redPacket':'',
    'quota':'',
    'collect':'',
    'footmark':'',
    'follow':'',
  }.obs;
  ///服务列表
  List<Map> serviceList = [];

  @override
  void onInit() {
    super.onInit();

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
  }

  ///下拉刷新
  void onRefresh() {
    refreshController.refreshCompleted();
  }

  ///请求banner数据
  void _requestBannerData() async {

  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {

  }

  void getUserInfo() async {

  }

  void changeDarkMode(value) {

  }
}