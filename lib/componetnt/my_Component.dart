import 'package:flutter/material.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/models/fake_data.dart';
import 'package:scienceblog/componetnt/my_colors.dart';

class SciDivider extends StatelessWidget {
  const SciDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(Assets.icons.hashtagicon.path),
                color: Colors.white,
                size: 14,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                tagList[index].title,
                style: textTheme.headline2,
              )
            ],
          ),
        ));
  }
}
