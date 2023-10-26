import 'package:flutter/material.dart';
import 'package:sizifi/modules/home/Left%20ones/customFilter_creation_page.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final List<ChipContained> addlist_chips = [];

  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Jennifer winget", "age": 25},
    {"id": 2, "name": "Kristen stewart", "age": 23},
    {"id": 3, "name": "Angelina jolie", "age": 25},
    {"id": 4, "name": "Jennifer lawrence", "age": 24},
    {"id": 5, "name": "Bebe rexha", "age": 23},
    {"id": 6, "name": "Emma watson", "age": 25},
    {"id": 7, "name": "Anushka", "age": 22},
    {"id": 8, "name": "Selena gomez", "age": 23},
    {"id": 9, "name": "Kuch bhi", "age": 23},
    {"id": 10, "name": "Baby", "age": 24},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    //* at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  void _filterchanged(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      //* if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      //* we use the toLowerCase() method to make it case-insensitive
    }

    //* Refresh the UI
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
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                width: size * 0.6,
                child: Wrap(
                    spacing: 7.0,
                    children: addlist_chips
                        .map(
                          (chip) => Chip(
                            key: ValueKey(chip.id),
                            label: Text(
                              _foundUsers[1]["name"].toString(),
                            ),
                            deleteIcon: const Icon(
                              Icons.highlight_remove_outlined,
                              size: 19,
                            ),
                            backgroundColor: const Color(0xffF4F4F4),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(25, 25))),
                          ),
                        )
                        .toList()),
              ),
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
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            addNewChip();
                          },
                          child: ListTile(
                            leading: Text(
                              _foundUsers[index]["id"].toString(),
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(_foundUsers[index]['name']),
                            subtitle: Text(
                                '${_foundUsers[index]["age"].toString()} years old'),
                          ),
                        ),
                      ),
                    )
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

  void addNewChip() {
    setState(() {
      addlist_chips.add(ChipContained(
          id: DateTime.now().toString(), name: _searchController.text));
    });
  }
}
