import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_1/Screens/HAwal.dart';
import 'package:uas_1/Screens/HProfile.dart';

class HUtama extends StatefulWidget {
  const HUtama({super.key});

  @override
  State<HUtama> createState() => _HUtamaState();
}

class _HUtamaState extends State<HUtama> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    Icon(
      Icons.shop,
      size: 150,
    ),
    HProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('GanKi'),
          actions: [
            new IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HAwal()));
              },
              icon: Icon(Icons.search),
              //Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
              //Icon(Icons.more_vert),)
            )
          ],
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          children: [_pages.elementAt(_selectedIndex)],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 20,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          elevation: 8,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 8, 131, 71),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
              backgroundColor: Colors.lightGreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
