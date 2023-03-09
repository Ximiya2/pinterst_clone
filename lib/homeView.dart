import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/view/HomePage/homePage.dart';
import 'package:pinterest_clone/view/HomePage/sportsPage/sportsPage.dart';

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
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        bottom: TabBar(
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
              text: 'Sport',
            ),
            // Tab(
            //   text: 'Groups',
            // ),
            // Tab(
            //   text: 'Channels',
            // ),
            // Tab(
            //   text: 'Bots',
            // ),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          HomePage(),
          SportsPage(),
          // GroupsPage(),
          // ChannelsPage(),
          // BotsPage(),
        ],

      ),
    );
  }
}
