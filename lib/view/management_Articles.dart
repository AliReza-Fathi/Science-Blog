import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/gen/assets.gen.dart';

class ManagementOfArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.sciensbot,
              height: 130,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "MyStrings.managementArticles",
              style: textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: (() {
                  //_showEmailBottemSheet(context, size, textTheme);
                }),
                child: Text(
                  "بریم برای ارسال یک مقاله یا پادکست",
                  style: textTheme.headline1,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
