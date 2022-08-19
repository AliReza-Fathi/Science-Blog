import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/controller/article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
            appBar: appBar("مقالات جدید"),
            body: ArticleList(
                arcticleController: arcticleController, textTheme: textTheme)));
  }
}
