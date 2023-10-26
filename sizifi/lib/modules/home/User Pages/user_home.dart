import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/User%20Pages/search_user.dart';
import 'package:sizifi/modules/home/User%20Pages/user_add.dart';
import 'package:sizifi/modules/home/User%20Pages/user_info-page.dart';
import 'package:sizifi/modules/home/User%20Pages/wi_user_info.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final bool _isUser = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Users",
            textAlign: TextAlign.left,
            style: GoogleFonts.koHo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchDialog();
                }));
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: Center(
                      child: Icon(Icons.search,
                          color: Theme.of(context).iconTheme.color, size: 25))),
            ),
          ],
          leading: InkWell(
              onTap: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(Routes.tailorList, (_) => false);
                Navigator.pop(context);
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: Center(
                      child: Icon(Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
                          size: 25)))),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: _isUser
            ? SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const UserInfoPage();
                          }));
                        },
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 7,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return user_white_container(
                                  size: MediaQuery.of(context).size.width,
                                  sizee: MediaQuery.of(context).size.height);
                            }),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const UserInfoPage();
                          }));
                        },
                        child: SvgPicture.asset(
                            "assets/images/Mobile user-pana 1.svg")),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFA74A45),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddUserPage();
            }));
          },
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 34,
          ),
        ),
      ),
    );
  }
}
