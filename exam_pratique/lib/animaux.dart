import 'package:flutter/material.dart';
import 'animal.dart';
import 'service.dart';

class Animaux extends StatefulWidget {
  const Animaux({super.key});

  @override
  State<Animaux> createState() => _AnimauxState();
}

class _AnimauxState extends State<Animaux> {
  List<Animal> animals = [];
  final TextEditingController ContinentController = TextEditingController();
  final TextEditingController FamilleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAnimal();
  }

  getAnimal() async {
    animals = await ZooService.getAnimal(ContinentController.text, FamilleController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaux'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: ContinentController,
              decoration: const InputDecoration(
                labelText: 'Continent',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: FamilleController,
              decoration: const InputDecoration(
                labelText: 'Famille',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              getAnimal();
            },
            child: Text("search"),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemExtent: 110,
              itemCount: animals.length,
              itemBuilder: (context, index) {
                final animal = animals[index];
                return ListTile(
                  title: Text(
                    animal.nom,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        animal.famille,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
