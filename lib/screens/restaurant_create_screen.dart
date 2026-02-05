import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import '../models/dailyfood.dart';
import '../models/base.dart';
import '../l10n/app_localizations.dart';

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
          labelText: localizeProperty(context, meta.nameToDisplayKey) ,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (!meta.readOnly && (value == null || value.isEmpty)) {
            return AppLocalizations.of(context)!.fieldRequired;
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
      SnackBar(
        content: Text('✅ ${AppLocalizations.of(context)!.restaurantCreateSuccess}'),
        backgroundColor: Colors.green,
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    Navigator.pop(context, restaurant);
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ ${AppLocalizations.of(context)!.restaurantCreateError}: $e'),
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
      appBar: AppBar(title:  Text('➕ ${AppLocalizations.of(context)!.restaurantCreateTitle}')),
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
                      label: Text(AppLocalizations.of(context)!.restaurantCreateTitle),
                      onPressed: _saveRestaurant,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
String localizeProperty(
  BuildContext context,
  String key,
) {
  final l10n = AppLocalizations.of(context)!;

  switch (key) {
    case 'restaurantCreatorId':
      return l10n.restaurantCreatorId;
    case 'restaurantPostedAt':
      return l10n.restaurantPostedAt;
    case 'restaurantName':
      return l10n.restaurantName;
    case 'restaurantFullName':
      return l10n.restaurantFullName;
    case 'restaurantCellNumber':
      return l10n.restaurantCellNumber;
    case 'restaurantLogoImageURL':
      return l10n.restaurantLogoImageURL;
    case 'restaurantBackgroundImageURL':
      return l10n.restaurantBackgroundImageURL;
    case 'restaurantMakeReservation':
      return l10n.restaurantMakeReservation;
    case 'restaurantClosed':
      return l10n.restaurantClosed;
    case 'restaurantClosedMessage':
      return l10n.restaurantClosedMessage;
    case 'restaurantAddress':
      return l10n.restaurantAddress;
    case 'restaurantDailyFood':
      return l10n.restaurantDailyFood;

    default:
      return key;
  }
}

