// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Left%20ones/chip_Implement_widget.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';

import '../notifiers/tailor_state.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  // List<String> fields = [];
  final TextEditingController alertController = TextEditingController();
  final TextEditingController alertController2 = TextEditingController();
  final TextEditingController alertController3 = TextEditingController();

  int field = 0;

  void addField() {
    setState(() {
      field++;
      //   fields.add('Field ${fields.length + 1}');
    });
  }

  // List<Field> fields = [];
  // void addField() {
  //   setState(() {
  //     fields.add(Field());
  //   });
  // }

  void deleteField(int index) {
    setState(() {
      field--;
      // fields.removeAt(index);
    });
  }

  // void showAddTextDialog(int index) {
  //   String newText = '';

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Add Text'),
  //         content: TextField(
  //           onChanged: (value) {
  //             newText = value;
  //           },
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 fields[index].addText(newText);
  //                 Navigator.of(context).pop();
  //               });
  //             },
  //             child: const Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void navigateToChipsPage(List<String> chips) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ChipsPage(chips: chips),
  //     ),
  //   );
  // }
  List<Credentials> poppedData = [];
  List<Credentials> selectedChips = [];
  void updateState(updatedData) {
    print(updatedData);
    setState(() {
      poppedData = updatedData;
    });
  }

  List<String> dropdownFields = ['User', 'Tailor', 'Store'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;

    // final route = ModalRoute.of(context);
    // if (route != null && route.settings.arguments != null) {
    //   poppedData = route.settings.arguments as List<Credentials>;
    //   selectedChips = poppedData;
    //   setState(() {});
    //   print(poppedData);
    //   print(selectedChips);
    // }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Search",
            style: GoogleFonts.koHo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          leading: InkWell(
            onTap: () {
              print("Added Data $poppedData");
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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 12),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Icon(Icons.search),
                    SizedBox(width: 12),
                    SizedBox(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black.withOpacity(0.5),
                endIndent: 8,
                indent: 8,
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: size * 0.5,
              //     )
              //   ],
              // ),

              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 7),
              //       child: TextButton.icon(
              //           style: TextButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(12)))),
              //           onPressed: () {
              //             showDialog(
              //                 context: context,
              //                 builder: (context) {
              //                   return SearchDialog();
              //                 });
              //           },
              //           icon: Icon(
              //             Icons.add_rounded,
              //             size: 18,
              //           ),
              //           label: Text(
              //             "Add",
              //             style: TextStyle(
              //               fontFamily: 'poppins',
              //               fontSize: 12,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           )),
              //     ),
              //   ],
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: field,
                  itemBuilder: (context, index) {
                    // final field = dropdownFields[index];
                    return SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          // ListTile(
                          //   leading: Text(field),
                          // ),
                          Row(
                            children: [
                              Expanded(
                                // flex: 0,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  width: size * 0.28,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0,
                                      ),
                                      child: DropdownButtonFormField(
                                          alignment: Alignment.center,
                                          value: 'user',
                                          iconDisabledColor: Colors.black,
                                          iconEnabledColor: Colors.black,
                                          hint: const Text('Choose 1'),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'user',
                                              child: Text("User"),
                                            ),
                                            DropdownMenuItem(
                                              value: 'store',
                                              child: Text("Store"),
                                            ),
                                            DropdownMenuItem(
                                              value: 'tailor',
                                              child: Text("Tailor"),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            print(poppedData);
                                            dropdownFields[index] ==
                                                value.toString();
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Added Data $poppedData");
                                  // setState(() {
                                  //   field.isExpanded = !field.isExpanded;
                                  // });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SearchChipsDialog(
                                            poppedData: updateState);
                                      });
                                },
                                // child: AnimatedContainer(
                                //   height: field.isExpanded
                                //       ? MediaQuery.of(context).size.height * 0.3
                                //       : 80,
                                //   duration: const Duration(milliseconds: 300),
                                //   curve: Curves.easeInOut,
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   padding: const EdgeInsets.all(8),
                                //   width: field.isExpanded
                                //       ? MediaQuery.of(context).size.width
                                //       : 250,
                                // child: ListView.separated(
                                //   separatorBuilder: (context, index) {
                                //     return const SizedBox(width: 20);
                                //   },
                                //   scrollDirection: Axis.horizontal,
                                //   itemCount: field.texts.length,
                                //   itemBuilder: (context, textIndex) {
                                //     final text = field.texts[textIndex];
                                //     return Chip(
                                //       label: Text(text),
                                //       deleteIcon: const Icon(
                                //           Icons.highlight_remove_outlined),
                                //       onDeleted: () {
                                //         setState(() {
                                //           field.removeText(textIndex);
                                //         });
                                //       },
                                //     );
                                //   },
                                // ),
                                child: Container(
                                  // height: sizee * 0.1,
                                  height: 80,
                                  width: 250,

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Wrap(
                                    children: [
                                      ...poppedData.map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12,
                                              top: 0,
                                              right: 12,
                                              left: 0),
                                          child: Chip(
                                            label: Text(e.name),
                                            deleteIcon: const Icon(Icons
                                                .highlight_remove_outlined),
                                            onDeleted: () {
                                              setState(() {
                                                poppedData.remove(e);
                                                poppedData.add(e);
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // ),
                              // Expanded(
                              //   child: Container(
                              //     constraints:
                              //         BoxConstraints(minHeight: 20, minWidth: 20),
                              //     margin: EdgeInsets.only(right: 15, top: 10),
                              //     padding: EdgeInsets.all(20),
                              //     decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(12))),
                              //     width: size * 0.3,
                              //     height: sizee * 0.4,
                              //     child: Wrap(
                              //         spacing: 7.0,
                              //         children: field.texts
                              //             .map(
                              //               (chip) => Chip(
                              //                 key: ValueKey(chip),
                              //                 label: Text(chip),
                              //                 deleteIcon: Icon(
                              //                   Icons.highlight_remove_outlined,
                              //                   size: 19,
                              //                 ),
                              //                 backgroundColor: Color(0xffF4F4F4),
                              //                 shape: RoundedRectangleBorder(
                              //                     borderRadius: BorderRadius.all(
                              //                         Radius.elliptical(25, 25))),
                              //                 // onDeleted: () => deleteChip(chip),
                              //               ),
                              //             )
                              //             .toList()),
                              //   ),
                              // ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 7),
                          //       child: TextButton.icon(
                          //           style: TextButton.styleFrom(
                          //               shape: const RoundedRectangleBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(12)))),
                          //           onPressed: () {
                          //             showAddTextDialog(index);
                          //           },
                          //           icon: const Icon(
                          //             Icons.add_rounded,
                          //             size: 18,
                          //           ),
                          //           label: const Text(
                          //             "Add",
                          //             style: TextStyle(
                          //               fontFamily: 'poppins',
                          //               fontSize: 12,
                          //               fontWeight: FontWeight.w400,
                          //             ),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  addField();
                },
                child: Container(
                  width: size * 0.9,
                  height: sizee * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffA74A45),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_rounded),
                          Text(
                            "Field",
                            style: TextStyle(
                              color: Color(0xffA74A45),
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 54,
                  width: size * 0.9,
                  decoration: const BoxDecoration(
                    color: Color(0xffA74A45),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Field {
  String? selectedOption;
  List<String> texts = [];
  bool isExpanded = false;

  void addText(String text) {
    texts.add(text);
  }

  void removeText(int index) {
    texts.removeAt(index);
  }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

List<Credentials> tailors = [];

class SearchChipsDialog extends StatelessWidget {
  var poppedData;
  SearchChipsDialog({
    Key? key,
    required this.poppedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getTailors() async {
      tailors = [];
      List<Tailor> _tailors;
      _tailors = await Provider.of<TailorState>(context).tailors;
      var i = 0;
      for (var element in _tailors) {
        tailors.add(
          Credentials(_tailors[i].name, _tailors[i].id.toString()),
        );
        i++;
      }
    }

    List<Credentials> selectedTailors = [];
    ChipsPage chips = ChipsPage(
      selectedChips: selectedTailors,
      chips: tailors,
    );

    getTailors();
    return Dialog.fullscreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 500,
                child: chips,
                // child: ChipsPage(
                //   selectedChips: selectedTailors,
                //   chips: tailors,
                // ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectedTailors = chips.selectedChips;
                print(selectedTailors);
                poppedData(selectedTailors);
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 130),
                height: 54,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                  color: Color(0xffA74A45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Okay",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ChipsPage extends StatefulWidget {
//   const ChipsPage({super.key});

//   @override
//   State<ChipsPage> createState() => _ChipsPageState();
// }

// class _ChipsPageState extends State<ChipsPage> {
//   TextEditingController searchController = TextEditingController();
//   void searchOperation(String serachText) {
//     searchResult.clear();
//     if(_isSearching != null){
//       for(int i = 0; i < tailors.length; i++){
// Strinf
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search), hintText: 'search'),
//             // onChanged: searchOperation,
//           ),
//           // Flexible(child: child)
//         ],
//       ),
//     );
//   }
// }

class Credentials {
  final String name;
  final String id;

  Credentials(this.name, this.id);
}

// 🙋‍♂️🙋‍♂️🙋‍♂️🙋‍♂️ Might be Important

class ChipsPage extends StatefulWidget {
  final List<Credentials> chips;
  final List<Credentials> selectedChips;

  const ChipsPage(
      {super.key, required this.chips, required this.selectedChips});

  @override
  _ChipsPageState createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
  List<Credentials> filteredChips = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredChips = widget.chips;
  }

  void filterChips(String text) {
    filteredChips = widget.chips
        .where(
          (chip) => chip.name.toLowerCase().contains(
                searchController.text.toLowerCase(),
              ),
        )
        .toList();
    setState(() {});
  }

  addChips(Credentials value) {
    widget.selectedChips.add(value);
    filteredChips.remove(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(tailors);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chips Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (v) {
                return filterChips(v.toString());
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: filteredChips.length,
              itemBuilder: (context, index) {
                final chip = filteredChips[index];
                return ListTile(
                  title: Text(chip.name),
                  onTap: () {
                    addChips(filteredChips[index]);

                    // Handle chip tap
                    // filterChips(searchController.text);
                  },
                );
              },
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              ...widget.selectedChips
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12, top: 0, right: 12, left: 0),
                      child: Chip(
                        label: Text(e.name),
                        deleteIcon: const Icon(Icons.highlight_remove_outlined),
                        onDeleted: () {
                          setState(() {
                            widget.selectedChips.remove(e);
                            filteredChips.add(e);
                          });
                        },
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}

//******************************************************************************************************************************** */

// class DynamicFieldsPage extends StatefulWidget {
//   @override
//   _DynamicFieldsPageState createState() => _DynamicFieldsPageState();
// }

// class _DynamicFieldsPageState extends State<DynamicFieldsPage> {
//   List<Field> fields = [];

//   void addField() {
//     setState(() {
//       fields.add(Field());
//     });
//   }

//   void deleteField(int index) {
//     setState(() {
//       fields.removeAt(index);
//     });
//   }

//   void showAddTextDialog(int index) {
//     String newText = '';

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add Text'),
//           content: TextField(
//             onChanged: (value) {
//               newText = value;
//             },
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   fields[index].addText(newText);
//                   Navigator.of(context).pop();
//                 });
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void navigateToChipsPage(List<String> chips) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ChipsPage(chips: chips),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Fields'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: fields.length,
//               itemBuilder: (context, index) {
//                 final field = fields[index];
//                 return ListTile(
//                   title: Row(
//                     children: [
//                       DropdownButton<String>(
//                         value: field.selectedOption,
//                         items:
//                             ['Option 1', 'Option 2', 'Option 3'].map((option) {
//                           return DropdownMenuItem<String>(
//                             value: option,
//                             child: Text(option),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             field.selectedOption = value.toString();
//                           });
//                         },
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             navigateToChipsPage(field.texts);
//                           },
//                           child: AnimatedContainer(
//                             duration: Duration(milliseconds: 300),
//                             curve: Curves.easeInOut,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: EdgeInsets.all(8),
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: field.texts.length,
//                               itemBuilder: (context, textIndex) {
//                                 final text = field.texts[textIndex];
//                                 return Chip(
//                                   label: Text(text),
//                                   deleteIcon: Icon(Icons.close),
//                                   onDeleted: () {
//                                     setState(() {
//                                       field.removeText(textIndex);
//                                     });
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.add),
//                         onPressed: () {
//                           showAddTextDialog(index);
//                         },
//                       ),
//                     ],
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       deleteField(index);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: addField,
//             child: Text('Add Field'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Field {
//   String? selectedOption;
//   List<String> texts = [];

//   void addText(String text) {
//     texts.add(text);
//   }

//   void removeText(int index) {
//     texts.removeAt(index);
//   }
// }

// class ChipsPage extends StatelessWidget {
//   final List<String> chips;

//   const ChipsPage({super.key, required this.chips});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chips Page'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (value) {
//                 // Handle search
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: chips.length,
//               itemBuilder: (context, index) {
//                 final chip = chips[index];
//                 return ListTile(
//                   title: Text(chip),
//                   onTap: () {
//                     // Handle chip tap
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
