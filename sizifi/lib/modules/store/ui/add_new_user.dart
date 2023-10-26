import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:sizifi/core/routing/routing.dart';
import 'package:sizifi/modules/home/data/model/store_model.dart';

import '../../home/notifiers/store_state.dart';
import '../../authentication/models/user.dart';
import '../../authentication/notifiers/auth_state.dart';

class AddNewUserScreen extends StatefulWidget {
  Store? store;
  final AuthState? state;
  AddNewUserScreen({Key? key, this.store, this.state}) : super(key: key);

  @override
  _AddNewUserScreenState createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  String? selectedValue;
  String? _storeId;
  bool _isEdit = false;
  final bool _isExisting = true;
  late TextEditingController _emailController;
  late TextEditingController _name;
  final TextEditingController _password = TextEditingController();
  late TextEditingController _locationController;
  late User? user;
  String _roleController = "Executive";

  @override
  void initState() {
    super.initState();
    _isEdit = user != null;
    user = Provider.of<AuthState>(context, listen: false).user;
    _emailController = TextEditingController(text: _isEdit ? user?.email : "");
    _name = TextEditingController(text: _isEdit ? user?.name : "");
    _locationController = TextEditingController(
        text: _isEdit ? user?.preferences.data["storeLocation"] : "");
  }

  @override
  Widget build(BuildContext context) {
    StoreState state;
    String? number;
    String? numberCountry = "IN";
    String? numberCountryCode = "+91";
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(160.0),
              child: Column(
                children: [
                  AppBar(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    elevation: 0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 80,
                    backgroundColor: Theme.of(context).primaryColor,
                    title: _isEdit
                        ? Text('Edit User - ${widget.store?.store_name}')
                        : Text('Add User - ${widget.store?.store_name}'),
                    leading: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //   Routes.allStores,
                          // );
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            height: 24,
                            width: 24,
                            margin: const EdgeInsets.symmetric(
                                vertical: 27, horizontal: 15),
                            child: Center(
                                child: Icon(Icons.arrow_back,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 25)))),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TabBar(
                        labelColor: const Color(0xFFFFFFFF),
                        unselectedLabelColor: const Color(0xFF000000),
                        indicatorColor: const Color(0xFFA74A45),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          color: const Color(0xFFA74A45),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFA74A45), width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text("Existing User",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFA74A45), width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text("New User",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ),
                        ]),
                  )
                ],
              )),
          body: Consumer<AuthState>(
            builder: (context, state, child) {
              if (!state.isLoggedIn) return Container();
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: TabBarView(children: [
                    Container(
                      child: ListView(children: [
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              suffixIcon: const Icon(Icons.mail),
                              label: Text(
                                'User Email',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.6)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              underline: const Text(""),
                              isExpanded: true,
                              value: _roleController,
                              items: <String>[
                                'Executive',
                                'Manager',
                                'Admin',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (status) {
                                setState(
                                  () {
                                    _roleController = status.toString();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Add User",
                            onTap: () async {
                              StoreState ss = Provider.of<StoreState>(context,
                                  listen: false);

                              AuthState as = Provider.of<AuthState>(context,
                                  listen: false);

                              var data = {};
                              data["id"] = "";
                              data["email"] = _emailController.text;
                              Store store = Store(
                                  team_id: widget.store!.team_id,
                                  store_name: _name.text,
                                  location: widget.store!.location,
                                  order_no_prefix: "1234",
                                  next_no: "0945",
                                  //members: widget.store!.members.toList(),
                                  about: widget.store!.about,
                                  store_brand_name:
                                      widget.store!.store_brand_name,
                                  brand_store: widget.store!.brand_store,
                                  email: widget.store!.email,
                                  phone_no: widget.store!.phone_no,
                                  address_1: widget.store!.address_1,
                                  address_2: widget.store!.address_2,
                                  landmark: widget.store!.landmark,
                                  city: widget.store!.city,
                                  pin_code: widget.store!.pin_code,
                                  state: widget.store!.state,
                                  country: "India");
                              await ss.addStoreMembership(
                                  store, data, _roleController);

                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     Routes.allStores, (_) => false);
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
                      ]),
                    ),
                    // ******************************************************************************************************************************************
                    Container(
                      child: ListView(children: [
                        Column(
                          children: [
                            TextField(
                              controller: _name,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  suffixIcon: const Icon(Icons.person),
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.6)),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  )),
                            ),
                            const SizedBox(height: 18),
                            TextField(
                              controller: _password,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  suffixIcon: const Icon(Icons.lock),
                                  label: Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.6)),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              suffixIcon: const Icon(Icons.mail),
                              label: Text(
                                'User Email',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.6)),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        const SizedBox(height: 18),
                        IntlPhoneField(
                          initialValue: number,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              hintText: "Number",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          initialCountryCode: numberCountry,
                          onChanged: (phone) {
                            number = phone.number;
                            numberCountry = phone.countryISOCode;
                            numberCountryCode = phone.countryCode;
                          },
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              underline: const Text(""),
                              isExpanded: true,
                              value: _roleController,
                              items: <String>[
                                'Executive',
                                'Manager',
                                'Admin',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (status) {
                                setState(
                                  () {
                                    _roleController = status.toString();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: SFButton(
                            title: "Create & Add User",
                            onTap: () async {
                              StoreState ss = Provider.of<StoreState>(context,
                                  listen: false);

                              AuthState as = Provider.of<AuthState>(context,
                                  listen: false);

                              var data = {};
                              print(number);
                              data["id"] = null;
                              data["email"] = _emailController.text;
                              data["name"] = user?.name ?? _name.text;
                              data["number"] = number.toString();
                              data["number_country"] = numberCountry.toString();
                              data["number_country_code"] =
                                  numberCountryCode.toString();
                              data["password"] = _password.text;

                              Store store = Store(
                                  team_id: widget.store!.team_id,
                                  store_name: widget.store!.store_name,
                                  location: widget.store!.location,
                                  order_no_prefix: "1234",
                                  next_no: "0945",
                                  //members: widget.store!.members.toList(),
                                  about: widget.store!.about,
                                  store_brand_name:
                                      widget.store!.store_brand_name,
                                  brand_store: widget.store!.brand_store,
                                  email: widget.store!.email,
                                  phone_no: widget.store!.phone_no,
                                  address_1: widget.store!.address_1,
                                  address_2: widget.store!.address_2,
                                  landmark: widget.store!.landmark,
                                  city: widget.store!.city,
                                  pin_code: widget.store!.pin_code,
                                  state: widget.store!.state,
                                  country: "India");
                              await ss.addStoreMembership(
                                  store, data, _roleController);

                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     Routes.allStores, (_) => false);
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
                      ]),
                    ),
                  ]));
            },
          ),
        ),
      ),
    );
  }
}
