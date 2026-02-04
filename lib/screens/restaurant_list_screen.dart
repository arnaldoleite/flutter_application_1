import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import 'restaurant_create_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurantes')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const RestaurantCreateScreen(),
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            //.orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar restaurantes'));
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text('Nenhum restaurante encontrado'));
          }

          final restaurants =
              docs.map((d) => Restaurant.fromDocumentSnapshot(d)).toList();

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final r = restaurants[index];
              return ListTile(
                title: Text(r.name),
                subtitle: Text(r.fullname),
                leading: const Icon(Icons.restaurant),
              );
            },
          );
        },
      ),
    );
  }
}
