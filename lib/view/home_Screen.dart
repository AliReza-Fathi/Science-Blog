import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            //پوستر صفحه اصلی
            HomePagePoster(size: size, textTheme: textTheme),

            //فاصله بین پوستر و هشتگ ها
            const SizedBox(
              height: 16,
            ),

            //ساخت هشتگ ها
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),

            //فاصله سطر داغ ترین نوشته ها با لیست تگ ها
            const SizedBox(
              height: 16,
            ),
            //سطر مشاهده داغ ترین نوشته ها
            HomePageHotestArticel(bodyMargin: bodyMargin, textTheme: textTheme),

            //لیست داغ ترین نوشته ها
            HomePageHotestArticleItem(size: size, textTheme: textTheme),

            //فاصله لیست داغ ترین نوشته ها با داغ ترین پادکست ها
            const SizedBox(
              height: 16,
            ),

            //سطر مشاهده داغ ترین پادکست ها
            HomePageHotestPodcasts(
                bodyMargin: bodyMargin, textTheme: textTheme),

            //لیست داغ ترین پادکست ها
            HomePageHotestPodcastsItem(size: size),

            //فاصله لیست داغ ترین پادکست ها با نویگیتور
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class HomePageHotestPodcastsItem extends StatelessWidget {
  const HomePageHotestPodcastsItem({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: podcastList.length,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(podcastList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
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
                        podcastList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                ),
              ],
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

class HomePageHotestArticleItem extends StatelessWidget {
  const HomePageHotestArticleItem({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: blogList.length,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.blogPost,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
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
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                ),
              ],
            );
          })),
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

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: tagList.length,
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

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //ساخت کانتینر پوستر
        Container(
          width: size.width / 1.15,
          height: size.height / 4,
          //محتوای پایینی استک عکس
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(homePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
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
        TextOnPoster(textTheme: textTheme)
      ],
    );
  }
}

class TextOnPoster extends StatelessWidget {
  const TextOnPoster({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 8,
      child: Column(
        children: [
          //سطر اول
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                homePagePosterMap["writer"] + " - " + homePagePosterMap["date"],
                style: textTheme.subtitle1,
              ),
              Row(
                children: [
                  Text(
                    homePagePosterMap["view"],
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
          //فاصله بین سطر اول و دوم
          const SizedBox(
            height: 10,
          ),
          //سطر دوم - موضوع نوشته
          Text(
            "دوازده قدم برنامه نویسی یک دوره ی...س",
            style: textTheme.headline1,
          )
        ],
      ),
    );
  }
}
