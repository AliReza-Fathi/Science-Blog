import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/controller/article_controller.dart';

class PodcastListScreen extends StatelessWidget {
  PodcastListScreen({Key? key}) : super(key: key);
  ArcticleController arcticleController = Get.put(ArcticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      appBar: appBar("پادکست های جدید"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Obx(
            () => ListView.builder(
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
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
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
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 132),
                              child: Text(
                                arcticleController.articleList[index].author!,
                                style: textTheme.subtitle2,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })),
          ),
        ),
      ),
    ));
  }
}
