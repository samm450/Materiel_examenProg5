import 'package:flutter/material.dart';
import 'main.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
                height: 200,
              width: double.infinity,
              color: Colors.deepOrange,
              child: Center(child: Text("C'est reussi!!", style: TextStyle(fontSize: 20, color: Colors.white),))
            ),
          ),
          FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
          },
            child: Text("revenir a l'acceuil"),
          ),
        ],
      )
    );
  }
}

