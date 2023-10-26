import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../notifiers/item_type_state.dart';

class OrderItemList extends StatefulWidget {
  final item;
  final index;
  // OrderItem? orderItem;
  const OrderItemList({
    Key? key,
    this.item,
    this.index,
  }) : super(key: key);

  @override
  State<OrderItemList> createState() => _OrderItemListState();
}

class _OrderItemListState extends State<OrderItemList> {
  // OrderItem? orderItem;
  bool showItemDetails = false;

  _showItemDetails() {
    if (showItemDetails) {
      showItemDetails = false;
    } else {
      showItemDetails = true;
    }
    // print(showItemDetails);
  }

  @override
  Widget build(BuildContext context) {
    // showItemDetails = widget.index == 0 ? true : false;
    return Container(
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        // color: Colors.white,
      ),
      child: InkWell(
        // splashColor: Colors.primaries.first,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Item Name:"),
                    Text(widget.item.name,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            // color: Colors.black,
                            // fontWeight: FontWeight.w700,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Item Type:"),
                    Text(
                        widget.item.item_type == 'other'
                            ? 'Other'
                            : Provider.of<ItemTypeState>(context, listen: false)
                                .itemTypes
                                .where((element) =>
                                    element.id == widget.item.item_type)
                                .first
                                .name,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            // color: Colors.black,
                            // fontWeight: FontWeight.w700,
                          ),
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Alteration Details"),
                    // Text(widget.item.item_type,
                    //     style: GoogleFonts.roboto(
                    //       textStyle: const TextStyle(
                    //         fontSize: 16,
                    //         // color: Colors.black,
                    //         // fontWeight: FontWeight.w700,
                    //       ),
                    //     )),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 0.0, height: 10.0),
                  Wrap(
                    direction: Axis.horizontal,
                    children: widget.item.item_data.map<Widget>((data) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            data["pom"] +
                                " : " +
                                data["measurement"].toString() +
                                " " +
                                (data["unit"] == "Inches(Decimal)" ||
                                        data["unit"] == "Inches"
                                    ? "In"
                                    : "CM"),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: showItemDetails ? 14 : 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            )),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _showItemDetails();
          });
        },
      ),
    );
  }
}
