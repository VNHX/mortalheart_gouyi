
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/message/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MessageController>(() => MessageController());
  }

}