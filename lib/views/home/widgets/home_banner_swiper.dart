import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/home_controller.dart';

Widget homeBannerSwiper(BuildContext context,HomeController controller) {
  return Container(
    color: Colors.white,
    width: GouyiScreenAdapter.w(375),
    height: GouyiScreenAdapter.h(125),
    child: Obx(
          () => Swiper(
        controller: controller.swiperController,
        autoplay: true,
        loop: true,
        itemCount: controller.bannerList.length,
        pagination: SwiperPagination(
            margin: const EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        height: GouyiScreenAdapter.h(20)), //隔底部的间距
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: RectSwiperPaginationBuilder(
                              color: GouyiColors.string2Color('#999999'),
                              activeColor: GouyiColors.string2Color('#666EE8'),
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => {},
              child: Container(
                  margin: EdgeInsets.fromLTRB(
                      GouyiScreenAdapter.w(4),
                      GouyiScreenAdapter.h(4),
                      GouyiScreenAdapter.w(4),
                      GouyiScreenAdapter.h(4)),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: controller.bannerList[index].imgUrl!,
                      fit: BoxFit.cover,
                    ),
                  )));
        },
      ),
    ),
  );
}
