import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_demo_app/model/countries_response.dart';

class CountriesProvider {
  final _baseUrl = "https://restcountries.eu/rest/v2/all";

  Future<CountriesResponse> fetchCountries() async {
    final response = await http.get("$_baseUrl");

    if (response.statusCode == 200) {
      return CountriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
