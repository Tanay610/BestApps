import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizifi/modules/home/Device/detail_tape_info.dart';
import 'package:sizifi/modules/home/Device/device_add_page.dart';
import 'package:sizifi/modules/home/Device/device_search.dart';
import 'package:sizifi/reuseable_widgets/device_i_widget.dart';

class MangageDevicePage extends StatefulWidget {
  const MangageDevicePage({super.key});

  @override
  State<MangageDevicePage> createState() => _MangageDevicePageState();
}

class _MangageDevicePageState extends State<MangageDevicePage> {
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
          "Manage Devices",
          style: GoogleFonts.koHo(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchDevicePage();
              }));
            },
            child: Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
              child: Center(
                child: Icon(Icons.search,
                    color: Theme.of(context).iconTheme.color, size: 25),
              ),
            ),
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
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DeviceDetailPage();
                          }));
                        },
                        child: Device_widget(size: size, sizee: sizee));
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA74A45),
        elevation: 5,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DeviceAddPage();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),

    ));
  }
}
