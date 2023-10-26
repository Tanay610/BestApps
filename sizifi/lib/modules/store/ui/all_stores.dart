import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizifi/modules/authentication/notifiers/auth_state.dart';
import 'package:sizifi/modules/store/ui/n_store_screen.dart';
import 'package:sizifi/modules/store/widgets/store_widget.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../home/data/model/store_model.dart';
import '../../home/notifiers/store_state.dart';

class AllStoresScreen extends StatefulWidget {
  const AllStoresScreen({Key? key}) : super(key: key);

  @override
  _AllStoresScreenState createState() => _AllStoresScreenState();
}

class _AllStoresScreenState extends State<AllStoresScreen> {
  String? selectedValue;
  // List stores = [];
  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    AuthState as = Provider.of<AuthState>(context);
    StoreState ss = Provider.of<StoreState>(context);
    // ss.getStores(as.userData);
    List stores = ss.stores;
    print(stores);
    void _onRefresh() async {
      try {
        Provider.of<StoreState>(context, listen: false).getStores(as.userData);
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      } catch (e) {
        _refreshController.refreshFailed();
      }

      // if failed,use refreshFailed()
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              Routes.addStore,
            );
          },
          backgroundColor: const Color(0xFFA74A45),
          child: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Stores',
            style: GoogleFonts.koHo(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //   Routes.profile,
                //   (_) => false,
                // );
              },
              child: Icon(Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color, size: 25)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: InkWell(
                child: Icon(Icons.search,
                    color: Theme.of(context).iconTheme.color, size: 25),
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
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  int reverseIndex = stores.length - 1 - index;
                  Store store = stores[reverseIndex];
                  String storeLocation = store.city;
                  String brandStoreId = store.brand_store;
                  return InkWell(
                    onLongPress: () {
                      setState(() {
                        ss.setActiveStore(store);
                        print(ss.activeStore!.store_name);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("${store.store_name} is the active Store!!"),
                          backgroundColor: Theme.of(context).splashColor,
                        ));
                      });
                    },
                    onTap: () {
                      // setState(() {
                      //     ss.setActiveStore(store);

                      //     print(ss.activeStore.name);
                      // });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreInfoPage(
                                    store: store,
                                  )));
                      // Navigator.pushNamed(context, Routes.singleStore, arguments: store);
                    },
                    child: StoreWidget(
                      nameLetters: getInitials(store.store_name.toUpperCase()),
                      name: store.store_name,
                      brandStorename: store.brand_store,
                      location: storeLocation.length > 25
                          ? "${storeLocation.substring(0, 22)}..."
                          : storeLocation,
                      active: Container(
                        child: Visibility(
                          visible: (ss.activeStore == store),
                          child: Row(
                            children: [
                              Icon(Icons.ads_click_sharp,
                                  size: 18,
                                  color: Theme.of(context).iconTheme.color),
                              const SizedBox(width: 7),
                              Text(
                                "Active",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      activeColor: const Color(0xFFA74A45),
                      // brandStorename: store.brand_store,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
                itemCount: stores.length),
          ),

          // ListView(
          //   children:[
          //    InkWell(
          //     onTap:(){
          //       Navigator.of(context).pushNamedAndRemoveUntil(Routes.singleStore, (_) => false);
          //     },
          //     child: StoreWidget()
          //    ),
          //     StoreWidget(),
          //     SizedBox(height:20),
          //     Row(
          //       mainAxisAlignment:MainAxisAlignment.center,
          //       children:[
          //         Image(image:AssetImage('assets/icons/store.png'),height:12,color:Color(0xFF333333),fit:BoxFit.cover),
          //         SizedBox(width:7),
          //         Text(
          //           "Add Store",
          //           style: GoogleFonts.poppins(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400,
          //               color: Color(0xFF333333)))
          //       ]
          //     ),
          //   ]
          // )
        ),
      ),
    );
  }
}
