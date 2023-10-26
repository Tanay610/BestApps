import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Order%20pages/item_add_page.dart';
import 'package:sizifi/modules/home/Order%20pages/itemdescriptionpage.dart';
// import 'package:sizifi/modules/home/data/model/point_of_measurement.dart';
import 'package:sizifi/modules/home/notifiers/item_type_state.dart';

import '../data/model/item_type.dart';

class ItemTypePage extends StatefulWidget {
  const ItemTypePage({
    super.key,
  });

  @override
  State<ItemTypePage> createState() => _ItemTypePageState();
}

class _ItemTypePageState extends State<ItemTypePage> {
  List<ItemType> o_items = [];
  @override
  Widget build(BuildContext context) {
    void _getItemTypes() async {
      o_items =
          await Provider.of<ItemTypeState>(context, listen: false).itemTypes;
      setState(() {});
    }

    _getItemTypes();

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
          "Item Types",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        leading: InkWell(
          onTap: () {
            //? Navigator.of(context)
            //?     .pushNamedAndRemoveUntil(Routes.profile, (_) => false);
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
        margin: const EdgeInsets.only(left: 8, top: 12),
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            int reverseIndex = o_items.length - 1 - index;
            ItemType itemType = o_items[reverseIndex];
            // print(itemType.id);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemDescriptionPage(
                        itemType: itemType,
                      );
                    },
                  ),
                );
              },
              child: SizedBox(
                height: sizee * 0.07,
                width: size,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: size * 0.1,
                    // ),
                    // Expanded(child: SizedBox()),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // Flexible(
                    //   child:
                    // SizedBox(
                    //   width: 80,
                    //   child:
                    Padding(
                      padding: EdgeInsets.only(left: size * 0.1),
                      child: Text(
                        itemType.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // ),
                    // ),

                    Padding(
                      padding: EdgeInsets.only(right: size * 0.1),
                      child: const Icon(
                        Icons.chevron_right_outlined,
                        size: 36,
                      ),
                    ),

                    // SizedBox(
                    //   width: size * 0.1,
                    // ),
                    // SizedBox(
                    //   width: size * 0.04,
                    // ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 0.0, height: 2.0);
          },
          itemCount: o_items.length,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA74A45),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ItemAddPage(
              isEdit: true,
            );
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
