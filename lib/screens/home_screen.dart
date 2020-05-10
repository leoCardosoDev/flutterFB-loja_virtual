import 'package:flutter/material.dart';
import 'package:lojavirtualapp/tabs/home_tab.dart';
import 'package:lojavirtualapp/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        ),
      ],
    );
  }
}

