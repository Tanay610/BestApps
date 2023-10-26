import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dio/dio.dart';

class DownloadAlert extends StatefulWidget {
  const DownloadAlert({super.key, required this.url, required this.path});

  final String url;
  final String path;

  @override
  State<DownloadAlert> createState() => _DownloadAlertState();
}

class _DownloadAlertState extends State<DownloadAlert> {
  Dio dio = new Dio();
  int received = 0;
  String progress = '0';
  int total = 0;

  download() async {
    await dio.download(
      widget.url,
      widget.path,
      deleteOnError: true,
      onReceiveProgress: (receivedBytes, totalBytes) {
        setState(() {
          received = receivedBytes;
          total = totalBytes;
          progress = (received / total * 100).toStringAsFixed(0);
        });

        /// check if the download is complete and close the alert dialog
        if(receivedBytes == totalBytes){
         
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
