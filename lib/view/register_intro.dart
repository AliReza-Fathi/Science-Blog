import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: textTheme.headline4,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: (() {
                  _showEmailBottemSheet(context, size, textTheme);
                }),
                child: Text(
                  "بزن بریم",
                  style: textTheme.headline1,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

//باکس وارد کردن ایمیل
  Future<dynamic> _showEmailBottemSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3.2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourEmail,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        onChanged: ((value) {
                          isEmail(value);
                        }),
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "scienceblog@gmail.com",
                            hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.pop(context);
                          _activateCodeBottemSheet(context, size, textTheme);
                        }),
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

//باکس وارد کردن کد تایید
  Future<dynamic> _activateCodeBottemSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3.2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activateCode,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        onChanged: ((value) {
                          isEmail(value);
                        }),
                        style: textTheme.headline5,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "******", hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => MyCats())));
                        }),
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
