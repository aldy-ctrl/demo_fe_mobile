import 'package:flutter/material.dart';
import 'package:markon_project/theme/colors.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentIndex = 0;
  static const List<Widget> widgetOpsi = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Kontol', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        unselectedFontSize: 15,
        backgroundColor: PutihRusak,
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0 ? Icon(Icons.home) : Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1 ? Icon(Icons.search) : Icon(Icons.search),
            label: ('Search'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Icon(Icons.settings)
                : Icon(Icons.settings),
            label: ('settings'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3 ? Icon(Icons.person) : Icon(Icons.person),
            label: ('Account'),
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      body: Center(
        child: widgetOpsi.elementAt(_currentIndex),
      ),
    );
  }
}
