// This will be the time settings

import 'package:flutter/material.dart';

void main {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: const Text('Time'),
                margin: const EdgeInsets.all(100)
                
            )
        )
    );
  }
}