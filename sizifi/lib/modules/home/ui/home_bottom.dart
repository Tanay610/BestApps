import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizifi/modules/home/ui/home_screen.dart';
import 'package:sizifi/modules/settings/ui/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({super.key});

  @override
  State<StatefulWidget> createState() => _HomeBottom();
}

class _HomeBottom extends State<HomeBottom> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xffF7A56D)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        ///  Added Stack Widget
        children: [
          Offstage(
            /// Wrap Tab with OffStage
            offstage: index != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: index != 1,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const HomeScreen();

      case 1:
        return const ProfileScreen();
      case 2:
        return const ProfileScreen();

      default:
        return const HomeScreen();
    }
  }

  Widget buildBottomNavigation() {
    print('Home Bottom');
    const inactiveColor = Color(0xFF000000);
    return Container(
        color: const Color(0xFFfff6f1),
        // padding: EdgeInsets.only(bottom: 15),
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            // selectedItemColor: Color(0xffA74A45).withOpacity(0.3),

            // iconSize: 4,
            currentIndex: index,
            selectedFontSize: 0.01,
            unselectedFontSize: 0.01,
            useLegacyColorScheme: false,

            type: BottomNavigationBarType.fixed,
            // backgroundColor: Color(0xffA74A45).withOpacity(0.3),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            items: [
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffA74A45).withOpacity(0.3),
                label: '',
                icon: SvgPicture.asset(
                  "assets/icons/oup 839.svg",
                  color: const Color(0xffA74A45).withOpacity(0.6),
                ),
                activeIcon: InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 9, bottom: 9),
                    // height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xffA74A45).withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(23, 23))),
                    child: SvgPicture.asset(
                      "assets/icons/oup 839.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(
                  "assets/icons/oup.svg",
                  color: const Color(0xffA74A45).withOpacity(0.6),
                ),
                activeIcon: InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(top: 9, bottom: 9),
                    // height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xffA74A45).withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(23, 23))),
                    child: SvgPicture.asset(
                      "assets/icons/oup.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

/*FloatingNavbar(
          margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          selectedBackgroundColor : Theme.of(context).buttonTheme.colorScheme?.onBackground,
          selectedItemColor : Theme.of(context).iconTheme.color,
          unselectedItemColor :  Theme.of(context).iconTheme.color,
          itemBorderRadius : 23,
          backgroundColor:Color(0xFFFFFFFF),
            onTap: (index) => setState(() => this.index = index),
            currentIndex: index,
            items: [
              FloatingNavbarItem(icon: Icons.store),
              FloatingNavbarItem(icon: Icons.home),
              FloatingNavbarItem(icon: Icons.settings),
            ],



          ),
          
          
          
          
          
          
          BoxDecoration(
                      color: Color(0xffA74A45).withOpacity(0.3),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(25, 25))),
                  child: SvgPicture.asset("assets/icons/oup 839.svg"),
                )), */

//! class BottomNavigatyBar extends StatefulWidget {
//   BottomNavigatyBar({super.key, required this.index});

//   late int index = 0;

//   @override
//   State<BottomNavigatyBar> createState() => _BottomNavigatyBarState();
// }

// class _BottomNavigatyBarState extends State<BottomNavigatyBar> {
//   // int index = 0;

//   Widget buildpages() {
//     switch (widget.index) {
//       case 0:
//         return HomeScreen();

//       case 1:
//         return const ProfileScreen();
//       case 2:
//         return const ProfileScreen();

//       default:
//         return HomeScreen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Color(0xFFfff6f1),
//         // padding: EdgeInsets.only(bottom: 15),
//         child: Theme(
//           data: ThemeData(
//             highlightColor: Colors.transparent,
//             splashFactory: NoSplash.splashFactory,
//           ),
//           child: BottomNavigationBar(
//             onTap: (i) {
//               setState(() {
//                 widget.index = i;
//               });
//             },
//             // selectedItemColor: Color(0xffA74A45).withOpacity(0.3),

//             // iconSize: 4,
//             currentIndex: widget.index,
//             selectedFontSize: 0.01,
//             unselectedFontSize: 0.01,
//             useLegacyColorScheme: false,

//             type: BottomNavigationBarType.fixed,
//             // backgroundColor: Color(0xffA74A45).withOpacity(0.3),
//!             landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
//!             items: [
//!               BottomNavigationBarItem(
//!                 backgroundColor: Color(0xffA74A45).withOpacity(0.3),
//!                 label: '',
//!                 icon: SvgPicture.asset(
//!                   "assets/icons/oup 839.svg",
//!                   color: Color(0xffA74A45).withOpacity(0.6),
//!                 ),
//!                 activeIcon: InkWell(
//!                   child: Container(
//!                     padding: EdgeInsets.only(top: 9, bottom: 9),
//!                     // height: 45,
//!                     width: 70,
//!                     decoration: BoxDecoration(
//!                         color: Color(0xffA74A45).withOpacity(0.3),
//!                         borderRadius:
//!                             BorderRadius.all(Radius.elliptical(23, 23))),
//!                     child: SvgPicture.asset(
//!                       "assets/icons/oup 839.svg",
//!                       height: 25,
//!                       width: 25,
//!                     ),
//!                   ),
//!                 ),
//!               ),
//!               BottomNavigationBarItem(
//!                 label: '',
//!                 icon: SvgPicture.asset(
//!                   "assets/icons/oup.svg",
//!                   color: Color(0xffA74A45).withOpacity(0.6),
//!                 ),
//!                 activeIcon: InkWell(
//!                   child: Container(
//!                     padding: EdgeInsets.only(top: 9, bottom: 9),
//!                     // height: 45,
//!                     width: 70,
//!                     decoration: BoxDecoration(
//!                         color: Color(0xffA74A45).withOpacity(0.3),
//!                         borderRadius:
//!                             BorderRadius.all(Radius.elliptical(23, 23))),
//!                     child: SvgPicture.asset(
//!                       "assets/icons/oup.svg",
//!                       height: 25,
//!                       width: 25,
//!                     ),
//!                   ),
//!                 ),
//!               )
//!             ],
//!           ),
//!         ));
//!   }
//! }

// CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(items: [
//         BottomNavigationBarItem(
//           backgroundColor: Color(0xffA74A45).withOpacity(0.3),
//           label: '',
//           icon: SvgPicture.asset(
//             "assets/icons/oup 839.svg",
//             color: Color(0xffA74A45).withOpacity(0.6),
//           ),
//           activeIcon: InkWell(
//             child: Container(
//               padding: EdgeInsets.only(top: 9, bottom: 9),
//               // height: 45,
//               width: 70,
//               decoration: BoxDecoration(
//                   color: Color(0xffA74A45).withOpacity(0.3),
//                   borderRadius: BorderRadius.all(Radius.elliptical(23, 23))),
//               child: SvgPicture.asset(
//                 "assets/icons/oup 839.svg",
//                 height: 25,
//                 width: 25,
//               ),
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: '',
//           icon: SvgPicture.asset(
//             "assets/icons/oup.svg",
//             color: Color(0xffA74A45).withOpacity(0.6),
//           ),
//           activeIcon: InkWell(
//             child: Container(
//               padding: EdgeInsets.only(top: 9, bottom: 9),
//               // height: 45,
//               width: 70,
//               decoration: BoxDecoration(
//                   color: Color(0xffA74A45).withOpacity(0.3),
//                   borderRadius: BorderRadius.all(Radius.elliptical(23, 23))),
//               child: SvgPicture.asset(
//                 "assets/icons/oup.svg",
//                 height: 25,
//                 width: 25,
//               ),
//             ),
//           ),
//         ),
//       ]),
//       tabBuilder: (BuildContext context, int index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: HomeScreen(),
//                 );
//               },
//             );

//           case 1:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: ProfileScreen(),
//                 );
//               },
//             );
//           case 3:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: AllStoresScreen(),
//                 );
//               },
//             );

//           default:
//             return CupertinoTabView();
//         }
//       },
//     );
//   }
