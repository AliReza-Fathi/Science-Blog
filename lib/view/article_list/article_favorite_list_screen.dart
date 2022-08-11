import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/controller/article_controller.dart';

class ArticleFavoriteListScreen extends StatelessWidget {
  ArticleFavoriteListScreen({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
            appBar: appBar("مقالات مورد علاقه"),
            body: ArticleList(
                arcticleController: arcticleController, textTheme: textTheme)));
  }
}
