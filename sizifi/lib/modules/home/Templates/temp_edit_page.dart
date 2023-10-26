import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/data/model/templates.dart';
import 'package:sizifi/modules/home/notifiers/store_state.dart';
import 'package:sizifi/modules/home/notifiers/templates_state.dart';

// ignore: must_be_immutable
class TemplateEditPage extends StatefulWidget {
  TemplateEditPage({super.key, required this.template, this.updateTemplate});
  Templates template;
  final updateTemplate;
  @override
  State<TemplateEditPage> createState() => _TemplateEditPageState();
}

class _TemplateEditPageState extends State<TemplateEditPage> {
  //final List<bool> _selected = [true, false, true];

  Quill.QuillController _quillController = Quill.QuillController(
      document: Quill.Document()
        ..insert(
          0,
          "",
        ),
      selection: const TextSelection(baseOffset: 0, extentOffset: 0));

  @override
  void initState() {
    super.initState();
    _quillController = Quill.QuillController(
        document: Quill.Document()
          ..insert(
            0,
            widget.template.template,
          ),
        selection: const TextSelection(baseOffset: 0, extentOffset: 0));

    // cursorLocation.offset;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Edit-${widget.template.status}",
            style: GoogleFonts.poppins(
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
        body: Container(
          margin: const EdgeInsets.only(top: 15, left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: const BoxDecoration(
                          color: Color(0xFFA74A45),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(26, 26),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DropdownButtonFormField(
                              alignment: Alignment.bottomCenter,
                              // value: values,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              dropdownColor: const Color(0xffA74A45),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: '<Order ID>',
                                  child: Text(
                                    "Order ID",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Item>',
                                  child: Text(
                                    "Item",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<POM>',
                                  child: Text(
                                    "POM",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<value>',
                                  child: Text(
                                    "value",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<units>',
                                  child: Text(
                                    "units",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Customer notes>',
                                  child: Text(
                                    "Customer notes",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Store Notes>',
                                  child: Text(
                                    "Store Notes",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Invoice no>',
                                  child: Text(
                                    "Invoice no",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Expected Delivery Date>',
                                  child: Text(
                                    "Expected Delivery Date",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Delivery Mode>',
                                  child: Text(
                                    "Delivery Mode",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Sign off>',
                                  child: Text(
                                    "Sign off",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Store name>',
                                  child: Text(
                                    "Store name",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '<Store Contact no>',
                                  child: Text(
                                    "Store Contact no",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (v) {
                                _quillController.document.insert(
                                    _quillController.selection.base.offset, v);
                                // print(_quillController.selection.base.offset);
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Quill.QuillToolbar.basic(
                                toolbarIconSize: 20.0,
                                toolbarSectionSpacing: 25,
                                showAlignmentButtons: false,
                                showDividers: false,
                                showFontFamily: false,
                                controller: _quillController,
                                showFontSize: false,
                                showSmallButton: false,
                                showStrikeThrough: false,
                                showInlineCode: false,
                                showColorButton: false,
                                showBackgroundColorButton: false,
                                showClearFormat: false,
                                showLeftAlignment: false,
                                showRightAlignment: false,
                                showJustifyAlignment: false,
                                showHeaderStyle: false,
                                showListNumbers: false,
                                showListBullets: false,
                                showListCheck: false,
                                showCodeBlock: false,
                                showQuote: false,
                                showLink: false,
                                showUndo: false,
                                showRedo: false,
                                showSearchButton: false,
                                showSubscript: false,
                                showSuperscript: false,
                                multiRowsDisplay: false,
                                showIndent: false,
                              ),
                              Expanded(
                                child: Container(
                                  child: Quill.QuillEditor.basic(
                                      controller: _quillController,
                                      readOnly: false),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    TemplatesState ts =
                        Provider.of<TemplatesState>(context, listen: false);
                    StoreState ss =
                        Provider.of<StoreState>(context, listen: false);

                    setState(() {
                      widget.template.template =
                          _quillController.document.toPlainText();
                      widget.template.store_id = ss.activeStore!.team_id;
                    });

                    if (widget.template.id == null) {
                      await ts.addTemplates(
                          widget.template, widget.updateTemplate);
                    } else {
                      await ts.updateTemplates(
                          widget.template, widget.updateTemplate);
                    }

                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size * 0.9,
                    height: sizee * 0.08,
                    decoration: const BoxDecoration(
                        color: Color(0xFFA74A45),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(vertical: 10),
                //     width: size * 0.9,
                //     height: sizee * 0.08,
                //     decoration: BoxDecoration(
                //         color: const Color(0xFFA74A45).withOpacity(0.5),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(15))),
                //     child: const Center(
                //       child: Text(
                //         "Reset",
                //         style: TextStyle(
                //           fontFamily: 'poppins',
                //           fontSize: 18,
                //           fontWeight: FontWeight.w600,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
