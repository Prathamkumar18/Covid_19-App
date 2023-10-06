class AppUrl {
  static const String baseUrl = "https://disease.sh/v3/covid-19/";
  static const String worldStatsApi = "${baseUrl}all";
  static const String countriesList = "${baseUrl}countries";
  static const url = 'https://covid-19-plasma-prathamkumar18.onrender.com';
  static const donor = "$url/donor";
  static const addDonor = "$donor/add-donor";
  static const getAllDonors = "$donor/get-all-donors";
  static const blockDonor = "$donor/delete-donor";
}
