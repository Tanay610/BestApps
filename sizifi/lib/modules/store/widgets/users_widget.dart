import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/components/sf_button.dart';

import '../../../core/routing/routing.dart';

class UsersWidget extends StatelessWidget {
  final String name;
  final String roles;

  const UsersWidget({
    Key? key,
    required this.name,
    required this.roles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              const Image(image: AssetImage('assets/icons/person.png'), height: 16),
              const SizedBox(width: 7),
              Text(
                name,
                style: GoogleFonts.koHo(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333)),
              ),
            ]),
            SizedBox(
              height: 25,
              width: MediaQuery.of(context).size.width * 0.22,
              child: SFButton(
                title: roles,
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.addExistingUser, (_) => false);
                },
                titleColor: const Color(0xFFFFFFFF),
                buttonBackgroundColor: const Color(0xFFA74A45),
                borderColor: const Color(0x00ffffff),
                borderRadius: 5,
                titleFontSize: 12, text: '',
              ),
            ),
          ])),
    );
  }
}
