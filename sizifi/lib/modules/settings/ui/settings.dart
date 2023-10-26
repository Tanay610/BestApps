import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Account&Settings/acc_nav_page.dart';
import 'package:sizifi/modules/home/Device/manage_devices.dart';
import 'package:sizifi/modules/home/Order%20pages/order_setting.dart';
import 'package:sizifi/modules/home/Templates/templates_page.dart';
import 'package:sizifi/modules/home/User%20Pages/user_home.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Settings',
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.homeBottom, (_) => false);
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
        body: Consumer<AuthState>(
          builder: (context, value, child) {
            AuthState state = Provider.of<AuthState>(context, listen: false);
            if (!state.isLoggedIn) return Container();
            return Container(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 17,
                // ),
                padding: const EdgeInsets.only(top: 18, left: 12, right: 12),
                child: ListView(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.editProfile,
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.user.name,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF333333)),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.58,
                                    child: Text(
                                      state.user.email,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF969696)),
                                    ),
                                  ),
                                ]),
                          ]),
                          SizedBox(
                              height: 24,
                              width: 24,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              )),
                        ]),
                  ),
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     Routes.allStores, (_) => false);
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return DateCreatedDialog();
                      //     });
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.only(
                        left: 14.5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            SvgPicture.asset(
                                "assets/icons/Plan and Subscriptions.svg"),
                            const SizedBox(width: 25),
                            Text("Plan & Subscription",
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ]),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 24,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MangageDevicePage();
                      }));
                    },
                    child: Container(
                        height: 60,
                        // padding: const EdgeInsets.symmetric(horizontal: 29),
                        padding: const EdgeInsets.only(
                          left: 14.5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SvgPicture.asset(
                                    "assets/icons/manage devices.svg"),
                                const SizedBox(width: 25),
                                Text("Manage Devices",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ])),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.allStores);
                      },
                      child: Container(
                          height: 60,
                          // padding: const EdgeInsets.symmetric(horizontal: 29),
                          padding: const EdgeInsets.only(
                            left: 14.5,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(
                                      "assets/icons/store settings.svg"),
                                  const SizedBox(width: 25),
                                  Text("Store Settings",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 24,
                                  color: Theme.of(context).iconTheme.color,
                                )
                              ]))),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.tailorList);
                    },
                    child: Container(
                      height: 60,
                      // padding: const EdgeInsets.symmetric(horizontal: 29),
                      padding: const EdgeInsets.only(
                        left: 14.5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              SvgPicture.asset(
                                  "assets/icons/tailor settings.svg"),
                              const SizedBox(width: 25),
                              Text("Tailor Settings",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ]),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 24,
                              color: Theme.of(context).iconTheme.color,
                            )
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const UserHomePage();
                          },
                        ),
                      );
                    },
                    child: Container(
                        height: 60,
                        // padding: const EdgeInsets.symmetric(horizontal: 29),
                        padding: const EdgeInsets.only(
                          left: 14.5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SvgPicture.asset(
                                    "assets/icons/User settings.svg"),
                                const SizedBox(width: 25),
                                Text("User Settings",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              )
                            ])),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     Routes.orderSetting, (_) => false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const OrderSetPage();
                      })));
                    },
                    child: Container(
                        height: 60,
                        // padding: const EdgeInsets.symmetric(horizontal: 29),
                        padding: const EdgeInsets.only(
                          left: 14.5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SvgPicture.asset(
                                    "assets/icons/Order Settings.svg"),
                                const SizedBox(width: 25),
                                Text("Order Settings",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              )
                            ])),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const TemplatesPage();
                      }));
                    },
                    child: Container(
                        height: 60,
                        // padding: const EdgeInsets.symmetric(horizontal: 29),
                        padding: const EdgeInsets.only(
                          left: 14.5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SvgPicture.asset("assets/icons/templates.svg"),
                                const SizedBox(width: 25),
                                Text("Templates",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              )
                            ])),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AccountNavigationPage();
                      }));
                    },
                    child: Container(
                        height: 60,
                        // padding: const EdgeInsets.symmetric(horizontal: 29),
                        padding: const EdgeInsets.only(
                          left: 14.5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SvgPicture.asset(
                                    "assets/icons/Account and settings.svg"),
                                const SizedBox(width: 25),
                                Text("Account & Setting",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ]),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: Theme.of(context).iconTheme.color,
                              )
                            ])),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                      height: 55,
                      child: TextButton(
                        onPressed: () async {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Log Out"),
                              content: const Text(
                                  "Are you sure you want to log out?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'CANCEL',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFA74A45)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // EasyLoading.show(
                                    //     maskType: EasyLoadingMaskType.custom);
                                    state.logout();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/', (_) => false);
                                  },
                                  child: Text(
                                    'LOG OUT',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFA74A45)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.background,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 27),
                            const Image(
                                image: AssetImage("assets/icons/logout.png"),
                                height: 24),
                            const SizedBox(width: 22),
                            Text("Logout",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFFFFFFFF),
                                )),
                          ],
                        ),
                      )),
                  const SizedBox(height: 18),
                ]));
          },
        ),
      ),
    );
  }
}
