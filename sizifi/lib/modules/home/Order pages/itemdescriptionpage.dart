import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizifi/modules/home/Order%20pages/item_add_page.dart';
import 'package:sizifi/modules/home/data/model/item_type.dart';
import 'package:sizifi/modules/home/data/model/point_of_measurement.dart';

import '../notifiers/point_of_measurement_state.dart';

class ItemDescriptionPage extends StatefulWidget {
  final ItemType itemType;
  const ItemDescriptionPage({
    super.key,
    required this.itemType,
  });

  @override
  State<ItemDescriptionPage> createState() => _ItemDescriptionPageState();
}

class _ItemDescriptionPageState extends State<ItemDescriptionPage> {
  late ItemType itemType;
  List<PointOfMeasurement>? pom = [];

  List<Widget> widgets = [];
  String start = "";

  @override
  void initState() {
    super.initState();
    itemType = widget.itemType;
    pom = widget.itemType.pom;
    setState(() {});
  }

  void getPoms() async {
    PointOfMeasurementState ps = PointOfMeasurementState();
    await ps.getPointOfMeasurement(widget.itemType);
    setState(() {
      pom = ps.pointsOfMeasurementResults;
      print(pom);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;

    if (pom == null) {
      print("No pom found");
      getPoms();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Item Types - ${itemType.name}",
            style: GoogleFonts.koHo(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ItemAddPage(
                    itemType: widget.itemType,
                    isEdit: true,
                  );
                }));
              },
              child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Color(0xffA74A45),
                ),
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
              child: const Center(
                child:
                    Icon(Icons.arrow_back, color: Color(0xffA74A45), size: 25),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                padding: const EdgeInsets.all(10),
                width: size * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          itemType.name,
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizee * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            child: Text(
                          "Description:- ${itemType.description}",
                          style: TextStyle(
                            color: const Color(0xFF000000).withOpacity(0.6),
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sizee * 0.04,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Points of Measures",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: sizee * 0.04,
              ),

              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  int reverseIndex = pom!.length - 1 - index;
                  PointOfMeasurement _pom = pom![reverseIndex];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: size * 0.9,
                    height: sizee * 0.055,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _pom.name,
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
                itemCount: pom!.length,
              ),
              SizedBox(
                height: sizee * 0.01,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              //   width: size * 0.9,
              //   height: sizee * 0.055,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(15),
              //     ),
              //   ),
              //   child: Text(
              //     "Sleeve length",
              //     style: TextStyle(
              //       fontFamily: 'poppins',
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //       color: Color(0xFF000000).withOpacity(0.6),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: sizee * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class pom_preview_container extends StatelessWidget {
  const pom_preview_container({
    super.key,
    //* required this.itemType,
    required this.size,
    required this.sizee,
  });

  //* final String itemType;
  final double size;
  final double sizee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: size * 0.9,
      height: sizee * 0.055,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        "Shoulder Length",
        style: TextStyle(
          fontFamily: 'poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF000000).withOpacity(0.6),
        ),
      ),
    );
  }
}

class ItemTypeEditPage extends StatefulWidget {
  final ItemType itemType;
  const ItemTypeEditPage({super.key, required this.itemType});

  @override
  State<ItemTypeEditPage> createState() => _ItemTypeEditPageState();
}

class _ItemTypeEditPageState extends State<ItemTypeEditPage> {
  bool isFirst = false;
  bool isSecond = false;
  bool isthird = false;
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  List containerList = ['Collar', 'sleeve length', 'Shoulder width'];
  List containerEdit = [];
  List<bool> isEditing = List.generate(3, (_) => false);
  @override
  void initState() {
    super.initState();
    firstController = TextEditingController(text: widget.itemType.name);
    secondController = TextEditingController(
        text: "Description:- ${widget.itemType.description}");
  }

  @override
  void dispose() {
    super.dispose();
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
  }

  void addContainer() {
    setState(() {
      containerList.add('baby i love you');
      isEditing.add(false);
    });
  }

  void removeContainer(int index) {
    setState(() {
      containerList.removeAt(index);
      isEditing.removeAt(index);
    });
  }

  void startEditing(int index) {
    setState(() {
      isEditing[index] = true;
      thirdController.text = containerList[index];
    });
  }

  void stopEditing(int index) {
    setState(() {
      isEditing[index] = false;
      containerList[index] = thirdController.text;
    });
  }

  void saveContainers() {}

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
          "Edit-${widget.itemType.name}",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        actions: [
          // Container(
          //   height: 24,
          //   width: 24,
          //   margin: EdgeInsets.symmetric(vertical: 27, horizontal: 15),
          //   child: Icon(
          //     Icons.edit,
          //     size: 23,
          //     color: Color(0xffA74A45),
          //   ),
          // )
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
            child: const Center(
              child: Icon(Icons.arrow_back, color: Color(0xffA74A45), size: 25),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirst = true;
                  });
                },
                child: Container(
                  width: size * 0.9,
                  height: sizee * 0.059,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: isFirst
                        ? TextField(
                            controller: firstController,
                            autofocus: true,
                            maxLines: null,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          )
                        : Text(
                            firstController.text,
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF000000).withOpacity(0.6),
                            ),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSecond = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  width: size * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: SizedBox(
                      child: isSecond
                          ? TextField(
                              controller: secondController,
                              autofocus: true,
                              maxLines: null,
                            )
                          : Text(
                              secondController.text,
                              style: TextStyle(
                                color: const Color(0xFF000000).withOpacity(0.6),
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                ),
              ),
              SizedBox(
                height: sizee * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Points of Measure",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizee * 0.015,
              ),
              ListView.separated(
                itemCount: containerList.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        width: size * 0.9,
                        height: sizee * 0.055,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              startEditing(index);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isEditing[index]
                                  ? Expanded(
                                      child: TextField(
                                        controller: thirdController,
                                        onSubmitted: (_) {
                                          stopEditing(index);
                                        },
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    )
                                  : Text(
                                      containerList[index],
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.6),
                                      ),
                                    ),
                              GestureDetector(
                                onTap: () => removeContainer(index),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xffA74A45),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
              ),
              GestureDetector(
                onTap: addContainer,
                child: Container(
                  width: size * 0.89,
                  height: sizee * 0.06,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xFFA74A45)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/add_rounded_icon.svg"),
                      SizedBox(
                        width: size * 0.02,
                      ),
                      const Text(
                        "Add To measure",
                        style: TextStyle(
                          color: Color(0xFFA74A45),
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: size * 0.89,
                height: sizee * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xFFA74A45)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/copy_measures.svg"),
                    SizedBox(
                      width: size * 0.02,
                    ),
                    const Text(
                      "Copy To measure",
                      style: TextStyle(
                        color: Color(0xFFA74A45),
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                width: size * 0.89,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xFFA74A45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class removable_item extends StatelessWidget {
  const removable_item({
    super.key,
    required this.size,
    required this.sizee,
  });

  final double size;
  final double sizee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: size * 0.9,
      height: sizee * 0.055,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sleeve length",
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000).withOpacity(0.6),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffA74A45),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
