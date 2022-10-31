import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodify/Controllers/popular_product_controllers.dart';
import 'package:foodify/Controllers/recommended_product_controller.dart';
import 'package:foodify/Screens/HomeScreens/main_food_page.dart';
import 'package:get/get.dart';
import 'package:foodify/Helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodify",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainFoodPage(),
    );
  }
}

class Foodify extends StatefulWidget {
  const Foodify({Key? key}) : super(key: key);

  @override
  State<Foodify> createState() => _FoodifyState();
}

class _FoodifyState extends State<Foodify> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
