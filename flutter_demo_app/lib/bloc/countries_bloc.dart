import 'package:rxdart/rxdart.dart';

import 'package:flutter_demo_app/providers/countries_provider.dart';
import 'package:flutter_demo_app/model/countries_response.dart';

class CountriesBloc {
  CountriesProvider _provider = CountriesProvider();

  final _countriesFetcher = PublishSubject<CountriesResponse>();

  Stream<CountriesResponse> get countries => _countriesFetcher.stream;

  fetchCountries() async {
    CountriesResponse countriesResponse = await _provider.fetchCountries();
    _countriesFetcher.sink.add(countriesResponse);
  }

  dispose() {
    _countriesFetcher.close();
  }
}
