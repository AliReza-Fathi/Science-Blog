import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/controller/article_controller.dart';

class PodcastListScreenWhitSearch extends StatelessWidget {
  PodcastListScreenWhitSearch({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
            appBar: appBar("لیست پادکست ها"),
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
                        width: 16,
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
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            arcticleController.articleList[index].author!,
                            style: textTheme.subtitle2,
                            textAlign: TextAlign.right,
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
