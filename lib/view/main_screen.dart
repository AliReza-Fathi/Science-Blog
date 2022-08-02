import 'package:flutter/material.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/view/profile_Screen.dart';
import 'home_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
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
                title: Text(
                  "پروفایل کاربر",
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "درباره ساینس بلاگ",
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "اشتراک گذاری ساینس بلاگ",
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "تماس با ما",
                  style: textTheme.headline4,
                ),
                onTap: () {},
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
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
              ),
            ),

            //نویگیتور
            BottemNavigatiotn(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
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
