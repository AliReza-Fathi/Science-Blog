import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/gen/assets.gen.dart';

class AboutUs extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logo.path,
              scale: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            SciDivider(size: size),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: Text(
                MyStrings.aboutUs,
                textAlign: TextAlign.center,
                style: textTheme.headline4,
              ),
            ),
            SciDivider(size: size),
          ],
        ),
      ),
    ));
  }
}
