
import 'package:flutter/material.dart';
import 'package:news_app/views/TabBarViews/allNews.dart';
import 'package:news_app/views/TabBarViews/breakingNew.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('News App',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.black38
        ),),
        bottom: TabBar(
          indicatorColor: Colors.black54,
            labelColor: Colors.black54,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
            tabs: [
          Tab(text: 'Breaking News',),
          Tab(text: 'All News',),
        ]),
      ),
          body: TabBarView(
              children: [
                BreakingNews(),
                AllNews(),
          ]),
    ));
  }
}
