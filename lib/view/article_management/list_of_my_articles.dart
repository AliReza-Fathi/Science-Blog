import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/controller/article_controller.dart';

class ListOfMyArticle extends StatelessWidget {
  ListOfMyArticle({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar("لیست مقالات من"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ArticleList(
                arcticleController: arcticleController, textTheme: textTheme),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: ElevatedButton(
                onPressed: (() {
                  //_showEmailBottemSheet(context, size, textTheme);
                }),
                child: Text(
                  "بریم برای ارسال یک مقاله ",
                  style: textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
