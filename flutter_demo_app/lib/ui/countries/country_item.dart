import 'package:flutter/material.dart';

import 'package:flutter_demo_app/model/country_item.dart';
import 'country_details_screen.dart';

class CountryItemWidget extends StatelessWidget {
  final CountryItem country;

  CountryItemWidget(this.country);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CountryDetailsScreen(country)),
        );
      },
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Text(
                "${country.name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  (" (${country.nativeName})"),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


