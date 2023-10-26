import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({super.key, required this.text});

  final String text;

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firsthalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 300) {
      firsthalf = widget.text.substring(0, 300);
      secondHalf = widget.text.substring(300, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? Text(
                '${flag ? (firsthalf) : (firsthalf + secondHalf)}'
                    .replaceAll(r'\n', '\n')
                    .replaceAll(r'\n', '')
                    .replaceAll(r"\'", "'"),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              )
            : Column(
                children: [
                  Text(
                    '${flag ? (firsthalf + '...') : (firsthalf + secondHalf)}'
                        .replaceAll(r'\n', '\n\n')
                        .replaceAll(r'\n', '')
                        .replaceAll(r"\'", "'"),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          flag? 'show more ':'show less',
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }
}
