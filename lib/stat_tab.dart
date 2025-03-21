//For the statistics page

import 'package:flutter/material.dart';


class StatContent extends StatelessWidget {
  const StatContent({super.key});

  @override
  Widget build(BuildContext context) {
      return 
      MaterialApp(
        title: 'Statistics',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Statistics'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Container(
            margin: const EdgeInsets.all(100),
            child: const Text('stop procrastinating and insert a graph here')
          ),
          backgroundColor: Colors.lightBlue[100],
        )
      );
  }
}