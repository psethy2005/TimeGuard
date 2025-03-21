//This will be the time settings
import 'package:flutter/material.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {

  ListDisplay listDisplay = ListDisplay();

  void _addNewApp() {
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
                        progress: 0
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
          backgroundColor: Colors.deepPurple[200],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewApp, //Add new app when pressed
          backgroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        body: ListView.separated(
          itemCount: listDisplay.items.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: ListTile(
                title: Text(listDisplay.items[index].title),
                subtitle: LinearProgressIndicator(
                  value: listDisplay.items[index].progress,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  backgroundColor: Colors.grey,
                ),
                tileColor: Colors.white,
                onTap: () {
                  //Navigate to an different page for each app
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(item: listDisplay.items[index]),
                    )
                  );
                },
              )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 5)
          )
        ),
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
  final double progress;

  ListItem({required this.icon, required this.title, required this.subtitle, this.progress = 0.0});
}

class ListDisplay extends ChangeNotifier {
  final List<ListItem> _items = [
    ListItem(icon: Icons.phone, title: "Call", subtitle: '0.5', progress: 0.7),
    ListItem(icon: Icons.email, title: "Email", subtitle: "Send an email", progress: 0.5),
    ListItem(icon: Icons.map, title: "Maps", subtitle: "Open maps", progress: 0.3),
  ];

  List<ListItem> get items => _items;

  void addItem(ListItem newItem) {
    _items.add(newItem);
  }
}