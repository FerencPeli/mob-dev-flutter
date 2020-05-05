import 'package:flutter/material.dart';

import 'countries/countries_screen.dart';
import 'form/form_screen.dart';
import 'location/location_screen.dart';

class MainScreen extends StatefulWidget {
  final RouteObserver<PageRoute> routeObserver;

  MainScreen(this.routeObserver);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(
      initialPage: _page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(child: CountriesScreen()),
          Container(child: FormScreen()),
          Container(child: LocationScreen())
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Text("Countries"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text("Form"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            title: Text("Location"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
