import 'package:flutter/material.dart';
import 'package:foodify/order_page.dart';

class AddCartPage extends StatefulWidget {
  const AddCartPage({Key? key}) : super(key: key);

  @override
  State<AddCartPage> createState() => _AddCartPageState();
}

class _AddCartPageState extends State<AddCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 80,
        leading: CircleAvatar(
          backgroundColor: Colors.white54,
          radius: 30,
          child: IconButton(
            onPressed: () {
              var route = MaterialPageRoute(builder: (context) => OrderPage());
              Navigator.push(context, route);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white54,
            radius: 30,
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                width: double.infinity,
                height: 600.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 170,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 150,
                      height: 50,
                      shape: StadiumBorder(),
                      child: Text("-        1        +"),
                      color: Colors.red,
                      textColor: Colors.white,
                    )
                  ],
                ),
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
                  onPressed: () {},
                  child: Text("Add to Cart"),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                //margin: EdgeInsets.only(left: 140, top: 10),
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/Image/kingsize.jpg")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
