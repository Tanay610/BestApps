import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        height: sizee * 0.6,
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Your Request has been Submitted",
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Successfully",
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Color(0xFfA74A45),
              ),
            ),
            SvgPicture.asset("assets/images/success.svg"),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.073,
                decoration: const BoxDecoration(
                  color: Color(0xFFA74A45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
