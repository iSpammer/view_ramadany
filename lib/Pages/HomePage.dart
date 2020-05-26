import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:viewramadany/API/auth.dart';
import 'package:viewramadany/Components/PopUpCard.dart';
import 'package:viewramadany/Pages/MoviesListPage.dart';
import '../main.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({
    this.userId,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    currentIndex = 1;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void logoutCallback() {
    setState(() {
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BubbleBottomBar(
            backgroundColor: darkModeOn ? Colors.white30 : Colors.white,
            hasNotch: true,
            fabLocation: BubbleBottomBarFabLocation.end,
            opacity: .2,
            currentIndex: currentIndex,
            onTap: changePage,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            //border radius doesn't work when the notch is enabled.
            elevation: 8,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: Colors.red,
                  icon: Icon(
                    Icons.dashboard,
                    color: darkModeOn ? Colors.white30 : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.dashboard,
                    color: Colors.red,
                  ),
                  title: Text("Home")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.green,
                  icon: Icon(
                    Icons.menu,
                    color: darkModeOn ? Colors.white30 : Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.menu,
                    color: Colors.green,
                  ),
                  title: Text("Menu"))
            ],
          ),
          body: getChildren(currentIndex),
        ),
        PopUpCard(),
      ],
    );
  }

  Widget getChildren(int i) {
    List<Widget> _children = [MoviesListPage(), SettingsScreen()];
    return _children[i];
  }
}
