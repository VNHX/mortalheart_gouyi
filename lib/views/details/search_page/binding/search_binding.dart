

import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/details/search_page/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControllers>(
          () => SearchControllers(),
    );
  }
}