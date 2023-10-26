// import 'dart:io';

// import 'package:csv/csv.dart';
// import 'package:external_path/external_path.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:to_csv/to_csv.dart' as exportCsv;


// class ToCsv extends StatefulWidget {
//   const ToCsv({super.key});

//   @override
//   State<ToCsv> createState() => _ToCsvState();
// }

// class _ToCsvState extends State<ToCsv> {


// void exportUserDetailsToCSV(User user) async {
//   // Convert the user details to a CSV string
//   final csvString = [
//     ['Name', 'Email', 'Phone Number'],
//     [user.name, user.email, user.phoneNumber]
//   ]

//   // Create a temporary directory to store the CSV file
//   final directory = await getTemporaryDirectory();
//   final filePath = '${directory.path}/user_details.csv';

//   // Write the CSV string to a file
//   final file = File(filePath);
//   await file.writeAsString(csvString);

//   // Show a snackbar or toast message to indicate successful export
//   // For example: Fluttertoast.showToast(msg: 'User details exported successfully');

//   // Open the file for sharing or further processing
//   // You can use the 'share' package to share the file with other apps
//   // For example, you can use 'share_plus' package:
//   // await Share.shareFiles([filePath], text: 'User Details CSV File');

//   // If you want to download the file to local storage, you can use the 'downloads_path_provider' package
//   // For example, you can use 'downloads_path_provider' package:
//   // final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
//   // final destinationFilePath = '${downloadsDirectory.path}/user_details.csv';
//   // await file.copy(destinationFilePath);
// }



//   List<List<String>> listOfLists = [];
//   List<String> data1 = ['1', 'jennifer', '1374934', '912839812'];
//   List<String> data2 = ['2', 'ahana', '21341234', '192834821'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange[100],
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         List<String> header = [];
//         header.add('No.');
//         header.add('User Name');
//         header.add('Mobile');
//         header.add('ID Number');

//         listOfLists.add(data1);
//         listOfLists.add(data2);

//         exportCsv.myCSV(header, listOfLists);
//       }),
//       body: Container(
//         child: Column(
//           children: [
            
//           ],
//         ),
//       ),
//     );
//   }
// }




// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title});

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _generateCsvFile() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     List<dynamic> associateList = [
//       {"number": 1, "lat": "14.97534313396318", "lon": "101.22998536005622"},
//       {"number": 2, "lat": "14.97534313396318", "lon": "101.22998536005622"},
//       {"number": 3, "lat": "14.97534313396318", "lon": "101.22998536005622"},
//       {"number": 4, "lat": "14.97534313396318", "lon": "101.22998536005622"}
//     ];

//     List<List<dynamic>> rows = [];

//     List<dynamic> row = [];
//     row.add("number");
//     row.add("latitude");
//     row.add("longitude");
//     rows.add(row);
//     for (int i = 0; i < associateList.length; i++) {
//       List<dynamic> row = [];
//       row.add(associateList[i]["number"] - 1);
//       row.add(associateList[i]["lat"]);
//       row.add(associateList[i]["lon"]);
//       rows.add(row);
//     }

//     String csv = const ListToCsvConverter().convert(rows);

//     String dir = await ExternalPath.getExternalStoragePublicDirectory(
//         ExternalPath.DIRECTORY_DOWNLOADS);
//     print("dir $dir");
//     String file = "$dir";

//     File f = File(file + "/filename.csv");

//     f.writeAsString(csv);

//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _generateCsvFile,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }




// import 'package:csv/csv.dart';

//   import 'package:url_launcher/url_launcher.dart';

//   String? csv;
//   Future createCSVFile() async {
//   List<List<dynamic>> csvList = [];      
//   csvList.add(csvHeaderTitle);
    

//     for (var data in CsvModuleList.toSet()) {
      
//      List row = [];
//       row.add(data.toJson()['FieldOne']);
//       row.add(data.toJson()['FieldTwo']);
      

//       csvList.add(row);
//     }

//     csv = const ListToCsvConverter().convert(csvList);
    
//     print(CSV);
//   }



// Future<void> downloadCSV() async {
//     final content = base64Encode(csv.codeUnits);
//     final url = 'data:text/csv;base64,$content';
//     await UrlLauncherPlugin().launch(url);
// }



import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';





class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<List<dynamic>> employeeData;

  @override
  initState(){
    super.initState();
    //create an element rows of type list of list. All the above data set are stored in associate list
//Let associate be a model class with attributes name,gender and age and associateList be a list of associate model class.


    employeeData  = List<List<dynamic>>.empty(growable: true);
    for (int i = 0; i <5;i++) {

//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = List.empty(growable: true);
      row.add("Employee Name $i");
      row.add((i%2==0)?"Male":"Female");
      row.add(" Experience : ${i*5}");
      employeeData.add(row);
    }
  }

  getCsv() async {

    if (await Permission.storage.request().isGranted) {


      String dir = "${(await getExternalStorageDirectory())!.path}/mycsv.csv";
      String file = dir;

      File f = File(file);

// convert rows to String and write as csv file

      String csv = const ListToCsvConverter().convert(employeeData);
      f.writeAsString(csv);
    }else{

      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
  
        title: const Text("CSV Export"),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: employeeData.length,
                itemBuilder: (context,index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(employeeData[index][0]),
                     Text(employeeData[index][1]),
                     Text(employeeData[index][2]),
                    ],
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                height: 30,
                child: TextButton(
                  onPressed: getCsv,
                  child: const Text("Export to CSV",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }



}







class EditableTemplatePage extends StatefulWidget {
  const EditableTemplatePage({super.key});

  @override
  _EditableTemplatePageState createState() => _EditableTemplatePageState();
}

class _EditableTemplatePageState extends State<EditableTemplatePage> {
  TextEditingController _templateController = TextEditingController();
  late String _initialTemplate;
  late String _currentTemplate;

  @override
  void initState() {
    super.initState();
    _templateController = TextEditingController();
    _initialTemplate = 'This is the initial template'; // Set the initial template here
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
      appBar: AppBar(
        title: const Text('Editable Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _templateController,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Template',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveTemplate,
              child: const Text('Save'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: resetTemplate,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
