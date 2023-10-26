import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillEdito extends StatefulWidget {
  const QuillEdito({super.key});

  @override
  State<QuillEdito> createState() => _QuillEditoState();
}

class _QuillEditoState extends State<QuillEdito> {
  final QuillController _quillController = QuillController(
      document: Document()
        ..insert(
            0,
            'Hi <Customer name>, we have initiated your alteration order. please find the details.'
            '\n'
            '\nOrder Id: <Order ID> '
            '\n'
            '\nItem name:<Item>'
            '\n'
            // '\nAlteration Details:<POM> <value> <units> '
            // '\n'
            '\nCustomer Notes: <Customer notes>'
            '\n'
            '\nStore Notes: <Store Notes>'
            '\n'
            '\nInvoice no: <Invoice no>'
            '\n'
            '\nExpected Delivery Date<Expected Delivery Date>'
            '\n'
            '\nDelivery Mode: <Delivery Mode>'
            '\n'
            '\nRegards,'
            '\n<Sign off>'
            '\n<Store name>'
            '\nStore Contact no:'
            '\n<Store Contact no>'),
      selection: const TextSelection(baseOffset: 0, extentOffset: 20));

  TextEditingController _templateController = TextEditingController();
  late String _initialTemplate;
  late String _currentTemplate;

  @override
  void initState() {
    super.initState();
    _templateController = TextEditingController();
    _initialTemplate =
        'This is the initial template'; // Set the initial template here
    _currentTemplate = _initialTemplate;
    _templateController.text = _currentTemplate;
  }

  @override
  void dispose() {
    _templateController.dispose();
    super.dispose();
  }

  void saveTemplate() {
    setState(() {
      _currentTemplate = _templateController.text;
    });
    // TODO: Save the template to your desired storage (e.g., database, file, etc.)
    // You can add your save logic here
  }

  void resetTemplate() {
    setState(() {
      _templateController.text = _initialTemplate;
      _currentTemplate = _initialTemplate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            QuillToolbar.basic(
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
                child: QuillEditor.basic(
                    controller: _quillController, readOnly: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
