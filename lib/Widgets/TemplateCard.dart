import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.height,
      required this.width,
      required this.img});
  final double height;
  final double width;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 1,
              color: Color.fromARGB(255, 180, 194, 240),
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage("Assets/$img.png"), fit: BoxFit.cover),
      ),
    );
  }
}
