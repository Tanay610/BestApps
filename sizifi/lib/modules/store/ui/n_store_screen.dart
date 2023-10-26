import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/home/data/model/store_model.dart';
import 'package:sizifi/modules/home/User%20Pages/wi_user_info.dart';
//import 'package:sizifi/modules/store/ui/add_new_user.dart';
import 'package:sizifi/modules/store/ui/add_store.dart';
//import 'package:sizifi/modules/store/widgets/users_widget.dart';
import 'package:sizifi/reuseable_widgets/device_i_widget.dart';
//import '../../../components/sf_button.dart';
import '../../home/notifiers/store_state.dart';
//import '../../authentication/notifiers/auth_state.dart';
import '../../home/data/model/orders.dart';
import '../../home/data/model/tailor.dart';
import '../../home/notifiers/order_state.dart';
import '../../home/notifiers/tailor_state.dart';
//import '../../home/widgets/orders_widget.dart';
//import '../../settings/ui/tailor_details_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreInfoPage extends StatefulWidget {
  final Store? store;
  StoreInfoPage({super.key, this.store});

  @override
  State<StoreInfoPage> createState() => _StoreInfoPageState();
}

class _StoreInfoPageState extends State<StoreInfoPage> {
  String? selectedValue;
  List<Order> orders = [];
  late List members;
  late String name;
  late var id;
  late String location;
  late String about;
  late String store_brand_name;
  late String brand_store;
  late String email;
  late String phone_no;
  late String address_1;
  late String address_2;
  late String landmark;
  late String city;
  late String pin_code;
  late String state;
  @override
  void initState() {
    super.initState();
    members = [];
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _refreshControllerTailor =
      RefreshController(initialRefresh: false);
  final RefreshController _refreshControllerUser =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    void _onRefresh() async {
      try {
        Provider.of<OrderState>(context, listen: false).getOrders;
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      } catch (e) {
        _refreshController.refreshFailed();
      }

      // if failed,use refreshFailed()
    }

    void _onLoading() async {
      if (mounted) {
        setState(() {
          Provider.of<OrderState>(context, listen: false).getOrders;
        });
      }
      _refreshController.loadComplete();
    }

    //***********************************************************************
    void _onRefresh1() async {
      try {
        Provider.of<TailorState>(context, listen: false).getTailors();
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      } catch (e) {
        _refreshController.refreshFailed();
      }

      // if failed,use refreshFailed()
    }

    void _onLoading1() async {
      if (mounted) {
        setState(() {
          Provider.of<TailorState>(context, listen: false).getTailors();
        });
      }
      _refreshController.loadComplete();
    }

    //***********************************************************************
    void _onRefreshUser() async {
      try {
        Provider.of<StoreState>(context, listen: false).getMembers;
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      } catch (e) {
        _refreshController.refreshFailed();
      }

      // if failed,use refreshFailed()
    }

    void _onLoadingUser() async {
      if (mounted) {
        setState(() {
          Provider.of<StoreState>(context, listen: false).getMembers;
        });
      }
      _refreshController.loadComplete();
    }

    void _onShare(BuildContext context) async {
      final box = context.findRenderObject() as RenderBox?;

      await Share.share(
        "https://maps.google.com/maps?q=" + location,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    }

    // AuthState as = Provider.of<AuthState>(context);
    // StoreState ss = Provider.of<StoreState>(context);
    // ss.getStores(as.userData);

    // List stores = ss.stores;

    // members = Provider.of<StoreState>(context).activeStore.members;
    // name = Provider.of<StoreState>(context).activeStore.name;
    // location = Provider.of<StoreState>(context).activeStore.location;
    // about = Provider.of<StoreState>(context).activeStore.about;
    if (widget.store != null) {
      name = widget.store!.store_name;
      id = widget.store!.team_id;
      location = widget.store!.location;
      about = widget.store!.about;
      store_brand_name = widget.store!.store_brand_name;
      brand_store = widget.store!.brand_store;
      email = widget.store!.email;
      phone_no = widget.store!.phone_no;
      address_1 = widget.store!.address_1;
      address_2 = widget.store!.address_2;
      landmark = widget.store!.landmark;
      city = widget.store!.city;
      pin_code = widget.store!.pin_code;
      state = widget.store!.state;
    }
    // print(members);
    // orders = Provider.of<OrderState>(context, listen: false).orders;
    // print(orders);
    // List<Tailor> tailors = Provider.of<TailorState>(context).tailors;
    // print(tailors);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            name,
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).restorablePopAndPushNamed(
                //   Routes.allStores,
                //   // (_) => false,
                // );
              },
              child: Icon(Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color, size: 25)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 14),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddStoreScreen(store: widget.store)),
                    );
                  },
                  child: Icon(Icons.edit,
                      color: Theme.of(context).iconTheme.color, size: 20)),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  width: size * 0.95,
                  height: sizee * 0.89,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 144,
                          child: Stack(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: const Image(
                                    image:
                                        AssetImage("assets/images/store.png"),
                                    height: 119)),
                            Positioned(
                              bottom: 1,
                              left: 18,
                              child: Container(
                                  height: 74,
                                  width: 74,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).iconTheme.color,
                                    borderRadius: BorderRadius.circular(1500),
                                  ),
                                  child: Center(
                                    child: Text(
                                      getInitials(name.toUpperCase()),
                                      style: GoogleFonts.poppins(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFFFFFF)),
                                    ),
                                  )),
                            )
                          ])),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Icon(
                                      FontAwesomeIcons.store,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(widget.store!.store_name,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      FontAwesomeIcons.shop,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(store_brand_name,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      FontAwesomeIcons.idCard,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(brand_store,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      Icons.mail,
                                      size: 19,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(email,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      FontAwesomeIcons.phone,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(phone_no,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const Icon(
                                      FontAwesomeIcons.locationCrosshairs,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(address_1,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    // Icon(
                                    //   FontAwesomeIcons.c,
                                    //   size: 18,
                                    // ),
                                    const SizedBox(width: 27),
                                    Text(city,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    // Icon(
                                    //   FontAwesomeIcons.p,
                                    //   size: 18,
                                    // ),
                                    const SizedBox(width: 27),
                                    Text(pin_code,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    // Icon(
                                    //   FontAwesomeIcons.s,
                                    //   size: 18,
                                    // ),
                                    const SizedBox(width: 27),
                                    Text(state,
                                        style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(children: [
                                    Icon(
                                      FontAwesomeIcons.solidFlag,
                                      size: 18,
                                    ),
                                    SizedBox(width: 7),
                                    Text("India",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                                ]),
                          ],
                        ),
                      ),
                      Container(
                        width: size * 0.86,
                        height: sizee * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color(0xFFA74A45).withOpacity(0.5)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            _onShare(context);
                          },
                          child: const Center(
                            child: Text(
                              "Share Location",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFA74A45)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size * 0.86,
                        height: sizee * 0.08,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA74A45),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              "View Orders",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizee * 0.03,
                ),

                /// users section of the store which starts with the users

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 14,
                      ),
                      child: Text(
                        "Users",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SvgPicture.asset(
                                "assets/icons/Group 76045.svg"),
                          ),
                          const Text(
                            "Add User",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                fontFamily: "poppins"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// white container of the user active information

                user_white_container(size: size, sizee: sizee),
                user_white_container(size: size, sizee: sizee),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Load More",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.keyboard_double_arrow_down),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizee * 0.05,
                ),

                /// Tailors starting section of the tailor info
                ///

                /// Tailor section of the store which starts with the Tailor

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 14,
                      ),
                      child: Text(
                        "Tailor",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Icon(
                          //   Icons.person_3_outlined,
                          //   color: Colors.grey,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SvgPicture.asset(
                                "assets/icons/Group 76045.svg"),
                          ),
                          const Text(
                            "Add Tailor",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                fontFamily: "poppins"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// white container of the tailor active information
                ///
                ///
                ///
                ///
                ///
                ///
                ///
//

                // Tailor_Info_widget(size: size, tailor: ,),

                // Tailor_Info_widget(size: size, tailor: null,),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Load More",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.keyboard_double_arrow_down)
                    ],
                  ),
                ),

                SizedBox(
                  height: sizee * 0.05,
                ),

                //// Devices section starts from  here  ‱‱‱‱‱‱‱‱‱‱‱‱⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁜⁞⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂⌂
                ///
                ///
                ///
                ///

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14,
                      ),
                      child: Text(
                        "Devices",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),

                Device_widget(size: size, sizee: sizee),

                Device_widget(size: size, sizee: sizee),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//! device widget container which holds the information of the device

//// external widgets
