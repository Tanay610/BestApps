import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/modules/home/Templates/temp_edit_page.dart';
import 'package:sizifi/modules/home/data/model/templates.dart';

// ignore: must_be_immutable
class TemplatesDetailPage extends StatefulWidget {
  TemplatesDetailPage({super.key, required this.template});

  late Templates template;

  @override
  State<TemplatesDetailPage> createState() => _TemplatesDetailPageState();
}

class _TemplatesDetailPageState extends State<TemplatesDetailPage> {
  TextEditingController customerNameController2 = TextEditingController();
  updateTemplate(Templates template) {
    setState(() {
      widget.template = template;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    //var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Detail-${widget.template.status}",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TemplateEditPage(
                        template: widget.template,
                        updateTemplate: updateTemplate,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                height: 24,
                width: 24,
                child: Center(
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).iconTheme.color,
                    size: 22,
                  ),
                ),
              ),
            )
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
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                  size: 25,
                ),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  width: size * 0.94,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.template.template,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          // fontWeight: FontWeight.w100,
                          fontSize: 14,
                        ),
                      ),
                    ],
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
