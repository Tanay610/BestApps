import 'package:flutter/material.dart';

class ChooseDialog extends StatefulWidget {
  const ChooseDialog({super.key});

  @override
  State<ChooseDialog> createState() => _ChooseDialogState();
}

class _ChooseDialogState extends State<ChooseDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 14),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                Text(
                  "   Choose Item Type\n "
                  "       to copy from",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const CopyDialog();
                    });
                // Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(
                    "Shirt",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Ladies jeans",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000).withOpacity(0.6),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "T-shirt",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000).withOpacity(0.6),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Shorts",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000).withOpacity(0.6),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CopyDialog extends StatefulWidget {
  const CopyDialog({super.key});

  @override
  State<CopyDialog> createState() => _CopyDialogState();
}

class _CopyDialogState extends State<CopyDialog> {
  bool iscollar = true;
  bool isCuffheight = true;
  bool isshoulder = true;
  bool isSleeve = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 11),
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                Text(
                  "Copy Point of Measure",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  iscollar = !iscollar;
                });
              },
              child: Row(
                children: [
                  iscollar
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        )
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFA74A45),
                            shape: OvalBorder(),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Collar",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSleeve = !isSleeve;
                });
              },
              child: Row(
                children: [
                  isSleeve
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        )
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFA74A45),
                            shape: OvalBorder(),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sleeve length",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isshoulder = !isshoulder;
                });
              },
              child: Row(
                children: [
                  isshoulder
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        )
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFA74A45),
                            shape: OvalBorder(),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Shoulder width",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                isCuffheight = !isCuffheight;
              },
              child: Row(
                children: [
                  isCuffheight
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        )
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFA74A45),
                            shape: OvalBorder(),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  // Container(
                  //   width: 20,
                  //   height: 20,
                  //   decoration: ShapeDecoration(
                  //     color: Color(0xFFA74A45),
                  //     shape: OvalBorder(),
                  //   ),
                  // ),
                  Text(
                    "Cuff height",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 240,
                height: 54,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA74A45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Select',
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
