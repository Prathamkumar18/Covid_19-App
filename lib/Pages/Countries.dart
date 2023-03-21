import 'package:flutter/material.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
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
        SizedBox(height: 20,),
        ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Icon(Icons.egg),
                title: Text("Country"),
                subtitle: Text("232144"),
                onTap: () {},
              );
            }))
      ]),
    );
  }
}
