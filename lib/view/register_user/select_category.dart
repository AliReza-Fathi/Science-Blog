import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scienceblog/controller/home_screen_controller.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:scienceblog/models/fake_data.dart';
import 'package:scienceblog/componetnt/my_strings.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/view/main_screen/home_Screen.dart';
import 'package:scienceblog/view/main_screen/main_screen.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                Assets.images.sciensbot,
                height: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                MyStrings.successfulRegistration,
                style: textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              //کادر نام و نام خانوادگی
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline4),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                MyStrings.chooseCats,
                style: textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              //لیست تگ ها
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeScreenController.tagsList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                            onTap: (() {
                              setState(() {
                                if (!selectedTags.contains(
                                    homeScreenController.tagsList[index])) {
                                  selectedTags.add(
                                      homeScreenController.tagsList[index]);
                                } else {
                                  print(
                                      "${tagList[index].title} در لیست موارد دلخواه وجود دارد");
                                }
                              });
                            }),
                            child:
                                MainTags(textTheme: textTheme, index: index));
                      })),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                Assets.icons.downarrow.path,
                scale: 3,
              ),

              //لیست تگ های مورد علاقه انتخاب شده
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: selectedTags.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: SolidColors.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedTags[index].title!,
                                    style: textTheme.headline4,
                                  ),
                                  InkWell(
                                    onTap: (() {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    }),
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      })),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              ElevatedButton(
                onPressed: (() {
                  Get.to(MainScreen());
                }),
                child: Text(
                  "پایان ثبت نام",
                  style: textTheme.headline1,
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
