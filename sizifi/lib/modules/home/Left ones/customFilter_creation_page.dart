import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Left%20ones/searchFilterPage.dart';

class CustomFilterCreationPage extends StatefulWidget {
  const CustomFilterCreationPage({super.key});

  @override
  State<CustomFilterCreationPage> createState() =>
      _CustomFilterCreationPageState();
}

class _CustomFilterCreationPageState extends State<CustomFilterCreationPage> {
  final List<bool> _selected = [true, false];

  final List<ChipContained> _allchips = [];
  final List<ChipContained> _allchips2 = [];
  final List<ChipContained> _allchips3 = [];
  final List<ChipContained> _allchips4 = [];

  final TextEditingController _customfilterController = TextEditingController();
  final TextEditingController alertController = TextEditingController();
  final TextEditingController alertController2 = TextEditingController();
  final TextEditingController alertController3 = TextEditingController();
  final TextEditingController alertController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Create Custom Filter",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchFilterPage();
              }));
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
              child: Icon(Icons.search,
                  color: Theme.of(context).iconTheme.color, size: 25),
            ),
          )
        ],
        leading: InkWell(
          onTap: () {
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
        margin: const EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Custom",
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size * 0.44,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text(
                                "Sort by",
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: SvgPicture.asset(
                                    "assets/images/upAndDownarrow.svg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.8),
                      endIndent: 10,
                      indent: 10,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size * 0.28),
                    child: const Text(
                      "From",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size * 0.08),
                    child: const Text(
                      "To",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Date created",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: size * 0.25,
                    height: sizee * 0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Start Date',
                            hintStyle: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: size * 0.25,
                    height: sizee * 0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'End Date',
                          hintStyle: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Delivery date",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: size * 0.25,
                    height: sizee * 0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Start Date',
                            hintStyle: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: size * 0.25,
                    height: sizee * 0.07,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'End Date',
                          hintStyle: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizee * 0.04,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Tailor name",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                          children: _allchips
                              .map(
                                (chip) => Chip(
                                  key: ValueKey(chip.id),
                                  label: Text(chip.name),
                                  deleteIcon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    size: 19,
                                  ),
                                  backgroundColor: const Color(0xffF4F4F4),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(25, 25))),
                                  onDeleted: () => deleteChip(chip.id),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onPressed: () {
                          addNewChip();
                        },
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Store name",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      width: size * 0.6,
                      child: Wrap(
                          spacing: 7.0,
                          children: _allchips2
                              .map(
                                (chip2) => Chip(
                                  key: ValueKey(chip2.id),
                                  label: Text(chip2.name),
                                  deleteIcon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    size: 19,
                                  ),
                                  backgroundColor: const Color(0xffF4F4F4),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(25, 25))),
                                  onDeleted: () => deleteChip2(chip2.id),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onPressed: () {
                          addNewChip2();
                        },
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                verticalDirection: VerticalDirection.down,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Assigned to",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                          direction: Axis.horizontal,
                          spacing: 7.0,
                          children: _allchips3
                              .map(
                                (chip3) => Chip(
                                  key: ValueKey(chip3.id),
                                  label: Text(chip3.name),
                                  deleteIcon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    size: 19,
                                  ),
                                  backgroundColor: const Color(0xffF4F4F4),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(25, 25))),
                                  onDeleted: () => deleteChip3(chip3.id),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onPressed: () {
                          addNewChip3();
                        },
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(
                      "Order Status",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                          children: _allchips4
                              .map(
                                (chip4) => Chip(
                                  key: ValueKey(chip4.id),
                                  label: Text(chip4.name),
                                  deleteIcon: const Icon(
                                    Icons.highlight_remove_outlined,
                                    size: 19,
                                  ),
                                  backgroundColor: const Color(0xffF4F4F4),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(25, 25))),
                                  onDeleted: () => deleteChip4(chip4.id),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                        onPressed: () {
                          addNewChip4();
                        },
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Want to save custom filter.",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ToggleButtons(
                      borderColor: Colors.transparent,
                      selectedColor: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      fillColor: const Color(0xffA74A45),
                      selectedBorderColor: Colors.transparent,
                      isSelected: _selected,
                      onPressed: (index) {
                        setState(() {
                          _selected[index] = !_selected[index];

                          for (int i = 0; i < _selected.length; i++) {
                            _selected[i] = i == index;
                          }
                        });
                      },
                      children: const [
                        Text(
                          "Yes",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "No",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _selected[0]
                  ? Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: sizee * 0.07,
                      width: size * 0.7,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _customfilterController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Custom filter name'),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: sizee * 0.07,
                width: size * 0.6,
                decoration: BoxDecoration(
                  color: _selected[0]
                      ? const Color(0xffA74A45).withOpacity(0.5)
                      : const Color(0xffA74A45),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void addNewChip() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a tailor"),
            content: TextField(
              controller: alertController,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _allchips.add(ChipContained(
                        id: DateTime.now().toString(),
                        name: alertController.text));
                  });

                  alertController.text = '';
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          );
        });
  }

  void addNewChip2() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a store"),
            content: TextField(
              controller: alertController2,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _allchips2.add(ChipContained(
                        id: DateTime.now().toString(),
                        name: alertController2.text));
                  });

                  alertController2.text = '';
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          );
        });
  }

  void addNewChip3() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a thing"),
            content: TextField(
              controller: alertController3,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _allchips3.add(ChipContained(
                        id: DateTime.now().toString(),
                        name: alertController3.text));
                  });

                  alertController3.text = '';
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          );
        });
  }

  void addNewChip4() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a order status"),
            content: TextField(
              controller: alertController4,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _allchips4.add(ChipContained(
                        id: DateTime.now().toString(),
                        name: alertController4.text));
                  });

                  alertController4.text = '';
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          );
        });
  }

  void deleteChip(String id) {
    setState(() {
      _allchips.removeWhere((element) => element.id == id);
    });
  }

  void deleteChip2(String id2) {
    setState(() {
      _allchips2.removeWhere((element) => element.id == id2);
    });
  }

  void deleteChip3(String id3) {
    setState(() {
      _allchips3.removeWhere((element) => element.id == id3);
    });
  }

  void deleteChip4(String id4) {
    setState(() {
      _allchips4.removeWhere((element) => element.id == id4);
    });
  }
}

class ChipContained {
  final String id;
  final String name;

  ChipContained({required this.id, required this.name});
}
