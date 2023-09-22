import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/login/accountPasswordLogin/account_password_login_controller.dart';

class AccountPasswordLoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountPasswordLoginController>(() => AccountPasswordLoginController());
  }

}