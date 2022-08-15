import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/controller/home_screen_controller.dart';
import '../../gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.loading == false
              ? Column(
                  children: [
                    //پوستر صفحه اصلی
                    poster(),

                    //فاصله بین پوستر و هشتگ ها
                    const SizedBox(
                      height: 16,
                    ),

                    //ساخت هشتگ ها
                    tags(),

                    //فاصله سطر داغ ترین نوشته ها با لیست تگ ها
                    const SizedBox(
                      height: 16,
                    ),
                    //سطر مشاهده داغ ترین نوشته ها
                    HomePageHotestArticel(
                        bodyMargin: bodyMargin, textTheme: textTheme),

                    //لیست داغ ترین نوشته ها
                    hotBlogs(),

                    //فاصله لیست داغ ترین نوشته ها با داغ ترین پادکست ها
                    const SizedBox(
                      height: 16,
                    ),

                    //سطر مشاهده داغ ترین پادکست ها
                    HomePageHotestPodcasts(
                        bodyMargin: bodyMargin, textTheme: textTheme),

                    //لیست داغ ترین پادکست ها
                    hotPodcasts(),

                    //فاصله لیست داغ ترین پادکست ها با نویگیتور
                    const SizedBox(
                      height: 100,
                    )
                  ],
                )
              : const Loading(),
        ),
      ),
    );
  }

  Widget hotBlogs() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              //ساخت آیتم های لیست داغ ترین نوشته ها
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.8,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            placeholder: ((context, url) => const Loading()),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: SolidColors.primeryColor,
                            ),
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                              foregroundDecoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradiantColors.blogPost,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
                                      style: textTheme.subtitle1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //متن زیر باکس
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: SizedBox(
                        width: size.width / 2.8,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ),
                ],
              );
            })),
      ),
    );
  }

  Widget hotPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topPodcasts.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              //ساخت آیتم های لیست داغ ترین نوشته ها
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.8,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topPodcasts[index].poster!,
                          imageBuilder: ((context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              )),
                          placeholder: ((context, url) => const Loading()),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: SolidColors.primeryColor,
                          ),
                        )),
                  ),
                  //متن زیر باکس
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: SizedBox(
                        width: size.width / 2.8,
                        child: Text(
                          homeScreenController.topPodcasts[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                  ),
                ],
              );
            })),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        //ساخت کانتینر پوستر
        Container(
          width: size.width / 1.15,
          height: size.height / 4,
          //محتوای پایینی استک عکس
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: ((context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                )),
            placeholder: ((context, url) => const Loading()),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: SolidColors.primeryColor,
            ),
          ),
          //محتوای بالایی استک گرادینت
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              //ساخت گرادینت
              gradient: LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        //متن های روی پوستر
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  homeScreenController.poster.value.title!,
                  style: textTheme.headline1,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: homeScreenController.tagsList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? (bodyMargin * 0.25) : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          })),
    );
  }
}

class HomePageHotestPodcasts extends StatelessWidget {
  const HomePageHotestPodcasts({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: (bodyMargin * 0.25), bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluemicrophon.path),
            color: SolidColors.seeMore,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageHotestArticel extends StatelessWidget {
  const HomePageHotestArticel({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: (bodyMargin * 0.25), bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluepen.path),
            color: SolidColors.seeMore,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}
