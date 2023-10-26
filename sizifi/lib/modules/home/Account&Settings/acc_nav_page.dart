import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Account&Settings/contact_page.dart';
import 'package:sizifi/modules/home/Account&Settings/terms&cond_page.dart';
import 'package:sizifi/modules/splash/signup%20screens/n_reset_pass.dart';

class AccountNavigationPage extends StatefulWidget {
  const AccountNavigationPage({super.key});

  @override
  State<AccountNavigationPage> createState() => _AccountNavigationPageState();
}

class _AccountNavigationPageState extends State<AccountNavigationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Account & Setting",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
            child: Center(
              child: Icon(Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color, size: 25),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SizedBox(
                        height: 22,
                        width: 25,
                        child: SvgPicture.asset("assets/icons/tour guide.svg")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size * 0.485),
                    child: const Text(
                      "Tour guide",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right_outlined),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TermsConditonsPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: SizedBox(
                          height: 21,
                          width: 25,
                          child: SvgPicture.asset(
                              "assets/icons/terms & cond..svg")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.25),
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PrivacyPolicyPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                              "assets/icons/privacy policy.svg")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.4),
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset("assets/icons/delete.svg")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size * 0.36),
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right_outlined),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ResetPassPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                              "assets/icons/update password.svg")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.3),
                      child: const Text(
                        "Update Password",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AboutPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child:
                              SvgPicture.asset("assets/icons/info_FILl.svg")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.57),
                      child: const Text(
                        "About",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ContactPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset("assets/icons/contact.svg")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size * 0.52),
                      child: const Text(
                        "Contact",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
