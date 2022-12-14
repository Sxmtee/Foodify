import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodify/Controllers/popular_product_controllers.dart';
import 'package:foodify/Controllers/recommended_product_controller.dart';
import 'package:foodify/Models/products_model.dart';
import 'package:foodify/Routes/route_helper.dart';
import 'package:foodify/Screens/DetailScreens/carousel_food_details.dart';
import 'package:foodify/Screens/DetailScreens/popular_food_details.dart';
import 'package:foodify/Utils/appConstants.dart';
import 'package:foodify/Utils/colors.dart';
import 'package:foodify/Utils/dimensions.dart';
import 'package:foodify/Widgets/bigText.dart';
import 'package:foodify/Widgets/foodColumns.dart';
import 'package:foodify/Widgets/iconText.dart';
import 'package:foodify/Widgets/smallText.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  int currentPage = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: ((context, index, realIndex) {
                        return _buildPageItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                      options: CarouselOptions(
                        viewportFraction: 0.85,
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                      )))
              : CupertinoActivityIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return CarouselIndicator(
            width: 10,
            count: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            index: currentPage,
            color: AppColors.mainBlackColor,
            activeColor: AppColors.mainColor,
          );
        }),
        //Popular Text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: SmallText(text: "Food Pairing"))
            ],
          ),
        ),
        //Listview of Food and Images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getPopularFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            //Image in the row
                            Container(
                              width: Dimensions.listViewImgSizeW,
                              height: Dimensions.listViewImgSizeH,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          AppConstants.BASE_URI +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProduct
                                                  .recommendedProductList[index]
                                                  .img!))),
                            ),
                            //Text in the row
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20)),
                                  color: AppColors.allWhite,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      SmallText(
                                          text: "With chinese characteristics"),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Row(
                                        children: [
                                          IconAndText(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: AppColors.iconColor1),
                                          IconAndText(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColors.mainColor),
                                          IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.iconColor2),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
              : CupertinoActivityIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getCarouselFood(index));
          },
          child: Container(
              height: Dimensions.pageViewContainer,
              //margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URI +
                          AppConstants.UPLOAD_URL +
                          popularProduct.img!)))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.allWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.allWhite,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: AppColors.allWhite,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: AppColors.allWhite,
                    offset: Offset(5, 0),
                  ),
                ]),
            child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: FoodColumns(
                  text: popularProduct.name!,
                )),
          ),
        ),
      ],
    );
  }
}
