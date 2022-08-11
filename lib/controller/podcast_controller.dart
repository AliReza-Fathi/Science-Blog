import 'package:get/get.dart';
import 'package:scienceblog/componetnt/api_constant.dart';
import 'package:scienceblog/models/podcast_model.dart';
import 'package:scienceblog/services/dio_service.dart';

class PodcastController extends GetxController {
  RxList<PodcastModel> podcastList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioSevice().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        podcastList.add(PodcastModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
