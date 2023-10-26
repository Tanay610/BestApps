import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/home/data/model/store_model.dart';
import 'package:sizifi/modules/store/ui/add_new_user.dart';
import 'package:sizifi/modules/store/ui/add_store.dart';
import 'package:sizifi/modules/store/widgets/users_widget.dart';
import '../../../components/sf_button.dart';
import '../../home/notifiers/store_state.dart';
import '../../home/data/model/orders.dart';
import '../../home/data/model/tailor.dart';
import '../../home/notifiers/order_state.dart';
import '../../home/notifiers/tailor_state.dart';
import '../../home/widgets/orders_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../settings/ui/Tailor_Setting/tailor_details_screen.dart';

class SingleStoreScreen extends StatefulWidget {
  Store? store;
  SingleStoreScreen({Key? key, this.store}) : super(key: key);

  @override
  _SingleStoreScreenState createState() => _SingleStoreScreenState();
}

class _SingleStoreScreenState extends State<SingleStoreScreen> {
  String? selectedValue;
  Store? store;
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

    // AuthState as = Provider.of<AuthState>(context);
    StoreState ss = Provider.of<StoreState>(context);
    // ss.getStores(as.userData);

    // List stores = ss.stores;

    // members = Provider.of<StoreState>(context).activeStore.members;
    // name = Provider.of<StoreState>(context).activeStore.name;
    // location = Provider.of<StoreState>(context).activeStore.location;
    // about = Provider.of<StoreState>(context).activeStore.about;
    if (store == null) {
      store = widget.store;
      print(store?.store_name);
      //members = store!.members;
      name = store!.store_name;
      id = store!.team_id;
      location = store!.location;
      about = store!.about;
      store_brand_name = store!.store_brand_name;
      brand_store = store!.brand_store;
      email = store!.email;
      phone_no = store!.phone_no;
      address_1 = store!.address_1;
      address_2 = store!.address_2;
      landmark = store!.landmark;
      city = store!.city;
      pin_code = store!.pin_code;
      state = store!.state;
      // print(widget.store!.members);
      // members = widget.store!.members;
    }
    // print(members);
    orders = Provider.of<OrderState>(context, listen: false).orders;
    print(orders);
    List<Tailor> tailors = Provider.of<TailorState>(context).tailors;
    print(tailors);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  pinned: true,
                  // snap: true,
                  floating: true,
                  backgroundColor: const Color(0xfffffffff),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 550.0,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(top: 10),
                    centerTitle: true,
                    title: Container(
                      color: const Color(0xFFFFFFFF),
                      child: TabBar(
                          indicatorColor: const Color(0xFFA74A45),
                          tabs: [
                            Tab(
                              child: Text("Users",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA74A45))),
                            ),
                            Tab(
                              child: Text("Orders",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA74A45))),
                            ),
                            Tab(
                              child: Text("Tailors",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA74A45))),
                            ),
                          ]),
                    ),
                    background: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          // Navigator.of(context)
                                          //     .pushNamedAndRemoveUntil(
                                          //         Routes.allStores,
                                          //         (_) => false);

                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(Icons.arrow_back,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 25)),
                                  ],
                                ),
                                Text(name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddStoreScreen(
                                                      store: widget.store,
                                                    )),
                                          );
                                        },
                                        child: Icon(Icons.edit,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 25)),
                                    InkWell(
                                        onTap: () async {
                                          Store store = Store(
                                              team_id: id,
                                              store_name: name,
                                              location: location,
                                              about: about,
                                              order_no_prefix: "1234",
                                              next_no: '0945',
                                              //members: members,
                                              store_brand_name:
                                                  store_brand_name,
                                              brand_store: brand_store,
                                              email: email,
                                              phone_no: phone_no,
                                              address_1: address_1,
                                              address_2: address_2,
                                              landmark: landmark,
                                              city: city,
                                              pin_code: pin_code,
                                              state: state,
                                              country: "India");

                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text("Delete!!"),
                                              content: Text(
                                                  "Are you sure you want to delete $name"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(
                                                    'CANCEL',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFFA74A45)),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    // EasyLoading.show(
                                                    //     maskType: EasyLoadingMaskType.custom);
                                                    ss.deleteStore(store);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "${store.store_name} Deleted!!"),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .splashColor,
                                                    ));
                                                    print("store deleted");
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            '/',
                                                            (_) => false);
                                                  },
                                                  child: Text(
                                                    'Delete',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFFA74A45)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                            height: 24,
                                            width: 24,
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: Icon(Icons.delete_rounded,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                                size: 25))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 144,
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: const Image(
                                        image: AssetImage(
                                            "assets/images/store.png"),
                                        height: 119)),
                                Positioned(
                                  bottom: 1,
                                  left: 18,
                                  child: Container(
                                      height: 74,
                                      width: 74,
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        borderRadius:
                                            BorderRadius.circular(1500),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.store),
                                            const SizedBox(width: 7),
                                            Text(name,
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
                                            const Icon(FontAwesomeIcons.shop),
                                            const SizedBox(width: 7),
                                            Text(store_brand_name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons
                                                .brandsFontAwesome),
                                            const SizedBox(width: 7),
                                            Text(brand_store,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(
                                                FontAwesomeIcons.envelope),
                                            const SizedBox(width: 7),
                                            Text(email,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.phone),
                                            const SizedBox(width: 7),
                                            Text(phone_no,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons
                                                .locationCrosshairs),
                                            const SizedBox(width: 7),
                                            Text(
                                                address_1 +
                                                    address_2 +
                                                    landmark,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.c),
                                            const SizedBox(width: 7),
                                            Text(city,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.p),
                                            const SizedBox(width: 7),
                                            Text(pin_code,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.s),
                                            const SizedBox(width: 7),
                                            Text(state,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall),
                                          ]),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const SizedBox(height: 10),
                                          Row(children: [
                                            const Icon(FontAwesomeIcons.flag),
                                            const SizedBox(width: 7),
                                            Text(
                                              "India",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                          ]),
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            child: Icon(Icons.phone,
                                                size: 25,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color),
                                          ),
                                        ]),
                                  ])),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 11),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                        thickness: 1,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.14)),
                                    Text(
                                      about,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF333333)),
                                    ),
                                    Text(
                                      about,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF5B5B5B)),
                                    ),
                                  ]))
                        ])),
                  )),
            ];
          },
          body: Container(
            child: TabBarView(children: [
              Container(
                // color: Color(0xFFfff6f1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddNewUserScreen(
                                                  store: store,
                                                )),
                                      );
                                    },
                                    child: Center(
                                        child: Icon(Icons.add,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 28))),
                              ]),
                        ])),
                    const SizedBox(height: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: members.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UsersWidget(
                            name: members[index]["userName"],
                            roles: members[index]["roles"][0]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 0.0, height: 10.0);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Order order = orders[index];

                        return OrderWidget(
                          order: order,
                          items: order.items,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 0.0, height: 10.0);
                      },
                      itemCount: orders.length),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    // header: WaterDropHeader(),
                    controller: _refreshControllerTailor,
                    onRefresh: _onRefresh1,
                    onLoading: _onLoading1,
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          Tailor tailor = tailors[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TailorDetailsScreen(
                                          tailor: tailor,
                                        )),
                              );
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              tailor.name.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFF333333)),
                                            ),
                                            Text(
                                              "Skills: ${tailor.skills}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xFF000000)
                                                      .withOpacity(0.6)),
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 25,
                                        child: SFButton(
                                          title:
                                              "Pending: ${tailor.pending_orders}",
                                          onTap: () {},
                                          titleColor: const Color(0xFFFFFFFF),
                                          buttonBackgroundColor:
                                              const Color(0xFFA74A45),
                                          borderColor: const Color(0x00ffffff),
                                          borderRadius: 5,
                                          titleFontSize: 12,
                                          text: '',
                                        ),
                                      ),
                                    ])),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 0.0, height: 10.0);
                        },
                        itemCount: tailors.length),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
