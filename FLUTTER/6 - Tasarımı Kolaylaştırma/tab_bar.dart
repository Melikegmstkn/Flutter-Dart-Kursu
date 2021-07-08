import 'package:flutter/material.dart';

class TabOrnek extends StatefulWidget {
  TabOrnek({Key? key}) : super(key: key);

  @override
  _TabOrnekState createState() => _TabOrnekState();
}

class _TabOrnekState extends State<TabOrnek>
    with SingleTickerProviderStateMixin {
  //With -> diğer sınıfların özelliklerini aktarma
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tab Bar"), bottom: tabBar()),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.green.shade300,
            child: Text(
              "Açık yesil",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            color: Colors.green.shade500,
            child: Text(
              "Koyu yesil",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            color: Colors.green.shade900,
            child: Text(
              "Kopkoyu yesil",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: false,
      automaticIndicatorColorAdjustment: true,
      indicator: BoxDecoration(
        color: Colors.red.shade400,
      ),
      //indicatorPadding: EdgeInsets.all(5),
      controller: tabController,
      tabs: [
        Tab(
          icon: Icon(Icons.home),
          text: "ana sayfa",
        ),
        Tab(
          icon: Icon(Icons.search),
          text: "page",
        ),
        Tab(
          icon: Icon(Icons.pageview),
          text: "arama",
        ),
      ],
    );
  }
}
