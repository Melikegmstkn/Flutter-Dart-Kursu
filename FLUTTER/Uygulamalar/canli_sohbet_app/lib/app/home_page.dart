import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/user_page.dart';
import 'package:flutter_lovers/app/profile_page.dart';
import 'package:flutter_lovers/app/tab_items.dart';
import 'package:flutter_lovers/model/user.dart';

import 'custom_bottom_navi.dart';

class HomePage extends StatefulWidget {
  final MyUser person;

  const HomePage({Key key, @required this.person}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.AllPersons;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.AllPersons: GlobalKey<NavigatorState>(),
    TabItem.Profile: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.AllPersons: UserPage(),
      TabItem.Profile: ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: Container(
        child: CustomBottomNavi(
          navigatorKeys: navigatorKeys,
          createPage: allPages(),
          currentTab: _currentTab,
          onSelectTab: (selectTab) {
            if (selectTab == _currentTab) {
              navigatorKeys[selectTab]
                  .currentState
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _currentTab = selectTab;
              });
            }
          },
        ),
      ),
    );
  }
}

/*
  Future<bool> _userExit({BuildContext context}) async {
    final _personModel = Provider.of<UserViewModel>(context, listen: false);
    bool result = await _personModel.signOut();
    return result;
  }
  */
