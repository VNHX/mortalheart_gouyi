
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';

Widget mieMallVIP (BuildContext context, MieController controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(GouyiScreenAdapter.h(10)),
      color: Colors.green,
    ),
    height: GouyiScreenAdapter.h(90),
  );
}