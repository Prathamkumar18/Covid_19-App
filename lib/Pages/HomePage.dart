import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid_19/Pages/Countries.dart';
import 'package:covid_19/Widgets/StatisticsCard.dart';
import 'package:covid_19/Widgets/TemplateCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.white.withAlpha(200),
        elevation: 0.0,
        centerTitle: true,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.white.withAlpha(200)),
        title: Text(
          "COVID-19",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 90,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 190,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    MyCard(
                      height: 180,
                      width: 280,
                      img: "temp1",
                    ),
                    MyCard(
                      height: 180,
                      width: 280,
                      img: "temp2",
                    ),
                    MyCard(
                      height: 180,
                      width: 280,
                      img: "temp3",
                    ),
                    MyCard(
                      height: 180,
                      width: 280,
                      img: "temp4",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(" Statistics",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              width: 380,
              color: Color.fromARGB(255, 246, 242, 242),
              child: PieChart(
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                chartType: ChartType.ring,
                ringStrokeWidth: 24,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.right,
                ),
                animationDuration: Duration(milliseconds: 1200),
                dataMap: {"Total": 12, "Recovered": 20, "Deaths": 3},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  StatisticsCard(
                      str: "Total",
                      color: Color.fromARGB(255, 255, 231, 239),
                      deepcolor: Colors.pink,
                      num: "87657"),
                  StatisticsCard(
                      str: "Deaths",
                      color: Color.fromARGB(255, 247, 205, 205),
                      deepcolor: Colors.red,
                      num: "1234442")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  StatisticsCard(
                      str: "Recovered",
                      color: Color.fromARGB(255, 239, 251, 230),
                      deepcolor: Colors.green,
                      num: "87657"),
                  StatisticsCard(
                      str: "Active",
                      color: Color.fromARGB(255, 205, 208, 247),
                      deepcolor: Colors.blue,
                      num: "35")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  StatisticsCard(
                      str: "Today Deaths",
                      color: Color.fromARGB(255, 253, 251, 228),
                      deepcolor: Color.fromARGB(255, 255, 230, 0),
                      num: "64"),
                  StatisticsCard(
                      str: "Today Recovered",
                      color: Color.fromARGB(255, 216, 249, 252),
                      deepcolor: Colors.cyan,
                      num: "34")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CountriesPage()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Track Countries",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(" Symptoms",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "sym1",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "sym3",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "sym4",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "sym5",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "sym2",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(" Prevention",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev1",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev2",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev3",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev4",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev5",
                    ),
                    MyCard(
                      height: 160,
                      width: 140,
                      img: "prev6",
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
