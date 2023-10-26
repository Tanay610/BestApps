import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/home/data/model/tailor.dart';
import 'package:sizifi/modules/home/notifiers/tailor_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../authentication/notifiers/auth_state.dart';
import '../../../home/notifiers/store_state.dart';
import 'tailor_list_screen.dart';
//

class AddTailorScreen extends StatefulWidget {
  final AuthState? state;
  Tailor? tailor;
  AddTailorScreen({Key? key, this.state, this.tailor}) : super(key: key);

  @override
  _AddTailorScreenState createState() => _AddTailorScreenState();
}

class _AddTailorScreenState extends State<AddTailorScreen> {
  String? selectedValue;
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _skillsController;
  // TextEditingController? _tailorStoreController;
  TextEditingController? _numberController;

  @override
  void dispose() {
    _numberController?.dispose();
    super.dispose();
  }

  // TextEditingController _numberController = TextEditingController();
  // _numberController = _number;

  bool _isEdit = false;
  List<bool> _selected = [true, false];
  String? _number = "";

  String? NumberCountry = "";
  String? NumberCountryCode = "";
  var userAct = 'act';
  //  var store = Provider.of<StoreState>(context, listen: false).activeStore;

// store.store_name,
  @override
  void initState() {
    super.initState();

    _isEdit = widget.tailor != null;

    _nameController =
        TextEditingController(text: _isEdit ? widget.tailor?.name : null);

    _skillsController =
        TextEditingController(text: _isEdit ? widget.tailor?.skills : null);

    _emailController =
        TextEditingController(text: _isEdit ? widget.tailor?.email : null);

    // _tailorStoreController =
    //     TextEditingController(text: _isEdit ? widget.store.store_name : null);

    _number = _isEdit ? widget.tailor?.number : null;

    NumberCountry = _isEdit ? widget.tailor?.number_country : 'IN';

    NumberCountryCode = _isEdit ? widget.tailor?.number_country_code : '+91';

    _selected = _isEdit
        ? (widget.tailor!.type == "store" ? [true, false] : [false, true])
        : [true, false];

    // _tailorStoreController =
    // TextEditingController(text: _isEdit ? widget.tailor?.store : null);

    //userAct = _isEdit ? widget.tailor!.tailor_status.toString() : 'act';
    _numberController = TextEditingController(text: _number);
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    // var store = Provider.of<StoreState>(context, listen: false).activeStore;
    // String? StoreId = widget.tailor?.store_id;
    //bool? TailorStatus = widget.tailor?.tailor_status;
    // String? Type = widget.tailor?.type;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            _isEdit ? "Edit" : "Add Tailor",
            // "Add Tailor",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)),
          ),
          leading: InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(Routes.tailorList);
              Navigator.of(context).pop();
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
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Provider.of<TailorState>(context, listen: false)
                    .deleteTailor(widget.tailor!);
                // Navigator.of(context).pushNamed(Routes.tailorList);
                // Navigator.of(context).pop();
              },
              child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: Center(
                  child: Icon(Icons.delete,
                      color: Theme.of(context).iconTheme.color, size: 25),
                ),
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text(
                      "Tailor Details",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFFFFF),
                      prefixIcon: const Icon(Icons.person),
                      label: Text(
                        'Tailor Name',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000).withOpacity(0.6)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null ||
                          !value.contains('.com') ||
                          !value.contains('@')) {
                        return 'Please enter correct mail';
                      }
                      return null;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFFFFF),
                      prefixIcon: const Icon(Icons.mail),
                      label: Text(
                        'Tailor email (Optional)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _numberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      hintText: "Tailor Number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _skillsController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFFFFF),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.scissors,
                        size: 18,
                      ),
                      label: Text(
                        'Capabilities',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000).withOpacity(0.6)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    //controller: _tailorStoreController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.store,
                          size: 18,
                        ),
                        label: Text(
                          'Tailor store',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000).withOpacity(0.6),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                  // const SizedBox(height: 12),
                  // TextField(
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: const Color(0xFFFFFFFF),
                  //     prefixIcon: const Icon(
                  //       FontAwesomeIcons.tableList,
                  //       size: 18,
                  //     ),
                  //     label: Text(
                  //       'Order list',
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w400,
                  //           color: const Color(0xFF000000).withOpacity(0.6)),
                  //     ),
                  //     border: const OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     enabledBorder: const OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        SvgPicture.asset(
                          "assets/icons/tailor status.svg",
                          width: 35,
                          height: 35,
                          // ignore: deprecated_member_use
                          color: const Color(0xFF000000).withOpacity(0.7),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Tailor Status",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.12,
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 1),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 8, top: 8, bottom: 8),
                              height: sizee * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xFFA74A45),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 6,
                                    right: 7,
                                  ),
                                  child: DropdownButtonFormField(
                                      alignment: AlignmentDirectional.topCenter,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      dropdownColor: const Color(0xFFA74A45),
                                      iconDisabledColor:
                                          const Color(0xFFFFFFFF),
                                      iconEnabledColor: const Color(0xFFFFFFFF),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(17)),
                                      value: userAct,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'act',
                                          child: Text(
                                            "Active",
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'ina',
                                          child: Text(
                                            "Inactive",
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              color: Color.fromARGB(
                                                  255, 248, 1, 1),
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      ],
                                      onChanged: (v) {
                                        setState(() {
                                          userAct = v.toString();
                                          print(userAct);
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height * 0.085,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            FontAwesomeIcons.warehouse,
                            color: const Color(0xFF666666).withOpacity(0.7),
                            size: 18,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Text(
                            "Type",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF666666),
                              fontSize: 16,
                              fontFamily: 'poppins',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: SizedBox(
                            height: 35,
                            child: ToggleButtons(
                              selectedBorderColor: const Color(0xFFA74A45),
                              selectedColor: Colors.white,
                              disabledBorderColor: Colors.black,
                              disabledColor: Colors.white,
                              fillColor: const Color(0xFFA74A45),
                              borderWidth: 1.0,
                              borderColor:
                                  const Color(0xFF000000).withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(25, 25)),
                              isSelected: _selected,
                              onPressed: (index) {
                                setState(() {
                                  for (int i = 0; i < _selected.length; i++) {
                                    _selected[i] = i == index;
                                    print(_selected[i] = i == index);
                                  }
                                });
                              },
                              children: const [
                                SizedBox(
                                  width: 60,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "Store",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'poppins',
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "WH",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'poppins',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SFButton(
                      title: "Save",
                      onTap: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return const TailorListScreen();
                        //     },
                        //   ),
                        // );
                        Navigator.of(context).pop();
                        // _isEdit ? Navigator.of(context).pop() : null;
                        Tailor tailor = Tailor(
                          id: widget.tailor?.id,
                          name: _nameController!.text,
                          number: _numberController!.text,
                          number_country: NumberCountry.toString(),
                          number_country_code: NumberCountryCode.toString(),
                          pending_orders: "0",
                          skills: _skillsController!.text,
                          tailor_status: userAct == "ina" ? false : true,
                          type: _selected[0] ? "store" : "wh",
                          store_id:
                              Provider.of<StoreState>(context, listen: false)
                                  .activeStore!
                                  .team_id,
                          email: _emailController!.text,
                        );
                        TailorState tt =
                            Provider.of<TailorState>(context, listen: false);

                        StoreState ss =
                            Provider.of<StoreState>(context, listen: false);
                        if (_isEdit) {
                          print("Tailor edited");
                          await tt.updateTailor(tailor);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Updated!!"),
                              backgroundColor: Theme.of(context).splashColor,
                            ),
                          );
                        } else {
                          print("Tailor created");
                          await tt.addTailor(
                              tailor, ss.activeStore!.brand_store);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: const Text("Tailor Created!!"),
                                backgroundColor: Theme.of(context).splashColor),
                          );
                        }
                      },
                      titleColor: const Color(0xFFFFFFFF),
                      buttonBackgroundColor: const Color(0xFFA74A45),
                      borderColor: const Color(0x00ffffff),
                      borderRadius: 15,
                      titleFontSize: 18,
                      text: '',
                    ),
                  ),
                  const SizedBox(height: 21),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
