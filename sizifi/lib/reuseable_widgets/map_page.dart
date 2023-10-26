import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key, required this.address});

  late String address = "";

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 700,
                child: OpenStreetMapSearchAndPick(
                  center: LatLong(27, 84),
                  onPicked: (pickedData) {
                    setState(() {
                      widget.address = pickedData.address;
                    });

                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                  },
                  // onGetCurrentLocationPressed: (){

                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
