import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/mie_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'mie_goodsListView.dart';
import 'mie_mallVIP.dart';
import 'mie_orderRecord.dart';
import 'mie_profileHeader.dart';
import 'mie_service.dart';

Widget mieBody (BuildContext context, MieController controller) {
  return SmartRefresher(
    enablePullDown: true,
    controller: controller.refreshController,
    onRefresh: controller.onRefresh,
    header: const WaterDropMaterialHeader(
      color: Colors.white,
      backgroundColor: GouyiColors.theme,
    ),
    child: ListView(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      children: [
        mieProfileHeader(context,controller),
        // mieProfileMenu(context,controller),
        // mieMallVIP(context,controller),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        mieOrderRecord(context,controller),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        mieService(context,controller),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        mieGoodsListView(context,controller),

      ],
    ),
  );
}