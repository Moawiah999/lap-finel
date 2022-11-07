import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class Test_Screen extends StatefulWidget {
  const Test_Screen({super.key});

  @override
  State<Test_Screen> createState() => _Test_ScreenState();
}

class _Test_ScreenState extends State<Test_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
         
          ),
          Container(
            height: 500,
            width: 400,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("get locition"),
          )
        ],
      ),
    );
  }
}
