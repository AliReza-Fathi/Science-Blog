import 'package:get/get.dart';
import 'package:scienceblog/componetnt/api_constant.dart';
import 'package:scienceblog/models/article_model.dart';
import 'package:scienceblog/services/dio_service.dart';

class ArcticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
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
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
