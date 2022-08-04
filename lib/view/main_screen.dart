import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/view/about_Us.dart';
import 'package:scienceblog/view/profile_Screen.dart';
import 'package:share_plus/share_plus.dart';
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
                    onPressed: (() {}),
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
}
