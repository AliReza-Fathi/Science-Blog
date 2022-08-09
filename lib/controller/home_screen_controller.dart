import 'package:get/get.dart';
import 'package:scienceblog/componetnt/api_constant.dart';
import 'package:scienceblog/models/article_model.dart';
import 'package:scienceblog/models/poster_model.dart';
import 'package:scienceblog/services/dio_service.dart';

import '../models/podcast_model.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioSevice().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });
      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
