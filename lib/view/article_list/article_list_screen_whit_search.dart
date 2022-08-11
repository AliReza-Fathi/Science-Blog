import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/controller/article_controller.dart';

class ArticleListScreenWhitSearch extends StatelessWidget {
  ArticleListScreenWhitSearch({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
            appBar: appBar("لیست مقالات"),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, 0),
                    child: TextField(
                      onChanged: ((value) {
                        //isEmail(value);
                      }),
                      style: textTheme.headline5,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "جستجو", hintStyle: textTheme.headline5),
                    ),
                  ),
                  ArticleList(
                      arcticleController: arcticleController,
                      textTheme: textTheme),
                ],
              )),
            )));
  }
}
