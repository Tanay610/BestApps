import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizifi/modules/home/Left%20ones/custom_dialog.dart';
import 'package:sizifi/modules/home/Left%20ones/field_page.dart';

import 'package:sizifi/modules/home/Left%20ones/searchFilterPage.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:sizifi/modules/home/ui/add_order.dart';
import 'package:sizifi/modules/home/ui/criteria.dart';
import 'package:sizifi/modules/home/ui/csv.dart';
import 'package:sizifi/modules/home/ui/page_transition.dart';
import 'package:sizifi/modules/home/widgets/orders_widget.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/order_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Order pages/increment_provider.dart';
import '../data/model/orders.dart';

class HomeScreen extends StatefulWidget {
  final order;
  const HomeScreen({Key? key, this.order}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isimage = false;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String? selectedValue;
  bool isUserSet = false;
  late String _orderController = 'Created On';
  String _orderController1 = "Sort by";
  List<Order> orders = [];

// void _onSortSelected(SortingCriteria criteria) {
//   setState(() {
//     _selectedSortingCriteria = criteria;

//     if (criteria == SortingCriteria.latestToOldest) {
//         orders.sort((a, b) => b.created_at.compareTo(a.created_at));
//       } else if (criteria == SortingCriteria.oldestToLatest) {
//         orders.sort((a, b) => a.created_at.compareTo(b.created_at));
//       }else if (criteria == SortingCriteria.aToZ) {
//         orders.sort((a, b) => a.customer_name.compareTo(b.customer_name));
//       } else if (criteria == SortingCriteria.zToA) {
//         orders.sort((a, b) => b.customer_name.compareTo(a.customer_name));
//       }

//   });
// }
  // void _onSortSelected(SortingCriteria criteria) {
  //   setState(() {
  //     _selectedSortingCriteria = criteria;

  //     if (criteria == SortingCriteria.latestToOldest) {
  //       orders.sort((a, b) => a.created_at.compareTo(b.created_at));
  //     } else if (criteria == SortingCriteria.oldestToLatest) {
  //       orders.sort((a, b) => b.created_at.compareTo(a.created_at));
  //     } else if (criteria == SortingCriteria.aToZ) {
  //       orders.sort((a, b) => a.customer_name.compareTo(b.customer_name));
  //     } else if (criteria == SortingCriteria.zToA) {
  //       orders.sort((a, b) => b.customer_name.compareTo(a.customer_name));
  //     } else if (criteria == SortingCriteria.deliveryDateAsc) {
  //       orders.sort((a, b) => a.delivery_date.compareTo(b.delivery_date));
  //     } else if (criteria == SortingCriteria.deliveryDateDesc) {
  //       orders.sort((a, b) => b.delivery_date.compareTo(a.delivery_date));
  //     }
  //   });
  // }

  void _sortOrders(String criteria) {
    Criteria myData = Provider.of<Criteria>(context, listen: false);
    String a = myData.selectedFilter;
    print(a);
    if (criteria == "oldest to latest" && a == "Created on") {
      Provider.of<OrderState>(context, listen: false)
          .getOrdersByCreationDateDesc();
      _orderController1 = "oldest to latest";
    }
    if (criteria == "latest to oldest" && a == "Created on") {
      Provider.of<OrderState>(context, listen: false)
          .getOrdersByCreationDateAsc();
      _orderController1 = "latest to oldest";
    }
    if (criteria == "oldest to latest" && a == "Delivery date") {
      Provider.of<OrderState>(context, listen: false)
          .getOrdersByDeliveryDateDesc();
      _orderController1 = "oldest to latest";
    }
    if (criteria == "latest to oldest" && a == "Delivery date") {
      Provider.of<OrderState>(context, listen: false)
          .getOrdersByDeliveryDateAsc();
      _orderController1 = "latest to oldest";
    }
    if (criteria == "a to z" && a == "Customer name") {
      Provider.of<OrderState>(context, listen: false).getCustomerNameDesc();
      _orderController1 = "a to z";
    }
    if (criteria == "z to a" && a == "Customer name") {
      Provider.of<OrderState>(context, listen: false).getCustomerNameAsc();
      _orderController1 = "z to a";
    }
    if (criteria == "z to a" && a == "tailor name") {}
    if (criteria == "a to z" && a == "tailor name") {}
    orders = Provider.of<OrderState>(context, listen: false).orders;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;

    void _onRefresh() async {
      // monitor network fetch
      // await Future.delayed(Duration(milliseconds: 1000));
      try {
        // Provider.of<OrderState>(context, listen: false).getOrders;
        StoreState ss = Provider.of<StoreState>(context, listen: false);
        await ss.getStoreData(context, null);
        print("hasjkdhashdkjadsh");
        // await Future.delayed(
        //   const Duration(milliseconds: 2000),
        // );
        _refreshController.refreshCompleted();
      } catch (e) {
        _refreshController.refreshFailed();
      }

      // if failed,use refreshFailed()
    }

    void _onLoading() async {
      // monitor network fetch
      // await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      // items.add((items.length+1).toString());
      if (mounted) {
        setState(() async {
          StoreState ss = Provider.of<StoreState>(context, listen: false);
          await ss.getStoreData(context, null);
          // orders = Provider.of<OrderState>(context).orders;
        });
      }
      _refreshController.loadComplete();
    }

    //  print(Provider.of<OrderState>(context).user.id);
    // if (!isUserSet) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Provider.of<OrderState>(context, listen: false)
    //         .setUser(Provider.of<AuthState>(context, listen: false).user);
    //     isUserSet = true;

    //     // Add Your Code here.
    //   });
    // }

    void _getOrders() async {
      // print(orders);
      orders = await Provider.of<OrderState>(context, listen: false).orders;

      setState(() {
        if (orders.isEmpty) {
          isimage = true;
        } else {
          isimage = false;
        }
      });
    }

    _getOrders();

    void _getCriteria() {
      Criteria data = Provider.of<Criteria>(context, listen: false);
      _orderController = data.selectedFilter;
    }

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MyHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const MyHomePage();
        },
      );
    }

    @override
    void initState() {
      super.initState();
      _getOrders();
      _getCriteria();
    }

    _getCriteria();
    // Provider.of<OrderState>(context, listen: false).getOrders(Provider.of<AuthState>(context, listen: false).user.id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Order List',
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          leading:
              //SvgPicture.asset(
              //   'assets/images/Vector1233.svg',
              //   height: 2,
              //   width: 4,
              // ),

              GestureDetector(
            onTap: () {
              OrderState csv = Provider.of<OrderState>(context, listen: false);

              csv.exportOrdersToCSV();
            },
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  "assets/images/upload_file_FILL0_wght400_GRAD0_opsz20.svg",
                  height: 30,
                  width: 30,
                  color: const Color(0xFFA74A45),
                )),
          ),
          actions: [
            InkWell(
              onTap: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(Routes.searchScreen, (_) => false);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchFilterPage();
                }));
                // Navigator.of(context).push(_createRoute());
                // Navigator.push(
                //     context,
                //     PageTransition(
                //         duration: Duration(milliseconds: 200),
                //         reverseTransition: true,
                //         enterPage: EditableTemplatePage(),
                //         exitPage: HomeScreen()));
              },
              child: Container(
                height: 34,
                width: 34,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 27,
                  horizontal: 17.0,
                ),
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: Color(0xFFA74A45),
                ),
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  // DropdownButtonHideUnderline(
                  //   child: DropdownButton2<String>(
                  //     hint: const Text(
                  //       'Created On',
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color(0xFF333333)),
                  //     ),
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     items: [
                  //       const DropdownMenuItem(
                  //           value: "1",
                  //           child: Text("Created On",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Color(0xFF333333)))),
                  //       const DropdownMenuItem(
                  //           value: "2",
                  //           child: Text("Created On",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.w600,
                  //                   color: Color(0xFF333333)))),
                  //     ],
                  //     value: selectedValue,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedValue = value as String;
                  //       });
                  //     },
                  //     iconSize: 20,
                  //     buttonHeight: 40,
                  //     buttonWidth: 100,
                  //     itemHeight: 40,
                  //     dropdownDecoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(4),
                  //     ),
                  //     buttonPadding: const EdgeInsets.only(left: 8),
                  //   ),
                  // ),
                  // Divider(thickness: 1, color: const Color(0xFF000000).withOpacity(0.23)),
                  SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          width: size * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const DateCreatedDialog(
                                          //onSortSelected: _onSortSelected,
                                          );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _orderController,
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                // onTap: () {
                                //   showDialog(context: context, builder: (context){
                                //       return SortDialog();
                                //   });
                                // },
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SortDialog(
                                          // onSortSelected: _onSortSelected);
                                          sortOrders: _sortOrders);
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 30,
                                      // child: Flexible(
                                      child: Text(
                                        _orderController1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: SvgPicture.asset(
                                          "assets/images/upAndDownarrow.svg"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),

                  // const SizedBox(height: 10),
                  isimage
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/Measured.svg"),
                            SizedBox(height: 12),
                            CircularProgressIndicator(),
                          ],
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.71,
                          child: SmartRefresher(
                            enablePullDown: true,
                            enablePullUp: true,
                            dragStartBehavior: DragStartBehavior.start,
                            header: const WaterDropHeader(),
                            controller: _refreshController,
                            onRefresh: _onRefresh,
                            onLoading: _onLoading,
                            child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  // int reverseIndex = orders.length - 1 - index;
                                  Order order = orders[index];
                                  // Order order = orders[index];
                                  //Order order = orders[index];
                                  return OrderWidget(
                                    order: order,
                                    items: order.items,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                      width: 0.0, height: 10.0);
                                },
                                itemCount: orders.length),
                          ),
                        ),
                  // InkWell(
                  //     onTap: () {
                  //       Navigator.of(context).pushNamedAndRemoveUntil(
                  //           Routes.singleOrderForm, (_) => false);
                  //     },
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.add_shopping_cart,
                  //               size: 18,
                  //               color: Color(0xFF000000).withOpacity(0.6)),
                  //           Text(
                  //             "New Order",
                  //             style: GoogleFonts.poppins(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Color(0xFF333333)),
                  //           ),
                  //         ])),
                  //! SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 52,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       shape: const RoundedRectangleBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(15.0))),
                  //       backgroundColor: const Color(0xFFA74A45),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => AddOrderScreen(
                  //                   order: widget.order,
                  //                 )),
                  //       );
                  //     },
                  //     child: Text(
                  //!       "Create new Order",
                  //!       style: GoogleFonts.poppins(
                  //!         fontSize: 16,
                  //!         fontWeight: FontWeight.w500,
                  //!       ),
                  //!     ),
                  //!   ),
                  //! ),
                ])),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          backgroundColor: const Color(0xffA74A45),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddOrderScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class SortDialog extends StatelessWidget {
//  final void Function(SortingCriteria) onSortSelected;

//   const SortDialog({
//     Key? key,
//     required this.onSortSelected,
//   }) : super(key: key);

  //final Function(SortingCriteria) onSortSelected; // Add this line
  final Function(String criteria)? sortOrders;
  const SortDialog({Key? key, this.sortOrders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                // onSortSelected(SortingCriteria.latestToOldest);
                sortOrders!("latest to oldest");
              },
              child: const Text(
                "Latest to oldest",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                //onSortSelected(SortingCriteria.oldestToLatest);
                sortOrders!("oldest to latest");
              },
              child: const Text(
                "Oldest to latest",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            GestureDetector(
              child: const Text(
                "A to Z",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //onSortSelected(SortingCriteria.aToZ);
                sortOrders!("a to z");
              },
            ),
            GestureDetector(
              child: const Text(
                "Z to A",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                //onSortSelected(SortingCriteria.zToA);
                sortOrders!("z to a");
              },
            )
          ],
        ),
      ),
    );
  }
}
