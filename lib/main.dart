import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo List App'),
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
  final TextEditingController _todoController = TextEditingController();
  // final TextEditingController _descriptionController = TextEditingController();

  final List<String> _todoList = [
    "Get Milk",
    "Get Bread",
    "Get Eggs",
    "Get Sleep"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                      labelText: "Todo", border: OutlineInputBorder())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _todoList.add(_todoController.text);
                  });
                },
                child: const Text("Add Todo")),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                    title: Text(_todoList[index]),
                    subtitle: Text('Item #$index'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _todoList.removeAt(index);
                        });
                      },
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
