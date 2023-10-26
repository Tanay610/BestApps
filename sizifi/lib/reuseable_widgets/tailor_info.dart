import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';

import '../modules/home/notifiers/store_state.dart';

class Tailor_Info_widget extends StatelessWidget {
  const Tailor_Info_widget({
    super.key,
    required this.size,
    required this.tailor,
  });

  final double size;
  final Tailor tailor;

  Object get userAct => true;

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<StoreState>(context, listen: false).activeStore;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      padding: const EdgeInsets.all(9),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: size * 0.02,
              // ),
              Padding(
                padding: EdgeInsets.only(left: size * 0.02),
                child: const Icon(Icons.person),
              ),
              Padding(
                padding: EdgeInsets.only(left: size * 0.01),
                child: Text(
                  tailor.name.toString(),
                  // "Vikas (WH)",
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // SizedBox(width: size * 0.38),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(right: size * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: tailor.tailor_status == userAct
                            ? Colors.green
                            : Colors.red,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                    Text(
                      tailor.tailor_status == userAct ? "Active" : "Inactive",
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.store,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        store!.store_name,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.scissors,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tailor.skills,
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size * 0.38,
                height: MediaQuery.of(context).size.height * 0.057,
                decoration: const BoxDecoration(
                  color: Color(0xFF1BD741),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Chat",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size * 0.38,
                height: MediaQuery.of(context).size.height * 0.057,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB888),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Icon(
                        FontAwesomeIcons.phone,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Call",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
