import 'package:todo_list_base/database/project_dao.dart';
import 'package:todo_list_base/database/todo_dao.dart';
import 'package:todo_list_base/model/project.dart';
import 'package:todo_list_base/model/project_todo_status_counts.dart';
import 'package:todo_list_base/model/todo.dart';

class TodoListRepo {
  final ProjectDao projectDao;
  final TodoDao todoDao;

  TodoListRepo({required this.projectDao, required this.todoDao});

  // Create the Repo methods

  Stream<List<Project>> observeProjects() => projectDao.observeProjects();

  Future<Project?> findProjectById(int id) => projectDao.findProjectById(id);

  Future<void> insertProject(Project project) {
    //call the network
    //get the data
    //insert the data to database

    return projectDao.insertProject(project);
  }

  Future<void> updateProject(Project project) =>
      projectDao.updateProject(project);

  Future<void> deleteProject(Project project) =>
      projectDao.deleteProject(project);

  Stream<List<Todo>> observeTodos(int pid) => todoDao.observeTodos(pid);

  Future<Todo?> findTodoById(int id) => todoDao.findTodoById(id);

  Future<void> insertTodo(Todo todo) => todoDao.insertTodo(todo);

  Future<void> updateTodo(Todo todo) => todoDao.updateTodo(todo);

  Future<void> deleteTodo(Todo todo) => todoDao.deleteTodo(todo);
}
