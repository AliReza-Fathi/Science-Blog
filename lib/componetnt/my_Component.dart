import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/text_style.dart';
import 'package:scienceblog/controller/article_controller.dart';
import 'package:scienceblog/controller/home_screen_controller.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SciDivider extends StatelessWidget {
  const SciDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(Assets.icons.hashtagicon.path),
                color: Colors.white,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.headline2,
              )
            ],
          ),
        ));
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("could not launch ${uri.toString()}");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitChasingDots(
      color: SolidColors.primeryColor,
      size: 30,
    );
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                title,
                style: appBarTextStyle,
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: SolidColors.primeryColor.withAlpha(100),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: (() => Get.back()),
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
      ),
    ),
  );
}

class ArticleList extends StatelessWidget {
  const ArticleList({
    Key? key,
    required this.arcticleController,
    required this.textTheme,
  }) : super(key: key);

  final ArcticleController arcticleController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: arcticleController.articleList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height / 6,
                        width: Get.width / 3,
                        child: CachedNetworkImage(
                          imageUrl:
                              arcticleController.articleList[index].image!,
                          imageBuilder: (((context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            );
                          })),
                          placeholder: (((context, url) {
                            return const Loading();
                          })),
                          errorWidget: ((context, url, error) {
                            return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: SolidColors.primeryColor);
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              arcticleController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.headline4,
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                arcticleController.articleList[index].author!,
                                style: textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${arcticleController.articleList[index].view!} بازدید ",
                                style: textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                arcticleController.articleList[index].catName!,
                                style: textTheme.headline3,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
