import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:sizifi/modules/home/Order%20pages/dialog_boxy.dart';
import 'package:sizifi/modules/home/Order%20pages/o_item_type.dart';
//import 'package:sizifi/modules/home/Order%20pages/shirt_page.dart';
import 'package:sizifi/modules/home/data/model/item_type.dart';

import '../data/model/point_of_measurement.dart';
import '../notifiers/item_type_state.dart';

class ItemAddPage extends StatefulWidget {
  final ItemType? itemType;
  final bool isEdit;
  const ItemAddPage({super.key, this.itemType, required this.isEdit});
  @override
  State<ItemAddPage> createState() => _ItemAddPageState();
  //List<Widget> widgetList = [];
}

class _ItemAddPageState extends State<ItemAddPage> {
  ItemType? newItemType;
  bool _isEdit = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptContoller = TextEditingController();
  // TextEditingController pomController = TextEditingController();
  List<PointOfMeasurement> pomList = [];
  List<Widget> widgetList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isEdit = widget.itemType != null;
    if (_isEdit) {
      newItemType = ItemType(
          id: widget.itemType!.id,
          name: widget.itemType!.name,
          description: widget.itemType!.description,
          store_id: widget.itemType!.store_id,
          pom: widget.itemType!.pom);
      nameController.text = newItemType!.name;
      descriptContoller.text = newItemType!.description;
      pomList = newItemType!.pom!;
      for (var p in pomList) {
        addPomContainer(_isEdit, p);
      }
    } else {
      addPomContainer(_isEdit, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            _isEdit ? "Edit - Item Types" : "Add - Item Types",
            style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                  size: 25,
                ),
              ),
            ),
          ),

          //TODO Orders use ItemType id, so that will result in errors as no ItemType reference will be available based on stored itemtype id

          // actions: [
          //   widget.isEdit
          //       ? InkWell(
          //           onTap: () async {
          //             // Navigator.of(context).pop();

          //             await Provider.of<ItemTypeState>(context, listen: false)
          //                 .deleteItemType(widget.itemType!);
          //             Navigator.of(context).pop();
          //             Navigator.of(context).pop();
          //           },
          //           child: Container(
          //             height: 24,
          //             width: 24,
          //             margin: const EdgeInsets.symmetric(
          //                 vertical: 27, horizontal: 15),
          //             child: Center(
          //               child: Icon(Icons.delete,
          //                   color: Theme.of(context).iconTheme.color, size: 25),
          //             ),
          //           ),
          //         )
          //       : const SizedBox()
          // ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size * 0.1,
              ),
              Container(
                width: size * 0.9,
                height: sizee * 0.078,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Color(0xFfFFFFFF),
                ),
                child: Center(
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFf000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: size * 0.9,
                height: sizee * 0.078,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Color(0xFfFFFFFF),
                ),
                child: Center(
                  child: TextFormField(
                    controller: descriptContoller,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF000000).withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(8),
                    ),
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFf000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizee * 0.05,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widgetList.length,
                itemBuilder: (context, index) {
                  if (widgetList.isNotEmpty) {
                    return widgetList.elementAt(index);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(
                height: sizee * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    addPomContainer(_isEdit, null);
                  });
                },
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
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ChooseDialog();
                      });
                },
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
              ),
              SizedBox(
                height: sizee * 0.04,
              ),
              Container(
                width: size * 0.89,
                height: sizee * 0.08,
                decoration: const BoxDecoration(
                  color: Color(0xFFA74A45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA74A45),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const ItemTypePage();
                    //     },
                    //   ),
                    // );
                    ItemType finalItemType = ItemType(
                      name: nameController.text,
                      description: descriptContoller.text,
                      store_id: Provider.of<StoreState>(context, listen: false)
                          .activeStore!
                          .team_id,
                      pom: pomList,
                    );
                    ItemTypeState it =
                        Provider.of<ItemTypeState>(context, listen: false);

                    if (_isEdit) {
                      finalItemType.id = newItemType!.id;
                      await it.updateItemType(finalItemType);
                    } else {
                      await it.addItemType(finalItemType);
                    }

                    // PointOfMeasurement pointOfMeasurement =
                    //     PointOfMeasurement(
                    //   item_type_id: Provider.of<PointOfMeasurementState>(
                    //           context,
                    //           listen: false)
                    //       .pointOfMeasurement
                    //       .item_type_id,
                    //   name: pomController.text,
                    // );
                    // PointOfMeasurementState pointOfMeasurementState =
                    //     Provider.of<PointOfMeasurementState>(context,
                    //         listen: false);
                    // pointOfMeasurementState
                    //     .addPointOfMeasurement(pointOfMeasurement);
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updatePom(int index, String value) {
    PointOfMeasurement pomToUpdate = pomList[index];
    pomToUpdate.name = value;
  }

  int pomCounter = 0;

  getPomLength() {
    return widgetList.length;
  }

  void addPomContainer(bool isEdit, PointOfMeasurement? it) {
    if (isEdit && it != null) {
      widgetList.add(
        pomContainer(
          index: pomCounter,
          updatePom: updatePom,
          removeContainer: removeContainer,
          getPomLength: getPomLength,
          isEdit: true,
          pom: it.name,
        ),
      );
    } else {
      print("This code is for new items");
      widgetList.add(
        pomContainer(
          index: pomCounter,
          updatePom: updatePom,
          removeContainer: removeContainer,
          getPomLength: getPomLength,
          isEdit: false,
        ),
      );
      pomList.add(PointOfMeasurement(name: "", item_type_id: ""));
    }
    if (widgetList.length > 1) {
      var removeIndex = widgetList.indexWhere((element) {
        pomContainer elem = element as pomContainer;
        if (element.ps.mounted) {
          element.ps.setState(() {});
        }
        // print()
        return element.index == 0;
      });
    }
    pomCounter++;
    setState(() {});
  }

  void removeContainer(int index) {
    // if (index >= 0 && index < widgetList.length) {
    // print(index);
    // if (widgetList.length > 1) {
    var removeIndex = widgetList.indexWhere((element) {
      pomContainer elem = element as pomContainer;
      if (element.ps.mounted) {
        element.ps.setState(() {});
      }
      // print()
      return element.index == index;
    });
    // print(removeIndex);
    pomList.removeAt(removeIndex);
    widgetList.removeAt(removeIndex);
    setState(() {
      // widgetList.removeAt(index);
    });
    // }
    // }
  }
}

class pomContainer extends StatefulWidget {
  pomContainer({
    super.key,
    this.index,
    this.updatePom,
    this.removeContainer,
    this.getPomLength,
    this.pom,
    this.isEdit,
  });

  final index;
  var updatePom;
  final removeContainer;
  var getPomLength;
  var pom;
  var isEdit;

  _pomContainerState ps = _pomContainerState();
  @override
  State<pomContainer> createState() => ps;
}

class _pomContainerState extends State<pomContainer> {
  updateWidget() {
    setState(() {});
  }

  TextEditingController pomController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      pomController.text = widget.pom;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.getPomLength());
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "POM ",
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFf000000).withOpacity(0.6),
              ),
            ),
            Container(
              width: size * 0.7,
              height: sizee * 0.078,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Color(0xFfFFFFFF),
              ),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: pomController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFf000000).withOpacity(0.6),
                  ),
                  onChanged: (value) {
                    widget.updatePom(widget.index, value);
                  },
                ),
              ),
            ),
            Visibility(
              visible: widget.getPomLength() > 1,
              child: GestureDetector(
                onTap: () => widget.removeContainer(widget.index),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffA74A45),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: sizee * 0.03,
        ),
      ],
    );
  }
}
