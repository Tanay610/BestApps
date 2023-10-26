import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/services.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/settings/ui/Tailor_Setting/tailor_info_page.dart';
import 'package:sizifi/reuseable_widgets/tailor_info.dart';

import '../../../home/data/model/tailor.dart';
import '../../../home/notifiers/tailor_state.dart';

class TailorListScreen extends StatefulWidget {
  const TailorListScreen({Key? key}) : super(key: key);

  @override
  _TailorListScreenState createState() => _TailorListScreenState();
}

class _TailorListScreenState extends State<TailorListScreen> {
  List<Tailor> tailors = [];
  String? selectedValue;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  //final List<bool> _selected = [false, true, false];
  var activeTab = 0;

  @override
  void initState() {
    super.initState();
    // Fetch the tailor data from the state on initialization
    Provider.of<TailorState>(context, listen: false).getTailors();
    tailors = Provider.of<TailorState>(context, listen: false).tailors;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

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

    List<Tailor> alltailors = Provider.of<TailorState>(context).tailors;
    List<Tailor> tailors = activeTab == 0
        ? alltailors
        : activeTab == 1
            ? alltailors.where((element) => element.type == "wh").toList()
            : activeTab == 2
                ? alltailors
                    .where((element) => element.type == "store")
                    .toList()
                : [];
    // print(tailors);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Tailors',
          style: GoogleFonts.koHo(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
              child: Icon(
                Icons.search,
                size: 25,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
        leading: InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(Routes.profile, (_) => false);

              Navigator.of(context).pop();
            },
            child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: Center(
                    child: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color, size: 25)))),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              backgroundColor: const Color(0xfffffffff),
              centerTitle: true,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(top: 10),
                centerTitle: true,
                title: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TabBar(
                    indicatorColor: const Color(0xFFA74A45),
                    tabs: [
                      Tab(
                        child: Text("All",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFA74A45))),
                      ),
                      Tab(
                        child: Text("WH",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFA74A45))),
                      ),
                      Tab(
                        child: Text("Store",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFA74A45))),
                      ),
                    ],
                    onTap: (value) {
                      setState(() {
                        print(value);
                        activeTab = value;
                      });

                      // print(value);
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Access the tailor data using the index
                Tailor tailor = tailors[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TailorInfoPage(
                            tailor: tailor,
                          );
                        },
                      ),
                    );
                  },
                  child: Tailor_Info_widget(
                    size: size,
                    tailor: tailor,
                  ),
                );
              },
              childCount: tailors.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffA74A45),
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.addTailor);
        },
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 34,
        ),
      ),
    ));
  }
}
