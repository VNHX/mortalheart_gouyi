
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationCodeLoginController extends GetxController{
  TextEditingController phoneController = TextEditingController();
  RxBool isSendCodeButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;

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
    // phoneController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    // phoneController.dispose();
  }

  ///获取验证码
  Future requestVerificationCode() async {

  }
}