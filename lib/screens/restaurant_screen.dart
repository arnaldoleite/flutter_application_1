import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import 'address_screen.dart';
import 'dailyfood_screen.dart';

class RestaurantScreenFromFirebase extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreenFromFirebase({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (restaurant.logoimageurl.isNotEmpty)
              Center(
                child: Image.network(restaurant.logoimageurl, height: 100),
              ),
            const SizedBox(height: 20),
            Text(
              restaurant.fullname,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            _infoTile("Telefone", restaurant.cellnumber),
            _infoTile("Reserva", restaurant.makereservation ? "Sim" : "Não"),
            const Divider(height: 30),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.location_on),
                    label: const Text("Editar Endereço"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddressScreen(
                            key: ValueKey(restaurant.id),
                            address: restaurant.address,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.restaurant_menu),
                    label: const Text("Editar Pratos do Dia"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DailyFoodScreen(
                            key: ValueKey(restaurant.id),
                            dailyFood: restaurant.dailyfood,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Flexible(child: Text(value)),
        ],
      ),
    );
  }
}
