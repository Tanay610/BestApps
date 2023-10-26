import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizifi/modules/home/Left%20ones/customFilter_creation_page.dart';
import 'package:sizifi/modules/home/ui/criteria.dart';

class DateCreatedDialog extends StatefulWidget {
  //final Function(SortingCriteria)? onSortSelected;
  //final Function(String filter) selectFilter;
  const DateCreatedDialog({Key? key}) : super(key: key);

  @override
  State<DateCreatedDialog> createState() => _DateCreatedDialogState();
}

class _DateCreatedDialogState extends State<DateCreatedDialog> {

 //final Function(String criteria)? sortingCriteria;

  //_DateCreatedDialogState({Key? key, this.sortingCriteria});

  String? selectedFilter;
  
 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizee = MediaQuery.of(context).size.height;
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: sizee * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  GestureDetector(
   onTap: () {
    Navigator.pop(context);
    //sortingCriteria!("Date Created");
      Criteria myData = Provider.of<Criteria>(context, listen: false);
     myData.setSelectedFilter("Created on");
  
  },child: const Text(
                    "Created on",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
                  Padding(
                    padding: EdgeInsets.only(left: size * 0.4),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffA74A45),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),GestureDetector(
  onTap: () {
     Navigator.pop(context);
      Criteria myData = Provider.of<Criteria>(context, listen: false);
     myData.setSelectedFilter("Delivery date");
  },
            child: Container(
              child: const Text(
                "Delivery date",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),),
           GestureDetector( 
   onTap: () {
      Navigator.pop(context);
       Criteria myData = Provider.of<Criteria>(context, listen: false);
      myData.setSelectedFilter("Customer name");
    
  },      
            
            child:Container(
              child: const Text(
                "Customer name",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),),
             GestureDetector( 
                onTap: () {
                  Navigator.pop(context);
      Criteria myData = Provider.of<Criteria>(context, listen: false);
     myData.setSelectedFilter("Tailor name");
 
  }, 
            child: Container(
              child: const Text(
                "Tailor name",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),),
              GestureDetector(
              onTap: () {
               Navigator.pop(context);
      Criteria myData = Provider.of<Criteria>(context, listen: false);
     myData.setSelectedFilter("Store name");
  }, 
          child: Container(
              child: const Text(
                "Store name",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),),
            Container(
              child: Row(
                children: [
                  const Text(
                    "Custom 1",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size * 0.4),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xffA74A45),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xffA74A45),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CustomFilterCreationPage();
                }));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: size * 0.67,
                height: sizee * 0.08,
                decoration: const BoxDecoration(
                  color: Color(0xffA74A45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Create Custom filter",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/**import 'package:flutter/material.dart';

class DynamicFieldsPage extends StatefulWidget {
  @override
  _DynamicFieldsPageState createState() => _DynamicFieldsPageState();
}

class _DynamicFieldsPageState extends State<DynamicFieldsPage> {
  List<String> fields = [];

  void addField() {
    setState(() {
      fields.add('Field ${fields.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Fields'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                final field = fields[index];
                return ListTile(
                  title: Text(field),
                );
              },
            ),
          ),
          RaisedButton(
            onPressed: addField,
            child: Text('Add Field'),
          ),
        ],
      ),
    );
  }
}
 */