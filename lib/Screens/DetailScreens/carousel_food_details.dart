import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodify/Controllers/popular_product_controllers.dart';
import 'package:foodify/Routes/route_helper.dart';
import 'package:foodify/Screens/HomeScreens/main_food_page.dart';
import 'package:foodify/Utils/appConstants.dart';
import 'package:foodify/Utils/colors.dart';
import 'package:foodify/Utils/dimensions.dart';
import 'package:foodify/Widgets/appIcon.dart';
import 'package:foodify/Widgets/bigText.dart';
import 'package:foodify/Widgets/expandableText.dart';
import 'package:foodify/Widgets/foodColumns.dart';
import 'package:foodify/Widgets/iconText.dart';
import 'package:foodify/Widgets/smallText.dart';
import 'package:get/get.dart';

class CarouselFoodDetails extends StatelessWidget {
  final int pageId;
  const CarouselFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
        backgroundColor: AppColors.allWhite,
        body: Stack(
          children: [
            //background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.carouselFoodImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConstants.BASE_URI +
                              AppConstants.UPLOAD_URL +
                              product.img!))),
                )),
            //icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInitial());
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios_rounded)),
                    AppIcon(icon: Icons.shopping_cart_outlined)
                  ],
                )),
            //intro of food
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.carouselFoodImgSize - 20,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20)),
                        color: AppColors.allWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodColumns(
                          text: product.name!,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: "Introduce"),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableText(text: product.description!),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: Dimensions.listViewImgSizeH,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height20,
                  vertical: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height20,
                        vertical: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.allWhite),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(text: popularProduct.quantity.toString()),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height20,
                        vertical: Dimensions.width20),
                    child: BigText(
                      text: "\$ ${product.price!} | Add to cart",
                      color: AppColors.allWhite,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
