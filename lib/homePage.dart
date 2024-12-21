import 'package:bloc_cubit_todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/todo_cubit_state.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                context.read<TodoCubit>().AddToDo(_controller.text);
                _controller.text='';
              },
              child: Text('Add ToDo'),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoInitial>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(state.todos[index])),
                              IconButton(
                                onPressed: () {
                                  context.read<TodoCubit>().DeleteToDo(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
