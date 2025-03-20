// This will be the time settings

import 'package:flutter/material.dart';

class TimeControl extends StatelessWidget {
  const TimeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Controls',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Controls'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Container(
            margin: const EdgeInsets.all(100),
            child: const Text('Time')
                
          ),
          backgroundColor: Colors.lightBlue[100],
        )
    );
  }
}