
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';
import 'package:mortalheart_gouyi/views/me/widgets/mie_body.dart';
import 'package:mortalheart_gouyi/views/me/widgets/mie_headerBar.dart';
class MieViews extends GetView<MieController>{
  const MieViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: controller,
        initState: (state) {
          controller.getUserInfo();
     },
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          appBar: mieHeaderBar(context,controller),
          body: mieBody(context,controller),
        );
      }
    );
  }

}