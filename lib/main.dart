import 'package:flutter/material.dart';
import 'package:flutter_test1/stat_tab.dart';
import 'package:flutter_test1/time_control.dart';
import 'package:flutter_test1/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimeGuard',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget{
  const NavBar ({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  
  final List<Widget> pages = [
    const StatContent(),
    const TimeControl(),
    const SettingsContent(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.align_vertical_bottom,
              ),
            label: 'Stats'
            ),
            BottomNavigationBarItem(
            icon: Icon(
              Icons.add_task_rounded,
              ),
            label: 'Controls'
            ),
              BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              ),
            label: 'Settings'
            ),
          ]
        )
      );
  }
}