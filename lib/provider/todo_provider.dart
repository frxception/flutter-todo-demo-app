
import 'package:flutter/material.dart';
import 'package:shin_todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  //List
  List<TodoModel> todoList = new List<TodoModel>();
  // getter
  List<TodoModel> get getTodo => todoList;

  Future<void> addTodo(TodoModel todo) {
    todoList.add(todo);
    notifyListeners();
  }

  Future<void> removeTodo(int index){
    todoList.removeAt(index);
    notifyListeners();
  }

}