import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/text_style.dart';
import 'package:scienceblog/controller/home_screen_controller.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/models/fake_data.dart';
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

class loading extends StatelessWidget {
  const loading({
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
    preferredSize: Size.fromHeight(80),
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
                color: SolidColors.primeryColor.withBlue(100),
                shape: BoxShape.circle),
            child: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),
      ),
    ),
  );
}
