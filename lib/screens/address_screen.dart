import 'package:flutter/material.dart';
import '../models/base.dart';

class AddressScreen extends StatefulWidget {
  final Address address;
  const AddressScreen({super.key, required this.address});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late Map<String, dynamic> editableValues;

  @override
  void initState() {
    super.initState();
    editableValues = widget.address.toMap();
  }

  @override
  Widget build(BuildContext context) {
    final properties = editableValues.keys
        .map((key) => Address.getCustomProperty(key))
        .where((prop) => prop.visible)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Endereço")),
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
