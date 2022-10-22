import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodify/Utils/colors.dart';
import 'package:foodify/Utils/dimensions.dart';
import 'package:foodify/Widgets/bigText.dart';
import 'package:foodify/Widgets/iconText.dart';
import 'package:foodify/Widgets/smallText.dart';

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
        Container(
            //color: Colors.red,
            height: 300,
            child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: 5,
                itemBuilder: ((context, index, realIndex) {
                  return _buildPageItem(index);
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
                ))),
        CarouselIndicator(
          width: 10,
          count: 5,
          index: currentPage,
          color: AppColors.mainBlackColor,
          activeColor: AppColors.mainColor,
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
            height: Dimensions.pageViewContainer,
            //margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.mainColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/Image/pizza.jpg")))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Slide"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  ))),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1287"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
