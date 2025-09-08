import 'package:flutter/material.dart';
import 'add_list.dart';

class AddTodos extends StatefulWidget {
  const AddTodos({super.key});

  @override
  State<AddTodos> createState() => _AddTodosState();
}

class _AddTodosState extends State<AddTodos> {
  List<String> todos = [];

  void addTodo(String task) {
    setState(() {
      todos.add(task);
    });
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void gotoAdd() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddList()),
    );

    if (result != null) {
      addTodo(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your ToDo List', style: TextStyle(color: Colors.white),), backgroundColor: Color(0xFF50586C),),
      body: Container(
        color: Color(0xFFDCE2F0),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Color(0xFFD1C4E9)
                )
              ),
              child: ListTile(
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteTodo(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF50586C),
        foregroundColor: Colors.white,
        onPressed: gotoAdd,
        child: Icon(Icons.add),
      ),
    );
  }
}
