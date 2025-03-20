// This file will be responsible for settings tab on the app. Informations such as privacy, QnA, and so on will be listed.

import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
 Widget build(BuildContext context) {
      return 
      MaterialApp(
        title: 'Settings',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Container(
            margin: const EdgeInsets.all(100),
            child: const Text('stop procrastinating and insert a settings here')
          ),
          backgroundColor: Colors.lightBlue[100],
        )
      );     
 } 
}