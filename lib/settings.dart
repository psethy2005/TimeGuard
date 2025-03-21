// This file will be responsible for settings tab on the app. Informations such as privacy, QnA, and so on will be listed.

import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  void _navigateToOption(BuildContext context, String option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsOptionScreen(option: option),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Account'),
          _buildOptionTile(context, 'Notifications', Icons.notifications),
          _buildOptionTile(context, 'Privacy', Icons.account_circle),
          _buildOptionTile(context, 'Color Mode', Icons.invert_colors),

          const Divider(),

          _buildSectionTitle('More'),
          _buildOptionTile(context, 'F&Q', Icons.info),
          _buildOptionTile(context, 'Support', Icons.help),
          _buildOptionTile(context, 'Feedback', Icons.feedback),
          _buildOptionTile(context, 'Rate Us!', Icons.verified),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, String option, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(option),
      onTap: () => _navigateToOption(context, option),
    );;
  }
}

class SettingsOptionScreen extends StatelessWidget {
  final String option;
  const SettingsOptionScreen({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(option),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text('Settings for $option', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

