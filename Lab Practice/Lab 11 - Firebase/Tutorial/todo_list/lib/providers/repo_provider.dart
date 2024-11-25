import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/repo/todo_repo.dart';

final todoListRepoProvider = FutureProvider<TodoListRepo>((ref) async {
  final db = FirebaseFirestore.instance;
  final projectRef = db.collection('projects');
  final todoRef = db.collection('todos');

  return TodoListRepo(projectRef: projectRef, todoRef: todoRef);
});

final selectedProjectIdProvider = StateProvider<String?>((ref) => null);


// how do you assign a value to the selectedProjectProvider?

// you do it by calling the .state property of the provider and assigning a value to it
// selectedProjectProvider.state = "THE ID OF THE PROJECT YOU WANT TO SELECT";