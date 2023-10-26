import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SFButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color titleColor;
  final Color buttonBackgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double titleFontSize;

  final Icon? leadingIcon;
  final Icon? suffixIcon;
  final Image? suffixIconImage;
  final Image? prefixIconImage;

  const SFButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.titleColor,
    required this.buttonBackgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.titleFontSize,
    this.leadingIcon,
    this.suffixIcon,
    this.suffixIconImage,
    this.prefixIconImage,
    required String text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: const Color(
              0xFFA74A45), //Theme.of(context).buttonTheme.colorScheme?.background,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          side: BorderSide(color: borderColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          prefixIconImage ?? leadingIcon ?? const SizedBox(),
          Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: titleFontSize,
                color: titleColor,
              )),
          // SizedBox(width:3),
          suffixIconImage ?? suffixIcon ?? const SizedBox(),
          // suffixIcon?? const SizedBox(),
        ],
      ),
    );
  }
}
