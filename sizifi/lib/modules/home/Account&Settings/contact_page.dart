import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/modules/home/Account&Settings/succes_dialog.dart';

class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
  final List<bool> _selected = [true, false];
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    bool istapped = true;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Contact",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
                ),
                child: ToggleButtons(
                  borderColor: Colors.white,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  fillColor: const Color(0xFFA74A45),
                  // splashColor: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.elliptical(25, 25)),
                  isSelected: widget._selected,
                  onPressed: (index) {
                    setState(() {
                      widget._selected[index] = !widget._selected[index];

                      istapped = !istapped;
                      // if (index == 1) {
                      //   if (widget._selected[index]) {
                      //   } else {
                      //     print("kuch bhi");
                      //   }
                      // }

                      for (int i = 0; i < widget._selected.length; i++) {
                        widget._selected[i] = i == index;
                      }
                    });
                  },
                  children: [
                    SizedBox(
                      width: size * 0.47,
                      height: sizee * 0.05,
                      child: const Center(
                        child: Text(
                          "Feedback",
                          // style: TextStyle(
                          //   fontFamily: 'poppins',
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w400,
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size * 0.47,
                        height: sizee * 0.05,
                        child: const Center(child: Text("Complain")))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 2,
                ),
                padding: const EdgeInsets.all(10),
                height: sizee * 0.6,
                width: size * 0.87,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10, right: 5),
                        border: InputBorder.none,
                        hintText: "Subject",
                        hintStyle: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      height: 1.0,
                      indent: 8.0,
                      endIndent: 8.0,
                      color: const Color(0xFf000000).withOpacity(0.5),
                    ),
                    Expanded(
                      child: TextField(
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10, top: 10, right: 5, bottom: 5),
                          border: InputBorder.none,
                          hintText:
                              widget._selected[1] ? 'Complain' : 'Message',
                          hintStyle: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000).withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const SuccessDialog();
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  width: size * 0.85,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Color(0xffA74A45),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
