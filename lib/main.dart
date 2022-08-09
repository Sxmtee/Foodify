import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodify/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodify",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
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
