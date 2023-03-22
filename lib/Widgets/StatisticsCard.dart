import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String str;
  final Color color;
  final Color deepcolor;
  final String num;

  const StatisticsCard(
      {super.key,
      required this.str,
      required this.color,
      required this.num,
      required this.deepcolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [BoxShadow(color: deepcolor, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            str,
            style: TextStyle(color: deepcolor, fontSize: 20),
          ),
          Center(
            child: Text(
              num,
              style: TextStyle(color: deepcolor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
