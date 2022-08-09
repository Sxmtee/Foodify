import 'package:flutter/material.dart';
import 'package:foodify/order_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int InitialPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            child: CarouselSlider(
              items: [
                ///Images of Slider
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/Image/bugchef.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/Image/pizchef.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/Image/servechef.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    InitialPage = index;
                  });
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                height: 280.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("The Fastest In Delivery Food",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: "Courier",
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Our job is to filling your tummy with delicious food and fast delivery",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        fontFamily: "Courier",
                      )),
                ]),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: MaterialButton(
                  minWidth: 300,
                  height: 50,
                  shape: StadiumBorder(),
                  onPressed: () {
                    var route =
                        MaterialPageRoute(builder: (context) => OrderPage());
                    Navigator.push(context, route);
                  },
                  child: Text("Get Started"),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
