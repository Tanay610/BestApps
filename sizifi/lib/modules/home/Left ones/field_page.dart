import 'package:flutter/material.dart';

class DynamicFields extends StatefulWidget {
  const DynamicFields({super.key});

  @override
  _DynamicFieldsState createState() => _DynamicFieldsState();
}

class _DynamicFieldsState extends State<DynamicFields> {
  List<Field> fields = [];

  void addField() {
    setState(() {
      fields.add(Field());
    });
  }

  void deleteField(int index) {
    setState(() {
      fields.removeAt(index);
    });
  }

  void showAddTextDialog(int index) {
    String newText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Text'),
          content: TextField(
            onChanged: (value) {
              newText = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fields[index].addText(newText);
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void navigateToChipsPage(List<String> chips) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChipsPage(chips: chips),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Fields'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                final field = fields[index];
                return ListTile(
                  title: Row(
                    children: [
                      DropdownButton<String>(
                        value: field.selectedOption,
                        items: ['Option 1', 'Option 2', 'Option 3'].map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            field.selectedOption = value.toString();
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          navigateToChipsPage(field.texts);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          width: field.isExpanded ? MediaQuery.of(context).size.width : 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: field.texts.length,
                            itemBuilder: (context, textIndex) {
                              final text = field.texts[textIndex];
                              return Chip(
                                label: Text(text),
                                deleteIcon: const Icon(Icons.close),
                                onDeleted: () {
                                  setState(() {
                                    field.removeText(textIndex);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          showAddTextDialog(index);
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteField(index);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: addField,
            child: const Text('Add Field'),
          ),
        ],
      ),
    );
  }
}

class Field {
  String? selectedOption;
  List<String> texts = [];
  bool isExpanded = false;

  void addText(String text) {
    texts.add(text);
  }

  void removeText(int index) {
    texts.removeAt(index);
  }
}

class ChipsPage extends StatelessWidget {
  final List<String> chips;

  const ChipsPage({super.key, required this.chips});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chips Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Handle search
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chips.length,
              itemBuilder: (context, index) {
                final chip = chips[index];
                return ListTile(
                  title: Text(chip),
                  onTap: () {
                    // Handle chip tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
