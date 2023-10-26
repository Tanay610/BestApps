import 'package:e_nactr/util/dialogs.dart';
import 'package:e_nactr/views/explore/explore.dart';
import 'package:e_nactr/views/home/home.dart';
import 'package:e_nactr/views/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: [HomePage(), ExplorePage(), ProfilePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue[900],
          selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          unselectedItemColor: Colors.grey[400],
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: navigationTapped,
          currentIndex: page,
        ),
      ),
      onWillPop: () => Dialogs().showExitDialog(context),
    );
  }

  void onPageChanged(int value) {
    setState(() {
      this.page = value;
    });
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
