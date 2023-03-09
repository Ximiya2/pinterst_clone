import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/view/HomePage/homePage.dart';
import 'package:pinterest_clone/view/ProfilPage/ProfilPage.dart';
import 'package:pinterest_clone/view/SearchPage/seachPage.dart';
import 'package:pinterest_clone/view/nitificationPage/NotificationPage.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  var _pages = [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    ProfilPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
          ),
        ],
      ),
    );
  }
}
