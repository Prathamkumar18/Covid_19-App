import 'dart:convert';

import 'package:covid_19/Model/WorldStatsModel.dart';
import 'package:covid_19/Services/Utilities/appUrls.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<worldStats> fetchWorldStatsRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return worldStats.fromJson(data);
    } else {
      throw ("error");
    }
  }

  Future<List<dynamic>> fetchCountryStatsRecord() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw ("error");
    }
  }
}
