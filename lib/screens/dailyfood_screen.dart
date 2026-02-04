import 'package:flutter/material.dart';
import '../models/dailyfood.dart';

class DailyFoodScreen extends StatefulWidget {
  final DailyFood dailyFood;
  const DailyFoodScreen({super.key, required this.dailyFood});

  @override
  State<DailyFoodScreen> createState() => _DailyFoodScreenState();
}

class _DailyFoodScreenState extends State<DailyFoodScreen> {
  late Map<String, dynamic> editableValues;

  @override
  void initState() {
    super.initState();
    editableValues = widget.dailyFood.toMap();
  }

  @override
  Widget build(BuildContext context) {
    final properties = editableValues.keys
        .map((key) => DailyFood.getCustomProperty(key))
        .where((prop) => prop.visible)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Pratos do Dia")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final prop = properties[index];
          final fieldName = editableValues.keys.elementAt(index);
          final controller = TextEditingController(
            text: editableValues[fieldName].toString(),
          );

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextField(
              controller: controller,
              readOnly: prop.readOnly,
              keyboardType: prop.typeofInput,
              maxLength: prop.maxLength > 0 ? prop.maxLength : null,
              decoration: InputDecoration(
                labelText: prop.nameToDisplay,
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  editableValues[fieldName] = value;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Alterações guardadas em memória ✅")),
          );
          Navigator.pop(context);
        },
        label: const Text("Guardar"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
