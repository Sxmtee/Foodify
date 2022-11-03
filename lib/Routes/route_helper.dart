import 'package:foodify/Screens/DetailScreens/carousel_food_details.dart';
import 'package:foodify/Screens/DetailScreens/popular_food_details.dart';
import 'package:foodify/Screens/HomeScreens/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String carouselFood = "/carousel-food";
  static const String popularFood = "/popular-food";

  static String getInitial() => "$initial";
  static String getCarouselFood(int pageId) => "$carouselFood?pageId=$pageId";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: (() => MainFoodPage()),
        transition: Transition.fadeIn),
    GetPage(
        name: carouselFood,
        page: (() {
          var pageId = Get.parameters['pageId'];
          return CarouselFoodDetails(pageId: int.parse(pageId!));
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: (() {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetails(pageId: int.parse(pageId!));
        }),
        transition: Transition.fadeIn),
  ];
}
