import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/notifiers/delivery_mode_state.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';

import '../data/model/delivery_mode.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  TextEditingController controller = TextEditingController();
  bool isDelivery = true;

  List<DeliveryModes> deliveryModes = [];

  // @override
  // void initState() {
  //   // getDeliveryModes();
  //   super.initState();
  // }

  addContainer() async {
    DeliveryModes deliver = DeliveryModes(mode_name: controller.text);
    deliver.store_id = Provider.of<StoreState>(context, listen: false)
        .activeStore!
        .team_id
        .toString();
    await Provider.of<DeliveryModeState>(context, listen: false)
        .addDeliverymodes(deliver);
    setState(() {});
  }

  void deleteContainer(int index) async {
    await Provider.of<DeliveryModeState>(context, listen: false)
        .deleteDeliverymodes(deliveryModes[index]);
    // deliveryModes.removeAt(index);
    // containerEditStatus.removeAt(index);
    setState(() {});
  }

  void updateStatus(int? index) async {
    Provider.of<DeliveryModeState>(context, listen: false)
        .editmodes(deliveryModes[index!].id.toString(), controller.text);
  }

  @override
  Widget build(BuildContext context) {
    void getDeliveryModes() async {
      print("its has been printed");
      deliveryModes =
          await Provider.of<DeliveryModeState>(context, listen: false)
              .deliveryModesList;
      setState(() {});
    }

    getDeliveryModes();
    // print(Provider.of<DeliveryModeState>(context, listen: false)
    //     .getDeliveryModes());
    return Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Delivery Mode",
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
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: deliveryModes == [] ? 0 : deliveryModes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    child: SvgPicture.asset("assets/images/vehicle.svg"),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Text(
                    deliveryModes[index].mode_name,
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                // ),
                GestureDetector(
                  onTap: () {
                    // updateStatus(index);
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return AddDialog(
                            isEditable: true,
                            index: index,
                            editableText: deliveryModes[index].mode_name,
                          );
                        }));
                  },
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () => deleteContainer(index),
                  child: const Icon(Icons.delete),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA74A45),
        onPressed: () {
          // addContainer();
          showDialog(
              context: context,
              builder: (context) {
                return AddDialog(isEditable: false);
              });
        },
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget AddDialog(
      {required bool isEditable, int? index, String? editableText}) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        height: 220,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              !isEditable ? 'Add - Delivery Mode' : 'Edit - Delivery Mode',
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 334,
              height: 55,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEF6F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: TextField(
                autofocus: true,
                controller: !isEditable
                    ? controller
                    : (controller..text = editableText!),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    hintText: "Name",
                    // helperText: editableText,
                    border: InputBorder.none),
              ),
            ),
            GestureDetector(
              onTap: () {
                !isEditable
                    ? setState(() {
                        isDelivery = false;
                        addContainer();
                        Navigator.pop(context);
                        controller.text = "";
                      })
                    : setState(
                        () {
                          updateStatus(index ?? 0);
                          controller.text = "";
                          Navigator.pop(context);
                        },
                      );
              },
              child: Container(
                width: 334,
                height: 60,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA74A45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
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
