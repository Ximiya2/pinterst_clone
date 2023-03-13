import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/view/HomePage/MockUps_page/MockUps_Page.dart';
import 'package:pinterest_clone/view/HomePage/MuteAndPastel_page/MuteAndPastel_Page.dart';
import 'package:pinterest_clone/view/HomePage/TisTheSeason_page/TisTheSeason_Page.dart';
import 'package:pinterest_clone/view/HomePage/Yellow%20Rush_page/YellowRush_Page.dart';
import 'package:pinterest_clone/view/HomePage/homePage.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: TabBar(

          //labelStyle: TextStyle(fontSize: 18, color: Colors.black),
          indicatorColor: Colors.black45,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Yellow Rush',
            ),
            Tab(
              text: 'TisTheSeason',
            ),
            Tab(
              text: 'Mute And Pastel',
            ),
            Tab(
              text: 'Mock Ups',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          HomePage(),
          YellowRushPage(),
          MuteAndPastelPage(),
          TisTheSeasonPage(),
          MockUpsPage(),
        ],

      ),
    );
  }
}
