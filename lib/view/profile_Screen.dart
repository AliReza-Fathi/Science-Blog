import 'package:flutter/material.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import '../gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/componetnt/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
    return Material(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.images.avatar.path),
                height: 100,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(Assets.icons.bluepen.path),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.imageProfileEdit,
                    style: textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "علیرضا فتحی",
                style: textTheme.headline4,
              ),
              Text(
                "Aliireza.Fathii@yahoo.com",
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 40,
              ),
              SciDivider(size: size),
              SizedBox(
                height: 40,
                child: InkWell(
                  splashColor: SolidColors.primeryColor,
                  onTap: (() {}),
                  child: Center(
                    child: Text(
                      MyStrings.myFavBlog,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              SciDivider(size: size),
              SizedBox(
                height: 40,
                child: InkWell(
                  splashColor: SolidColors.primeryColor,
                  onTap: (() {}),
                  child: Center(
                    child: Text(
                      MyStrings.myFavPodcast,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              SciDivider(size: size),
              SizedBox(
                height: 40,
                child: InkWell(
                  splashColor: SolidColors.primeryColor,
                  onTap: (() {}),
                  child: Center(
                    child: Text(
                      MyStrings.logOut,
                      style: textTheme.headline4,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
