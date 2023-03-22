// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_19/Widgets/StatisticsCard.dart';
import 'package:flutter/material.dart';

class SingleCountry extends StatelessWidget {
  String name;
  String flag;
  String cases;
  String deaths;
  String recovered;
  String active;
  String todayCases;
  String todayDeaths;
  String todayRecovered;
  String tests;

  SingleCountry({
    Key? key,
    required this.name,
    required this.flag,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
    required this.tests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 5, 69, 130),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 200.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image(
                      image: NetworkImage(flag),
                      fit: BoxFit.none,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 69, 130),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(height: 10),
                  Divider(
                    color: Color.fromARGB(255, 127, 160, 227),
                    thickness: 3,
                    indent: 160,
                    endIndent: 160,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        StatisticsCard(
                            str: "Cases",
                            color: Color.fromARGB(255, 239, 251, 230),
                            deepcolor: Colors.green,
                            num: cases),
                        StatisticsCard(
                            str: "Deaths",
                            color: Color.fromARGB(255, 205, 208, 247),
                            deepcolor: Colors.blue,
                            num: deaths)
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
                            color: Color.fromARGB(255, 253, 251, 228),
                            deepcolor: Color.fromARGB(255, 167, 150, 0),
                            num: recovered),
                        StatisticsCard(
                            str: "Active",
                            color: Color.fromARGB(255, 216, 249, 252),
                            deepcolor: Colors.cyan,
                            num: active)
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
                            str: "Today Cases",
                            color: Color.fromARGB(255, 255, 231, 239),
                            deepcolor: Colors.pink,
                            num: todayCases),
                        StatisticsCard(
                            str: "Today Deaths",
                            color: Color.fromARGB(255, 247, 205, 205),
                            deepcolor: Colors.red,
                            num: todayDeaths)
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
                            str: "Today Recovered",
                            color: Color.fromARGB(255, 250, 230, 251),
                            deepcolor: Color.fromARGB(255, 162, 76, 175),
                            num: todayRecovered),
                        StatisticsCard(
                            str: "Tests",
                            color: Color.fromARGB(255, 212, 221, 245),
                            deepcolor: Color.fromARGB(255, 33, 131, 243),
                            num: tests)
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
