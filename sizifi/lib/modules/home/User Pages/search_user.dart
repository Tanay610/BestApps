import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/modules/home/User%20Pages/wi_user_info.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key});

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
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
          "Search User",
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

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Jennifer winget", "age": 25},
    {"id": 2, "name": "Kristen stewart", "age": 23},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _filterchanged(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int r = 1;
    // int x = r+1;
    // int i = int(_foundUsers[x]);
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
          "Search User",
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              onChanged: (value) => _filterchanged(value),
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
                      itemCount: 7,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return user_white_container(
                            size: MediaQuery.of(context).size.width,
                            sizee: MediaQuery.of(context).size.height);
                      })
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//* ListView.builder(
//*                      itemCount: _foundUsers.length,
//*
//*                      itemBuilder: (context, index) => Card(
//*                        key: ValueKey(_foundUsers[index]["id"]),
//*                        color: Colors.white,
//*                        elevation: 4,
//*                        margin: const EdgeInsets.symmetric(vertical: 10),
//*                        child: GestureDetector(
//*                          onTap: () {
//*                            addNewChip();
//*                          },
//*                          child: ListTile(
//*                            leading: Text(
//*                              _foundUsers[index]["id"].toString(),
//*                              style: const TextStyle(fontSize: 24),
//*                            ),
//*                            title: Text(_foundUsers[index]['name']),
//*                            subtitle: Text(
//*                                '${_foundUsers[index]["age"].toString()} years old'),
//*                          ),
//*                        ),
//*                      ),
//*                    )
