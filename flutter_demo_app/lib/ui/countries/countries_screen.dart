import 'package:flutter/material.dart';
import 'package:flutter_demo_app/bloc/countries_bloc.dart';
import 'package:flutter_demo_app/model/countries_response.dart';
import 'package:flutter_demo_app/ui/countries/country_item.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  CountriesBloc _countriesBloc = CountriesBloc();

  @override
  Widget build(BuildContext context) {
    _countriesBloc.fetchCountries();

    return StreamBuilder(
        stream: _countriesBloc.countries,
        builder: (context, AsyncSnapshot<CountriesResponse> snapshot) {
          if (snapshot.hasData) {
            return _buildCountriesScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildCountriesScreen(CountriesResponse data) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of countries"),
      ),
      body: ListView.builder(
        itemCount: data.countries.length,
        itemBuilder: (BuildContext context, int index) => CountryItemWidget(data.countries[index]),
      ),
    );
  }
}
