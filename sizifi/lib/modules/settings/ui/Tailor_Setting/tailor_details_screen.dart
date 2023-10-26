import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/home/widgets/orders_widget.dart';

import '../../../home/data/model/orders.dart';
import '../../../home/data/model/tailor.dart';
import '../../../home/notifiers/order_state.dart';
import '../../../home/notifiers/tailor_state.dart';
import 'add_tailor_screen.dart';

class TailorDetailsScreen extends StatefulWidget {
  final tailor;
  const TailorDetailsScreen({Key? key, this.tailor}) : super(key: key);

  @override
  _TailorDetailsScreenState createState() => _TailorDetailsScreenState();
}

class _TailorDetailsScreenState extends State<TailorDetailsScreen> {
  String? selectedValue;
  List<Order> orders = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orders = Provider.of<OrderState>(context).getTailorOrders(widget.tailor);
    print(orders);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Tailor Details",
              style: Theme.of(context).textTheme.displayLarge),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTailorScreen(
                            tailor: widget.tailor,
                          )),
                );
              },
              child: Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.symmetric(
                  vertical: 27,
                ),
                child: Center(
                  child: Icon(Icons.edit,
                      color: Theme.of(context).iconTheme.color, size: 25),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                Tailor tailor = widget.tailor;
                OrderState os = Provider.of<OrderState>(context, listen: false);
                TailorState ts =
                    Provider.of<TailorState>(context, listen: false);
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Delete!!"),
                    content: Text("Are you sure you want to delete " +
                        widget.tailor.name),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'CANCEL',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFA74A45)),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          // EasyLoading.show(
                          //     maskType: EasyLoadingMaskType.custom);
                          ts.deleteTailor(tailor);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Successfully Deleted!!"),
                              backgroundColor: Theme.of(context).splashColor,
                            ),
                          );
                          print("tailor deleted");
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (_) => false);
                        },
                        child: Text(
                          'Delete',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFA74A45)),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                  height: 28,
                  width: 28,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image(
                      image: const AssetImage("assets/icons/delete.png"),
                      color: Theme.of(context).iconTheme.color,
                      height: 27)),
            ),
          ],
          leading: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.tailorList, (_) => false);
              },
              child: Container(
                  height: 24,
                  width: 24,
                  margin:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: Center(
                      child: Icon(Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
                          size: 25)))),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: " + widget.tailor.name,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000)),
                    ),
                    Text(
                      "Phn no: " +
                          widget.tailor.number_country_code +
                          widget.tailor.number,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000)),
                    ),
                    Text(
                      "Skills: " + widget.tailor.skills,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000)),
                    ),
                    Text(
                      "Pending Orders: ${widget.tailor.pending_orders}",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Orders",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000)),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                itemCount: orders.length,
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                  bottom: kFloatingActionButtonMargin + 62,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Order order = orders[index];
                  return OrderWidget(
                    order: order,
                    items: order.items,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 0.0, height: 10.0);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
