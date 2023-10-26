import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/components/sf_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizifi/modules/home/data/model/orders.dart';
import 'package:geolocator/geolocator.dart';

import '../../../reuseable_widgets/map_page.dart';
import '../../home/data/model/store_model.dart';
import '../../home/notifiers/store_state.dart';
import '../../authentication/models/user.dart';
import '../../authentication/notifiers/auth_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'n_store_screen.dart';
//import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class AddStoreScreen extends StatefulWidget {
  Store? store;
  final AuthState? state;
  AddStoreScreen({Key? key, this.store, this.state}) : super(key: key);

  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  String? selectedValue;
  Store? store;
  List<Order> orders = [];
  late List members;
  late String name;
  late var id;
  String? location;
  late String about;
  late String store_brand_name;
  late String brand_store;
  late String email;
  late String phone_no;
  late String address_1;
  late String address_2;
  late String landmark;
  late String city;
  late String pin_code;
  late String state;

  bool _isEdit = false;
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _aboutController;
  late User user;
  String contentAddress = "";
  late TextEditingController _brandController = TextEditingController();
  late TextEditingController _storeController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _phoneController = TextEditingController();
  late TextEditingController _ad1Controller = TextEditingController();
  late TextEditingController _ad2Controller = TextEditingController();
  late TextEditingController _landController = TextEditingController();
  late TextEditingController _cityController = TextEditingController();
  late TextEditingController _stateController = TextEditingController();
  late TextEditingController _pinController = TextEditingController();

  LocationPermission? permission;
  LatLong? latLong;
  late Position currentPosition;

  @override
  void initState() {
    super.initState();
    _isEdit = widget.store != null;
    user = Provider.of<AuthState>(context, listen: false).user;
    _nameController =
        TextEditingController(text: _isEdit ? widget.store?.store_name : null);
    _brandController = TextEditingController(
        text: _isEdit ? widget.store?.store_brand_name : null);
    _storeController =
        TextEditingController(text: _isEdit ? widget.store?.brand_store : null);
    _emailController =
        TextEditingController(text: _isEdit ? widget.store?.email : null);
    _phoneController =
        TextEditingController(text: _isEdit ? widget.store?.phone_no : null);
    _ad1Controller =
        TextEditingController(text: _isEdit ? widget.store?.address_1 : null);
    _ad2Controller =
        TextEditingController(text: _isEdit ? widget.store?.address_2 : null);
    _landController =
        TextEditingController(text: _isEdit ? widget.store?.landmark : null);
    _cityController =
        TextEditingController(text: _isEdit ? widget.store?.city : null);
    _pinController =
        TextEditingController(text: _isEdit ? widget.store?.pin_code : null);
    _stateController =
        TextEditingController(text: _isEdit ? widget.store?.state : null);

    _locationController =
        TextEditingController(text: _isEdit ? widget.store?.location : null);
    _aboutController =
        TextEditingController(text: _isEdit ? widget.store?.about : null);
    if (_isEdit) {
      var lat = widget.store!.location.split(",").first.toString();
      var long = widget.store!.location.split(",").last.toString();
      latLong = LatLong(double.parse(lat), double.parse(long));
    }
  }

  File? _image;

  File? _image2;
  // This is the image picker
  final _picker = ImagePicker();
  final _picker2 = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openImagePicker2() async {
    final XFile? pickedImage2 =
        await _picker2.pickImage(source: ImageSource.gallery);
    if (pickedImage2 != null) {
      setState(() {
        _image2 = File(pickedImage2.path);
      });
    }
  }

  //  if (store == null) {
  //     store = widget.store;
  //     print(store?.store_name);
  //     //members = store!.members;
  //     name = store!.store_name;
  //     id = store!.team_id;
  //     location = store!.location;
  //     about = store!.about;
  //     store_brand_name = store!.store_brand_name;
  //     brand_store = store!.brand_store;
  //     email = store!.email;
  //     phone_no = store!.phone_no;
  //     address_1 = store!.address_1;
  //     address_2 = store!.address_2;
  //     landmark = store!.landmark;
  //     city = store!.city;
  //     pin_code = store!.pin_code;
  //     state = store!.state;
  //     // print(widget.store!.members);
  //     // members = widget.store!.members;
  //   }

  dialogWidget() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            // height: 220,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Alert',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  // width: 334,
                  // height: 55,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEF6F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Please Enable the Location Permission to fetch the current location of the Store',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    permission = await Geolocator.requestPermission();
                    _determine_position();
                  },
                  child: Container(
                    width: 334,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA74A45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<LatLong> _determine_position() async {
    bool isServiceEnabled;
    LocationPermission permission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }
    // permission = await Geolocator.requestPermission();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        dialogWidget();
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

// ignore: use_build_context_synchronously
        // return

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      await Geolocator.openLocationSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    currentPosition = await Geolocator.getCurrentPosition();
    // if (mounted) {
    setState(() {
      latLong = LatLong(currentPosition.latitude, currentPosition.longitude);
    });
    // }
    return latLong!;
  }

  @override
  Widget build(BuildContext context) {
    _determine_position();
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    StoreState ss = Provider.of<StoreState>(context);
    // print(ss);
    print(widget.store?.store_name);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).primaryColor,
          title: _isEdit
              ? Text(
                  'Edit Store',
                  style: GoogleFonts.koHo(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              : Text(
                  'Add Store',
                  style: GoogleFonts.koHo(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
          // title: Text(
          //   "Add Store",
          //   style: GoogleFonts.poppins(
          //       fontSize: 22,
          //       fontWeight: FontWeight.w600,
          //       color: Color(0xFFFFFFFF)),
          // ),

          actions: [
            _isEdit
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: InkWell(
                      onTap: () async {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text("Delete!!"),
                            content:
                                Text("Are you sure you want to delete $name"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'CANCEL',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA74A45)),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // EasyLoading.show(
                                  //     maskType: EasyLoadingMaskType.custom);
                                  ss.deleteStore(widget.store!);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "${widget.store!.store_name} Deleted!!"),
                                    backgroundColor:
                                        Theme.of(context).splashColor,
                                  ));
                                  print("store deleted");
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', (_) => false);
                                },
                                child: Text(
                                  'Delete',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA74A45)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.delete_rounded,
                            color: Theme.of(context).iconTheme.color, size: 20),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
          leading: InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(Routes.allStores, (_) => false);
              Navigator.of(context).pop();
            },
            child: Container(
                height: 24,
                width: 24,
                margin:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Theme.of(context).iconTheme.color,
                )),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 12),
              Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: size * 0.5,
                      width: size * 1,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: _openImagePicker,
                            child: Container(
                              width: size * 0.9,
                              height: sizee * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: _image != null
                                  ? Image.file(_image!, fit: BoxFit.cover)
                                  : const SizedBox(),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 50,
                            child: GestureDetector(
                                onTap: _openImagePicker2,
                                child: Container(
                                  height: 86,
                                  width: 86,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(43)),
                                    border: Border.all(
                                      width: 3,
                                      // color: Color.fromARGB(
                                      //     255, 248, 226, 211)
                                      color: const Color.fromARGB(
                                          255, 248, 233, 224),
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 43,
                                    backgroundColor: Colors.grey[100],
                                    // backgroundImage: _image2 != null
                                    //     ? Image.file(
                                    //         _image2!,
                                    //         fit: BoxFit.cover,
                                    //       ).image
                                    //     : const AssetImage("")
                                  ),
                                )
                                //*Container(
                                //?     width: 84,
                                //?     height: 84,
                                //?     decoration: BoxDecoration(
                                //?         color: Colors.grey[100],
                                //?         borderRadius: BorderRadius.all(
                                //?           Radius.circular(42),
                                //?         ),
                                //?         border: Border.all(
                                //?             width: 3,
                                //?             color: Color(0xFFF7A56D)
                                //?                 .withOpacity(0.1))),
                                //?     child: _image2 != null
                                //?         ? Image.file(
                                //?             _image2!,
                                //?             fit: BoxFit.cover,
                                //?           )
                                //*         : SizedBox()),
                                ),
                          ),
                          Positioned(
                            top: 128,
                            left: 112,
                            child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: Color(0xffA74A45),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 10,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Store name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.store,
                      size: 20,
                      color: Color(0xFFA74A45),
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
              const SizedBox(height: 12),
              TextField(
                controller: _brandController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Store Brand Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.storeAlt,
                      size: 20,
                      color: Color(0xFFA74A45),
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
              const SizedBox(height: 12),
              TextField(
                controller: _storeController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Brand Store Id',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.brandsFontAwesome,
                      size: 20,
                      color: Color(0xFFA74A45),
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
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Email id',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.envelope,
                      size: 20,
                      color: Color(0xFFA74A45),
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
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Phone No.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000).withOpacity(0.6)),
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.phone,
                      size: 20,
                      color: Color(0xFFA74A45),
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
              const SizedBox(height: 12),

              // SearchGooglePlacesWidget(apiKey: apiKey, onSelected: onSelected, onSearch: onSearch)

              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (context) {
              //     //   return MapPage(address: contentAddress);
              //     // }));
              //   },
              //   child: Container(
              //     height: 80,
              //     decoration: const BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(15),
              //       ),
              //     ),
              //     child: Row(
              //       children: [
              //         const SizedBox(
              //           width: 7,
              //         ),
              //         const Icon(
              //           FontAwesomeIcons.map,
              //           size: 20,
              //           color: Color(0xFFA74A45),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Expanded(
              //           child: Text(
              //             contentAddress,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: OpenStreetMapSearchAndPick(
                  // center: LatLong(latitude, longitude),
                  locationPinIconColor: const Color(0xffA74A45),
                  buttonColor: const Color(0xffA74A45),
                  center: latLong ?? LatLong(27, 84),
                  onPicked: (pickedData) {
                    setState(() {
                      contentAddress = pickedData.address;
                    });

                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                  },
                  // onGetCurrentLocationPressed: () {
                  //   return _determine_position();
                  // }
                ),
              ),

              const SizedBox(height: 21),
              TextField(
                controller: _ad1Controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Address 1',
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
                    )),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _ad2Controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Address 2',
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
                    )),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _landController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Land Mark',
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
                    )),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'City',
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
                    )),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _stateController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'State',
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
                    )),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    label: Text(
                      'Pincode',
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
                    )),
              ),
              const SizedBox(height: 22),

              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: SFButton(
                  title: _isEdit ? "Update" : "Create Store",
                  onTap: () async {
                    StoreState ss =
                        Provider.of<StoreState>(context, listen: false);
                    // print(ss);
                    // var prefs = user.preferences.data;
                    // prefs["storeName"] = _nameController.text;
                    // prefs["storeLocation"] = _locationController.text;
                    // AuthState state =
                    //     Provider.of<AuthState>(context, listen: false);
                    // await state.editAccount(
                    //   null,
                    //   null,
                    //   null,
                    //   prefs,
                    // );
                    Store newstore = Store(
                        team_id: "",
                        store_name: _nameController.text,
                        location: latLong!.latitude.toString() +
                            "," +
                            latLong!.longitude.toString(),
                        about: _aboutController.text,
                        order_no_prefix: "1234",
                        next_no: "0945",
                        //members: [],
                        store_brand_name: _brandController.text,
                        brand_store: _storeController.text,
                        email: _emailController.text,
                        phone_no: _phoneController.text,
                        address_1: _ad1Controller.text,
                        address_2: _ad2Controller.text,
                        landmark: _landController.text,
                        city: _cityController.text,
                        pin_code: _pinController.text,
                        state: _stateController.text,
                        country: "India");
                    if (_isEdit) {
                      newstore.id = widget.store!.id;
                      newstore.team_id = widget.store!.team_id;
                      // print("Updating.........");
                      // print(await ss.updateStore(newstore));
                      await ss.updateStore(newstore);
                      Navigator.of(context).pop();

                      // Navigator.of(context).pop();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => StoreInfoPage(
                      //               store: newstore,
                      //               // store: ss.stores
                      //               //     .where((element) =>
                      //               //         element.id == widget.store!.id)
                      //               //     .first,
                      //             )));
                    } else {
                      await ss.addStore(newstore);
                    }
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     Routes.allStores, (_) => false);
                    Navigator.of(context).pop();
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
        ),
      ),
    );
  }
}
