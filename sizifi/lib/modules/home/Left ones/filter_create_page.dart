import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterCreatePage extends StatefulWidget {
  const FilterCreatePage({super.key});

  @override
  State<FilterCreatePage> createState() => _FilterCreatePageState();
}

class _FilterCreatePageState extends State<FilterCreatePage> {

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Sizifi Fashion",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
            child: Icon(Icons.search,
                color: Theme.of(context).iconTheme.color, size: 25),
          ),
        ],
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
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Date Created",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black.withOpacity(0.6),
                ),
                const Text(
                  "Sort by",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(FontAwesomeIcons.upDown)
              ],
            ),
            Divider(
              thickness: 3,
              indent: 4,
              endIndent: 4,
              color: Colors.black.withOpacity(0.5),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size * 0.9,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Delivery date",
                    hintStyle: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size * 0.9,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Customer name",
                    hintStyle: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size * 0.9,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tailor name",
                    hintStyle: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size * 0.9,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Store name",
                    hintStyle: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000).withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Container(

               child: Container(
                width: size * 0.9,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
                child: Row(
                  children: [
                    const Text(
                      "Custom name 1",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size * 0.4),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xffA74A45),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xffA74A45),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                         ),
             ),




            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: size * 0.67,
              height: sizee * 0.08,
              decoration: const BoxDecoration(
                color: Color(0xffA74A45),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Text(
                  "+ Custom",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: size * 0.67,
              height: sizee * 0.06,
              decoration: const BoxDecoration(
                color: Color(0xffA74A45),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
