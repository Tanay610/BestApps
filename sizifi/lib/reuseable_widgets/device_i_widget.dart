import 'package:flutter/material.dart';

class Device_widget extends StatefulWidget {
  const Device_widget({
    super.key,
    required this.size,
    required this.sizee,
  });

  final double size;
  final double sizee;

  @override
  State<Device_widget> createState() => _Device_widgetState();
}

class _Device_widgetState extends State<Device_widget> {
  var iscontained;

  @override
  void initState() {
    super.initState();
    setState(() {
      iscontained = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      width: widget.size * 0.95,
      padding: const EdgeInsets.all(9),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tape 1-Red",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "SIZIFI STM-2.0",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "#ffb20-77a9-11ed-84f7",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Ralph polo store",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Hardeep singh",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: widget.sizee * 0.03,
                )
              ],
            ),
            SizedBox(
              width: widget.size * 0.1,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                      ),
                      const Text(
                        "Active",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 55),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                      ),
                      const Text(
                        "Connected",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        iscontained
            ? InkWell(
                onTap: () {
                  setState(() {
                    iscontained = !iscontained;
                  });
                },
                child: Container(
                  height: widget.sizee * 0.07,
                  width: widget.size * 0.85,
                  decoration: const BoxDecoration(
                      color: Color(0xFFA74A45),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                    child: Text(
                      "Disconnect",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    iscontained = !iscontained;
                  });
                },
                child: Container(
                  height: widget.sizee * 0.07,
                  width: widget.size * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: const Color(0xFFA74A45),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Connect",
                      style: TextStyle(
                        color: Color(0xFFA74A45),
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
      ]),
    );
  }
}
