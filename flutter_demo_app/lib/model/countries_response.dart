import 'package:flutter_demo_app/model/country_item.dart';

class CountriesResponse {
  List<CountryItem> countries;

  CountriesResponse(this.countries);

  CountriesResponse.fromJson(List<dynamic> json) {
    List<CountryItem> items = List();
    for (var i = 0; i < json.length; i++) {
      CountryItem country = CountryItem.fromJson(json[i]);
      items.add(country);
    }
    countries = items;
  }
}
