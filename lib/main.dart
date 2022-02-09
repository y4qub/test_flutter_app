import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product Catalog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    'Galaxy S21',
    'Galaxy S20 Ultra',
    'Galaxy Note 10',
    'iPhone 13',
    'iPhone 13 Pro Max',
    'iPhone 13 Pro',
    'Huawei Mate 8'
  ];

  @override
  Widget build(BuildContext context) {
    Random rnd = Random();
    List<int> usedColors = [];
    int colorIndex;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: GridView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              colorIndex = rnd.nextInt(Colors.accents.length);
              while (usedColors.contains(colorIndex)) {
                colorIndex = rnd.nextInt(Colors.accents.length);
              }
              usedColors.add(colorIndex);
              return Container(
                color: Colors.accents[colorIndex],
                alignment: Alignment.center,
                child: Text(list[index]),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
            ),
          ),
        ));
  }
}
