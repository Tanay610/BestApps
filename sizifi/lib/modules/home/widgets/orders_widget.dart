import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import '../../../core/routing/routing.dart';
import '../data/model/order_item.dart';
import '../data/model/orders.dart';
import '../ui/single_order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  final List<OrderItem> items;

  const OrderWidget({
    Key? key,
    required this.order,
    required this.items,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  setState(() {
        // MaterialPageRoute(
        //   builder: (_) =>  SingleOrderScreen(order: null,), settings: settings);
        // Navigator.pushNamed(context, Routes.singleOrder,
        //     arguments: widget.order);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleOrderScreen(
              order: widget.order,
            ),
          ),
        );

        // });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: widget.order.is_draft
                    ? const Color(0xFFA74A45)
                    : Colors.transparent,
              ),
            ),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Icon(Icons.person,
                      color: const Color(0xFF000000).withOpacity(0.6)),
                  Text(
                    " ${widget.order.customer_name}",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333)),
                  ),
                ]),
                Row(children: [
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: SFButton(
                        title: " ${widget.order.status}",
                        onTap: () {},
                        titleColor: const Color(0xFFFFFFFF),
                        buttonBackgroundColor: const Color(0xFFA74A45),
                        borderColor: const Color(0x00ffffff),
                        borderRadius: 5,
                        titleFontSize: 7.5,
                        text: '',
                      ),
                    ),
                  ),
                ]),
              ]),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Items : ${widget.items.length}",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tailor : ${widget.order.tailorObj == null ? "no tailor" : widget.order.tailorObj!.name.toString()}",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   child: Text(
              //     "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
              //     style: GoogleFonts.poppins(
              //         fontSize: 10,
              //         fontWeight: FontWeight.w400,
              //         color: Color(0xFF5B5B5B)),
              //   ),
              // ),
              Divider(
                  thickness: 1,
                  color: const Color(0xFF000000).withOpacity(0.23)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Vector.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat("H:m EEE,")
                                .format(widget.order.created_at),
                            style: GoogleFonts.poppins(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xFF000000).withOpacity(0.6)),
                          ),
                          Text(
                              DateFormat("dd/MM/yyyy")
                                  .format(widget.order.created_at),
                              style: GoogleFonts.poppins(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF000000)
                                      .withOpacity(0.6))),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/Vectorw7ye37.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(widget.order.delivery_date,
                              style: GoogleFonts.poppins(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF000000)
                                      .withOpacity(0.6))),
                          // Text(widget.order.delivery_date,
                          //     style: GoogleFonts.poppins(
                          //         fontSize: 10.5,
                          //         fontWeight: FontWeight.w400,
                          //         color: const Color(0xFF000000)
                          //             .withOpacity(0.6))),
                        ],
                      )
                    ],
                  ),
                ]),
              ]),
            ])),
      ),
    );
  }
}
