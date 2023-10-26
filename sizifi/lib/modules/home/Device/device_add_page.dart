import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceAddPage extends StatefulWidget {
  const DeviceAddPage({super.key});

  @override
  State<DeviceAddPage> createState() => _DeviceAddPageState();
}

class _DeviceAddPageState extends State<DeviceAddPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    var userAct = 'act';
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF7A56D).withOpacity(0.1),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Add Device",
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
          margin: const EdgeInsets.only(
            left: 16,
            top: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
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
                      hintText: "Device Name",
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "SIZIFI STM 2.0",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff000000).withOpacity(0.6),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "#ffb20-77a9-11ed-84f7",
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff000000).withOpacity(0.6),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
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
                      hintText: "Store",
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
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
                      hintText: "User",
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                width: size * 0.9,
                height: size * 0.17,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: size * 0.04,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Status",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: size * 0.12,
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, left: 50),
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 8, left: 12, bottom: 7),
                            height: sizee * 0.07,
                            decoration: const BoxDecoration(
                              color: Color(0xFFA74A45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 10),
                              child: DropdownButtonFormField(
                                  alignment: Alignment.topCenter,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  dropdownColor: const Color(0xFFA74A45),
                                  iconDisabledColor: const Color(0xFFFFFFFF),
                                  iconEnabledColor: const Color(0xFFFFFFFF),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(17)),
                                  value: userAct,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'act',
                                      child: Text(
                                        "Active",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ina',
                                      child: Text(
                                        "Inactive",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                  ],
                                  onChanged: (v) {}),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 34),
                  width: size * 0.9,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Color(0xFFA74A45),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
