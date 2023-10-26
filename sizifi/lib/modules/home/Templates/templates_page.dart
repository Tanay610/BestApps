import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Templates/temp_detail_page.dart';
import 'package:sizifi/modules/home/notifiers/templates_state.dart';

import '../data/model/templates.dart';

class TemplatesPage extends StatefulWidget {
  const TemplatesPage({super.key});

  @override
  State<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends State<TemplatesPage> {
  List<Templates> userTemplates = [];
  List<Templates> tailorTemplates = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      userTemplates =
          Provider.of<TemplatesState>(context, listen: false).userTemplates;
      tailorTemplates =
          Provider.of<TemplatesState>(context, listen: false).tailorTemplates;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Templates",
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
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Customer Templates",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) => element.status == "Initiated")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Initiated",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) =>
                                  element.status == "Under Alteration")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Under Alteration",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) =>
                                  element.status == "Measurement/Notes Update")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Measurement/Notes Update",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) =>
                                  element.status == "Altered & Ready")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Altered & Ready",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) => element.status == "Delivered")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivered",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TemplatesDetailPage(
                              template: userTemplates
                                  .where(
                                      (element) => element.status == "On hold")
                                  .first);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "On hold",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: userTemplates
                              .where((element) => element.status == "Canceled")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Canceled",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tailor Templates",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: tailorTemplates
                              .where((element) => element.status == "Initiated")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Initiated",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: tailorTemplates
                              .where((element) =>
                                  element.status == "Under Alteration")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Under Alteration",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TemplatesDetailPage(
                              template: tailorTemplates
                                  .where((element) =>
                                      element.status ==
                                      "Measurement/Notes Update")
                                  .first);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Measurement/Notes Update",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TemplatesDetailPage(
                              template: tailorTemplates
                                  .where((element) =>
                                      element.status == "Altered & Ready")
                                  .first);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Altered & Ready",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TemplatesDetailPage(
                              template: tailorTemplates
                                  .where((element) =>
                                      element.status == "Delivered")
                                  .first);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivered",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: tailorTemplates
                              .where((element) => element.status == "On hold")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "On hold",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TemplatesDetailPage(
                          template: tailorTemplates
                              .where((element) => element.status == "Canceled")
                              .first);
                    }));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Canceled",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.chevron_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
