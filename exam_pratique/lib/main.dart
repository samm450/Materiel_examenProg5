import 'package:flutter/material.dart';

import 'details.dart';
import 'animaux.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
              DrawerHeader(decoration : BoxDecoration(color: Colors.blue),
              child: SizedBox(
                height: 50,
                width: 200,
                child: Text(
                "Mon Super tiroir bleu \n Samuel Coache \n 6250874", textAlign: TextAlign.center,),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Details'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Details()));
              },

            ),
            ListTile(
              title: Text('animaux'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Animaux()));
              },

            ),
          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text("bleu 1/3",
                        style :  TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("rouge 2/3",
                        style :  TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text("vert",
                  style :  TextStyle(color: Colors.white),),
              ),
            ),
          ),

          Expanded(
            child :  Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              color: Colors.yellow,
              child: const Center(
                child: Text("jaune",
                  style :  TextStyle(color: Colors.black),),
              ),
            ),
            ),
          ),
          Expanded(
            child: Container(
            color: Colors.orange,
              child: Row(
                children: [
                  Expanded(
                      flex : 1,
                      child: Container(
                        color: Colors.orange,
                        child: const Center(
                          child: Text("orange 1/4",
                            style :  TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      )
                  ),
                  Expanded(
                    flex: 1,
                      child: Container(
                        color: Colors.pink,
                        child: const Center(
                          child: Text("Rose 1/4",
                            style :  TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
                ],

              ),
           ),
          )
        ],
      ),
    );
  }
}
