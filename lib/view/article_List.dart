import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scienceblog/componetnt/my_colors.dart';
import 'package:scienceblog/controller/home_screen_controller.dart';
import 'package:scienceblog/models/fake_data.dart';

class ArticleList extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  RxInt selectedPageIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [ArticlesList()],
        ),
      ),
    );
  }

  Widget ArticlesList() {
    return SizedBox(
      //height: size.height / 3.5,
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
                      height: 5.3,
                      width: 2.8,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            placeholder: ((context, url) =>
                                const SpinKitFadingCube(
                                  color: SolidColors.primeryColor,
                                  size: 20,
                                )),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
