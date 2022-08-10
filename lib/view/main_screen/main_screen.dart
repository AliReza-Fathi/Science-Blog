import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/view/about_Us.dart';
import 'package:scienceblog/view/my_cats.dart';
import 'package:scienceblog/view/main_screen/profile_Screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:validators/validators.dart';
import 'home_Screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        key: _key,
        //اپ بار
        appBar: AppBar(
          backgroundColor: SolidColors.scafoldBg,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (() {
                  _key.currentState!.openDrawer();
                }),
                child: const Icon(
                  Icons.menu,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                Assets.images.mainScreenLogo.path,
                scale: 5,
              ),
              //height: size.height / 52,
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.search,
                  size: 35,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),

        //منو کشویی
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                  ),
                ),
              ),
              ListTile(
                title: InkWell(
                  splashColor: SolidColors.primeryColor,
                  child: Text(
                    "پروفایل کاربر",
                    style: textTheme.headline4,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                            size: size,
                            textTheme: textTheme,
                            bodyMargin: bodyMargin)),
                  );
                },
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: InkWell(
                  splashColor: SolidColors.primeryColor,
                  child: Text(
                    "درباره ساینس بلاگ",
                    style: textTheme.headline4,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: InkWell(
                  splashColor: SolidColors.primeryColor,
                  child: Text(
                    "اشتراک گذاری ساینس بلاگ",
                    style: textTheme.headline4,
                  ),
                ),
                onTap: () async {
                  await Share.share(MyStrings.shareText);
                },
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: InkWell(
                  splashColor: SolidColors.primeryColor,
                  child: Text(
                    "ساینس بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                ),
                onTap: () {
                  myLaunchUrl(MyStrings.scienceBlogGithubUrl);
                },
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
            ]),
          ),
        ),

        body: Stack(
          children: [
            //محتوای صفحه هوم
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
              ),
            )),

            //نویگیتور
            BottemNavigatiotn(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            )
          ],
        ),
      ),
    );
  }
}

class BottemNavigatiotn extends StatelessWidget {
  const BottemNavigatiotn({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 8,
      child: Container(
        height: size.height / 14,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomNavBackgroand,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 10,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: GradiantColors.bottomNav,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(
                    onPressed: (() {
                      _newCreateBlog(context, size, textTheme);
                    }),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.write.path),
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(
                    onPressed: (() => changeScreen(1)),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                      size: 30,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _newCreateBlog(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 280,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  //آیکون ساینس بات و متن
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.images.sciensbot,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        MyStrings.newBlogTitleText,
                        style: textTheme.headline4,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //متن بدنه
                  Text(
                    MyStrings.newBlogBodyText,
                    style: textTheme.headline5,
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //خط آیکون و متن
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //مدیریت مقاله
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.pencil,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            MyStrings.managmentArticle,
                            style: textTheme.headline4,
                          )
                        ],
                      ),

                      //مدیریت پادکست
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.microphon,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            MyStrings.managmentPodcast,
                            style: textTheme.headline4,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
