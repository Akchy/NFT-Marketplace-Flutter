import 'package:flutter/material.dart';
import 'package:marketplace/screens/assets.dart';
import 'package:marketplace/screens/profile.dart';
import 'package:marketplace/widgets/appbar.dart';
import 'package:marketplace/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late bool isDarkMode;
  int _selectedIndex = 0;

  List<Widget> menu = const [
    HomeWidget(),
    AssetsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
     isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;


    return Scaffold(
      appBar: appBar(isDarkMode),
      body: menu[_selectedIndex],
      bottomNavigationBar:
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff3b22a1),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
