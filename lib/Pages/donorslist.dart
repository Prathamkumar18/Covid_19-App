import 'dart:convert';
import 'dart:ui';

import 'package:covid_19/Model/donor.dart';
import 'package:covid_19/Services/Utilities/appUrls.dart';
import 'package:covid_19/Services/Utilities/message.dart';
import 'package:covid_19/Widgets/donorInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DonorsList extends StatefulWidget {
  const DonorsList({super.key});

  @override
  State<DonorsList> createState() => _DonorsListState();
}

class _DonorsListState extends State<DonorsList> {
  List<Donor> donors = [];
  void initState() {
    super.initState();
    getAllDonors();
  }

  Future<void> getAllDonors() async {
    final response = await http.get(Uri.parse(AppUrl.getAllDonors));
    if (response.statusCode == 200) {
      final List<dynamic> donorDataList = json.decode(response.body)['donors'];
      final List<Donor> fetchedDonors = donorDataList.map((data) {
        return Donor.fromJson(data);
      }).toList();
      setState(() {
        donors = fetchedDonors;
      });
    } else {
      throw Exception('Failed to load donors');
    }
  }

  Future<void> deleteDonor(String email) async {
    final url = Uri.parse(AppUrl.blockDonor);
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        donors.removeWhere((donor) => donor.email == email);
        showSnackBar(context, 'User Blocked');
        getAllDonors();
      });
    } else {
      showSnackBar(context, 'Failed to Block');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAEFF2),
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
        backgroundColor: Color(0xffEAEFF2),
        elevation: 0.0,
        centerTitle: true,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: Text(
          "Plasma Donors",
          style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          for (int i = 0; i < donors.length; i++)
            DonorsInfo(
              name: donors.elementAt(i).name,
              age: donors.elementAt(i).age,
              email: donors.elementAt(i).email,
              address: donors.elementAt(i).address,
              bloodGroup: donors.elementAt(i).bloodGroup,
              phoneNumber: donors.elementAt(i).phoneNumber,
              onBlockPressed: () {
                deleteDonor(donors.elementAt(i).email);
              },
            )
        ]),
      ),
    );
  }
}
