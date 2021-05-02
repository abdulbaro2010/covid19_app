import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid19_ui/config/palette.dart';
import 'package:covid19_ui/config/styles.dart';
import 'package:covid19_ui/models/network.dart';
import 'package:covid19_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatsScreen extends StatefulWidget {
  
  
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  APIResponseModel apiResponseModel;

  @override
 void getDataFromAPI() async {
    setState(() {
      
    });
    const String API_URL = "https://corona.lmao.ninja/v2/all";
    var response = await http.get(Uri.parse(API_URL));
    var parsedJson = await json.decode(response.body);
    setState(() {
      apiResponseModel = APIResponseModel.fromJson(parsedJson);
     
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          
            SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            sliver: SliverToBoxAdapter(
            child: StatsGrid(),
            ),
          ),
        ],
        
      ),
    );
  }

  SliverPadding _buildHeader(){
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar(){
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}