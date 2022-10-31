import 'package:foodify/Controllers/popular_product_controllers.dart';
import 'package:foodify/Controllers/recommended_product_controller.dart';
import 'package:foodify/Data/Api/api_client.dart';
import 'package:foodify/Data/Repository/popular_product_repo.dart';
import 'package:foodify/Data/Repository/recommended_product_repo.dart';
import 'package:foodify/Utils/appConstants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URI));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
