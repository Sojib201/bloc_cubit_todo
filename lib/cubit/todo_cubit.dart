import 'package:bloc_cubit_todo/cubit/todo_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDo {
  static List<String> data = ['aghdf', 'asfiasjfg', 'sfhas', 'Any'];
}

class TodoCubit extends Cubit<TodoInitial> {
  TodoCubit() : super(TodoInitial(todos: ToDo.data));

  AddToDo(String todo) {
    final todoList = state.todos;
    todoList.add(todo);
    emit(TodoInitial(todos: todoList));
  }

  DeleteToDo(int index){
    final todoList=state.todos;
    todoList.removeAt(index);
    emit(TodoInitial(todos: todoList));
  }
}
