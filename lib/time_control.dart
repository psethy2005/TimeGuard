import 'package:flutter/material.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {

  ListDisplay listDisplay = ListDisplay();

  void _AddNewApp() {
    //Show dialog to enter app details
    showDialog(
      context: context, 
      builder: (context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController subtitleController = TextEditingController();

        return AlertDialog(
          title: const Text('Add New App'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'title'),
              ),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(labelText: "Subtitle"),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); //Close dialog
              }, 
              child: const Text('Cancel')
            ),
            TextButton(onPressed: () {
              if (titleController.text.isNotEmpty &&
                    subtitleController.text.isNotEmpty) {
                  setState(() {
                    listDisplay.addItem(
                      ListItem(
                        icon: Icons.star, // Default icon
                        title: titleController.text,
                        subtitle: subtitleController.text,
                      ),
                    );
                  });
                  Navigator.pop(context); // Close dialog
                }
            }, child: const Text('Add'))
          ],
        );
      }
    );
  }

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
        floatingActionButton: FloatingActionButton(
          onPressed: _AddNewApp, //Add new app when pressed
          child: const Icon(Icons.add),
          backgroundColor: Colors.white,
        ),
        body: ListView.separated(
          itemCount: listDisplay.items.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
                  title: Text(listDisplay.items[index].title),
                  tileColor: Colors.blueGrey,
                  onTap: () {
                    //Navigate to an different page for each app
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(item: listDisplay.items[index]),
                      )
                    );
                  },
                );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.white
          ),
        )
      )
    );
  }
}

class DetailPage extends StatelessWidget {
  final ListItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(item.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(item.subtitle, style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  final IconData icon;
  final String title;
  final String subtitle;

  ListItem({required this.icon, required this.title, required this.subtitle});
}

class ListDisplay extends ChangeNotifier {
  final List<ListItem> _items = [
    ListItem(icon: Icons.phone, title: "Call", subtitle: "Make a phone call"),
    ListItem(icon: Icons.email, title: "Email", subtitle: "Send an email"),
    ListItem(icon: Icons.map, title: "Maps", subtitle: "Open maps"),
  ];

  List<ListItem> get items => _items;

  void addItem(ListItem newItem) {
    _items.add(newItem);
  }
}