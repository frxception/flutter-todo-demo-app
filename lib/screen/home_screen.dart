import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shin_todo/model/todo_model.dart';
import 'package:shin_todo/provider/todo_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Todo Apps"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (context) => TodoProvider(),
          ),
        ],
        child: SingleChildScrollView(
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: TextField(
                    controller: namecontroller,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "What Are You Doing",
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                    // padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      if (namecontroller.text.isNotEmpty) {
                        todoProvider.addTodo(
                          TodoModel(name: namecontroller.text),
                        );
                        namecontroller.text = "";
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.blue,
                    child: Icon(Icons.send, color: Colors.white,),
                    ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TodoItems(),
        ],
      ),
    );
  }
}

class TodoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProv, child) {
      return Container(
        // height: 40,
        child: ListView.builder(
            itemCount: todoProv.getTodo.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              return Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(todoProv.getTodo[index].name,
                        style: TextStyle(fontSize: 20, color: Colors.black87)),
                    InkWell(
                      onTap: () {
                        todoProv.removeTodo(index);
                      },
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.blue,
                        size: 30,
                      ),
                    )
                  ],
                ),
              );
            }),
      );
    });
  }
}
