import 'dart:convert';
import 'package:cities_flutter/models/country.dart';
import 'package:http/http.dart' as http;

class CountryApi {
  // var publicUri =

  static Future<List> getCountries() async {
    // List<String> countryNames = [];
    // List<String> flagURLS = [];
    // print('I am inside the calling function for getting countries');
    var publicUri = new Uri.https('restcountries.com', '/v3.1/all');
    final response = await http.get(publicUri);
    dynamic data = jsonDecode(response.body);
    return data;
    // Map data = jsonDecode(response.body);
    // print(data);
    // List _temp = [];
  }

  static Future<List> getCountrybyName(String countryName) async {
    // List<String> countryNames = [];
    // List<String> flagURLS = [];
    var publicUri =
        new Uri.https('restcountries.com', '/v3.1/name/$countryName');
    final response = await http.get(publicUri);
    List data = jsonDecode(response.body);
    print(data);
    // for (var i = 0; i < data.length; i++) {
    //   var countryName = data[i]['name']['common'];
    //   countryNames.add(countryName);
    //   // print(data[i]['flags']['png']);
    //   flagURLS.add(data[i]['flags']['png']);
    // }

    return data;
  }
}
