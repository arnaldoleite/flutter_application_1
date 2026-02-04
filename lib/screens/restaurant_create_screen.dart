import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import '../models/dailyfood.dart';
import '../models/base.dart';

class RestaurantCreateScreen extends StatefulWidget {
  const RestaurantCreateScreen({super.key});

  @override
  State<RestaurantCreateScreen> createState() =>
      _RestaurantCreateScreenState();
}

class _RestaurantCreateScreenState extends State<RestaurantCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  bool _loading = false;

  final _restaurantFields = [
    'name',
    'fullname',
    'cellnumber',
    'logoimageurl',
    'backgroundimageurl',
    'closedmessage',
  ];

  @override
  void initState() {
    super.initState();
    for (final f in _restaurantFields) {
      _controllers[f] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _buildField(String property) {
    final meta = Restaurant.getCustomProperty(property);

    if (!meta.visible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controllers[property],
        keyboardType: meta.typeofInput,
        maxLength: meta.maxLength > 0 ? meta.maxLength : null,
        decoration: InputDecoration(
          labelText: meta.nameToDisplay,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (!meta.readOnly && (value == null || value.isEmpty)) {
            return 'Campo obrigatório';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _saveRestaurant() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => _loading = true);

  try {
    final restaurant = Restaurant(
      id: '',
      creatorId: 'demo-user',
      postedAt: DateTime.now(),
      name: _controllers['name']!.text,
      fullname: _controllers['fullname']!.text,
      cellnumber: _controllers['cellnumber']!.text,
      logoimageurl: _controllers['logoimageurl']!.text,
      backgroundimageurl: _controllers['backgroundimageurl']!.text,
      closedmessage: _controllers['closedmessage']!.text,
      address: Address.empty(),
      dailyfood: DailyFood.empty(),
    );

    await FirebaseFirestore.instance
        .collection('restaurants')
        .add(restaurant.toMap());

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Restaurante criado com sucesso'),
        backgroundColor: Colors.green,
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    Navigator.pop(context, restaurant);
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Erro ao gravar restaurante: $e'),
        backgroundColor: Colors.red,
      ),
    );
  } finally {
    if (mounted) {
      setState(() => _loading = false);
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('➕ Criar Restaurante')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ..._restaurantFields.map(_buildField),
              const SizedBox(height: 24),
              _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text('Guardar no Firebase'),
                      onPressed: _saveRestaurant,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
