import 'package:flutter/material.dart';



class DayImage extends StatelessWidget {
  const DayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/img1.png")
        ],
      ),
    );
  }
}
