import 'package:flutter/material.dart';
import 'package:foodify/addToCart_page.dart';
import 'package:foodify/home_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 80,
          leading: IconButton(
            onPressed: () {
              var route = MaterialPageRoute(builder: (context) => HomePage());
              Navigator.push(context, route);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 30,
                  child: Icon(Icons.shopping_cart),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 30,
                  child: Icon(Icons.segment),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/Image/servechef.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("The Fastest\n In a\n Delivery\n Food",
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: "Courier",
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 10,
                      shape: StadiumBorder(),
                      child: Text("Order Now"),
                      color: Colors.red,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text("Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Courier",
                                  fontSize: 20))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //////////////////////// Categories of Food(Burger, Pizza, Cake and Pie)/////////
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Card(
                            shape: StadiumBorder(),
                            elevation: 10,
                            color: Colors.grey[350],
                            shadowColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              width: 190,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/Image/burger.jpg"),
                                  ),
                                  Text("Burger")
                                ],
                              ),
                            ))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            shape: StadiumBorder(),
                            elevation: 10,
                            color: Colors.grey[350],
                            shadowColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              width: 190,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/Image/pizza.jpg"),
                                  ),
                                  Text("Pizza")
                                ],
                              ),
                            ))),
                    InkWell(
                        onTap: () {},
                        child: Card(
                            shape: StadiumBorder(),
                            elevation: 10,
                            color: Colors.grey[350],
                            shadowColor: Colors.transparent,
                            child: Container(
                              height: 50,
                              width: 190,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/Image/pizza.jpg"),
                                  ),
                                  Text("Cake")
                                ],
                              ),
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text("Popular Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Courier",
                                  fontSize: 20))),
                    ),
                    Text("View More"),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_right_rounded))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //////////////////////// Listview of Different Burgers here//////////
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        var route = MaterialPageRoute(
                            builder: (context) => AddCartPage());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(30)),
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/Image/kingsize.jpg"),
                            ),
                            Text("Beef Burger",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                )),
                            Text("Cheesy Mozarella",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontFamily: "Courier",
                                )),
                            Text("600\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(30)),
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/Image/burger.jpg"),
                            ),
                            Text("Double Burger",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                )),
                            Text("Double Beef",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontFamily: "Courier",
                                )),
                            Text("400\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(30)),
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/Image/king.jpg"),
                            ),
                            Text("Ham Burger",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                )),
                            Text("Cheese Beef",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                  fontFamily: "Courier",
                                )),
                            Text("500\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: "Courier",
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
