import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import 'package:sizifi/reuseable_widgets/tailor_info.dart';

class SearchTailor extends StatefulWidget {
  const SearchTailor({super.key});

  @override
  State<SearchTailor> createState() => _SearchTailorState();
}

class _SearchTailorState extends State<SearchTailor> {
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
          "Search Tailor",
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
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
      body: Container(
        child: const Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SearchTailorPage extends StatefulWidget {
  const SearchTailorPage({super.key});

  @override
  State<SearchTailorPage> createState() => _SearchTailorPageState();
}

late final Tailor tailor;

class _SearchTailorPageState extends State<SearchTailorPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Tailor> _allUsers = [];

  List<Tailor> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _filterchanged(String enteredKeyword) {
    List<Tailor> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers;
      // .where((user) =>
      //     user[].toLowerCase().contains(enteredKeyword.toLowerCase()))
      // .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Search Tailor",
          textAlign: TextAlign.left,
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              // onChanged: (value) => _filterchanged(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _allUsers.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Tailor tailor = _allUsers[index];
                        return Tailor_Info_widget(
                          size: MediaQuery.of(context).size.width,
                          tailor: tailor,
                        );
                      })
                  : const Text(
                      'No tailors found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
