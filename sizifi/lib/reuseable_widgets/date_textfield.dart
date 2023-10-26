// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DateTimePickerTextField extends StatefulWidget {
//   final String label;
//   TextEditingController? textController;

//   DateTimePickerTextField({Key? key, required this.label, this.textController})
//       : super(key: key);

//   @override
//   _DateTimePickerTextFieldState createState() =>
//       _DateTimePickerTextFieldState();
// }

// class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().toLocal(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         await _selectDate();
//         await _selectTime();

//         widget.textController = TextEditingController(
//             text: selectedDate != null && selectedTime != null
//                 ? '${DateFormat.yMd().format(selectedDate!)} ${selectedTime!.format(context)}'
//                 : '');
//       },
//       child: TextFormField(
//         decoration:
//             InputDecoration(labelText: widget.label, border: InputBorder.none),
//         controller: widget.textController,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerTextField extends StatefulWidget {
  final String label;
  TextEditingController? textController;

  DateTimePickerTextField({Key? key, required this.label, this.textController})
      : super(key: key);

  @override
  _DateTimePickerTextFieldState createState() =>
      _DateTimePickerTextFieldState();
}

class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    if (widget.textController != null) {
      final dateTime = widget.textController!.text;
      // if (dateTime.isNotEmpty) {
      //   final dateTimeParts = dateTime.split(' ');
      //   if (dateTimeParts.length == 2) {
      //     selectedDate = DateTime.tryParse(dateTimeParts[0]);
      //     selectedTime = TimeOfDay.tryParse(dateTimeParts[1]);
      //   }
      // }
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().toLocal(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _updateTextController();
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      _updateTextController();
    }
  }

  void _updateTextController() {
    if (widget.textController != null) {
      if (selectedDate != null && selectedTime != null) {
        // final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
        // final formattedTime = selectedTime!.format(context);
        // final formattedDateTime = '$formattedDate $formattedTime';
        // widget.textController!.text = formattedDateTime;
        // widget.textController!.text =
        //     // '${DateFormat.yMd().format(selectedDate!)} ${selectedTime!.format(context)}';
        //     "$selectedDate ${selectedTime!.format(context)}";
        // // '${selectedDate!.toString().split(' ')[0]} ${selectedTime!.format(context)}';
        widget.textController!.text =
            // "${selectedDate!.add(Duration(hours: selectedTime!.hour, minutes: selectedTime!.minute))}";
            '${DateFormat.yMd().format(selectedDate!)} ${selectedTime!.format(context)}';
      } else {
        widget.textController!.text = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        border: InputBorder.none,
      ),
      controller: widget.textController,
      readOnly: true,
      onTap: () async {
        await _selectDate();
        await _selectTime();
      },
    );
  }
}
