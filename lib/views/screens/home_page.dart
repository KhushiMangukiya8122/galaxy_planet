import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/views/screens/components/SolarSystem/solar_intro_page.dart';
import 'package:galaxy_planets/views/screens/components/space/space_intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3,
            controller: tabController,
            tabs: [
              Tab(
                text: "Solar System",
              ),
              Tab(
                text: "Space",
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 18,
              child: TabBarView(
                controller: tabController,
                children: [
                  SolarIntroPage(),
                  SpaceIntroPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
