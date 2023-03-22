import 'package:covid_19/Pages/SingleCountry.dart';
import 'package:covid_19/Services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});
  Widget dummyShimmer(double h, double w) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ApiServices services = ApiServices();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffEAEFF2),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xffEAEFF2),
      ),
      body: Column(children: [
        Center(
          child: Container(
            height: 60,
            width: 340,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12),
            child: TextFormField(
              controller: searchController,
              cursorColor: Colors.black,
              cursorHeight: 25,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "  Search country here",
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<dynamic>>(
              future: services.fetchCountryStatsRecord(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((context, index) {
                        String country =
                            snapshot.data![index]['country'].toString();
                        String name =
                            snapshot.data![index]['country'].toString();
                        String flag = snapshot.data![index]['countryInfo']
                                ['flag']
                            .toString();
                        String cases =
                            snapshot.data![index]['cases'].toString();
                        String deaths =
                            snapshot.data![index]['deaths'].toString();
                        String recovered =
                            snapshot.data![index]['recovered'].toString();
                        String active =
                            snapshot.data![index]['active'].toString();
                        String todayCases =
                            snapshot.data![index]['todayCases'].toString();
                        String todayDeaths =
                            snapshot.data![index]['todayDeaths'].toString();
                        String todayRecovered =
                            snapshot.data![index]['todayRecovered'].toString();
                        String tests =
                            snapshot.data![index]['tests'].toString();
                        if (searchController.text.isEmpty) {
                          return Card(
                            elevation: 5,
                            shadowColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Image(
                                height: 60,
                                width: 60,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']),
                              ),
                              title: Text(
                                  snapshot.data![index]['country'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  "Cases: " +
                                      snapshot.data![index]['cases'].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingleCountry(
                                            name: name,
                                            flag: flag,
                                            cases: cases,
                                            deaths: deaths,
                                            recovered: recovered,
                                            active: active,
                                            todayCases: todayCases,
                                            todayDeaths: todayDeaths,
                                            todayRecovered: todayRecovered,
                                            tests: tests)));
                              },
                            ),
                          );
                        } else if (country
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return ListTile(
                            leading: Image(
                              height: 60,
                              width: 60,
                              image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']),
                            ),
                            title: Text(
                                snapshot.data![index]['country'].toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                "Cases:${snapshot.data![index]['cases'].toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleCountry(
                                          name: name,
                                          flag: flag,
                                          cases: cases,
                                          deaths: deaths,
                                          recovered: recovered,
                                          active: active,
                                          todayCases: todayCases,
                                          todayDeaths: todayDeaths,
                                          todayRecovered: todayRecovered,
                                          tests: tests)));
                            },
                          );
                        } else {
                          return Container();
                        }
                      }));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 0, 17, 255),
                    highlightColor: Color.fromARGB(255, 0, 242, 255),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              widget.dummyShimmer(60, 60),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.dummyShimmer(20, 260),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  widget.dummyShimmer(20, 230),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ),
          ),
        ),
      ]),
    );
  }
}
