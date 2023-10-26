import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreWidget extends StatelessWidget {
  final String location;
  final String name;
  final String brandStorename;
  final String nameLetters;
  final Container active;
  final Color activeColor;
  

  const StoreWidget({
    Key? key,
    required this.location,
    required this.name,
    required this.nameLetters,
    required this.active,
    required this.activeColor,
    required this.brandStorename,
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
          child: Column(children: [
            SizedBox(
                height: 144,
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                          image: AssetImage("assets/images/store.png"),
                          height: 119)),
                  Positioned(
                    bottom: 1,
                    left: 18,
                    child: Container(
                        height: 74,
                        width: 74,
                        decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          borderRadius: BorderRadius.circular(1500),
                        ),
                        child: Center(
                          child: Text(
                            nameLetters,
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        )),
                  )
                ])),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              Image(
                                  image: const AssetImage(
                                      'assets/icons/store.png'),
                                  height: 16,
                                  color: Theme.of(context).iconTheme.color,
                                  fit: BoxFit.cover),
                              const SizedBox(width: 7),
                              Text(
                                name,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ]),
                            const SizedBox(height: 6),
                            Row(children: [
                              Image(
                                image: const AssetImage(
                                    'assets/icons/location.png'),
                                height: 16,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              const SizedBox(width: 7),
                              Text(location,
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                            ]),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(children: [
                              Image(
                                  image: const AssetImage(
                                      'assets/images/Group 76044.png'),
                                  height: 16,
                                  color: Theme.of(context).iconTheme.color,
                                  fit: BoxFit.cover),
                              const SizedBox(width: 7),
                              Text(
                                brandStorename,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ]),
                            const SizedBox(height: 6),
                            active
                            // Row(
                            //   children:[
                            //     Image(image:AssetImage('assets/icons/person.png'),height:16,color:Color(0xFFA74A45),),
                            //     SizedBox(width:7),
                            //     Text(
                            //       "Hardeep Singh",
                            //       style: GoogleFonts.poppins(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w500,
                            //           color: Color(0xFF333333)),
                            //     ),
                            //   ]
                            // ),
                          ]),
                    ]))
          ])),
    );
  }
}
