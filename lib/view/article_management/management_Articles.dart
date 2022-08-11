import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/view/article_management/list_of_my_articles.dart';

class ManagementOfArticles extends StatelessWidget {
  const ManagementOfArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.sciensbot,
              height: 130,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              MyStrings.manageMyArticles,
              style: textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: (() {
                  Get.to(ListOfMyArticle());
                }),
                child: Text(
                  "دیدن لیست مقالات اضافه شده ",
                  style: textTheme.headline1,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
