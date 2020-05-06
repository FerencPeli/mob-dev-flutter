import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_demo_app/model/country_item.dart';

class CountryDetailsScreen extends StatelessWidget {
  final CountryItem country;
  CountryDetailsScreen(this.country);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              borderOnForeground: true,
              elevation: 5,
              child: Container(
                color: Color.fromARGB(120, 230, 230, 230),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    SvgPicture.network(
                      country.flag,
                      height: 80,
                      width: 120,
                      semanticsLabel: "Flag of ${country.name}",
                      placeholderBuilder: (BuildContext context) => Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${country.name}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Spoken languages",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Builder(
              builder: (context) {
                List<Widget> list = new List<Widget>();
                country.languages.forEach((language) {
                  list.add(Chip(label: Text(language.name)));
                  list.add(SizedBox(width: 10));
                });

                return new Row(children: list);
              },
            ),
            SizedBox(height: 15),
            Text(
              "Capital",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(country.capital)
          ],
        ),
      ),
    );
  }
}
