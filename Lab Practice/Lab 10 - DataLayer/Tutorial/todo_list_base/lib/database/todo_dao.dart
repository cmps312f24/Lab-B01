import 'package:floor/floor.dart';
import 'package:todo_list_base/model/todo.dart';

// Todo : add the TodoDao class
@dao
abstract class TodoDao {
  @Query("SELECT * FROM todos WHERE pid = :pid")
  Stream<List<Todo>> observeTodos(int pid);

  @Query("SELECT * FROM todos WHERE id = :id")
  Future<Todo?> findTodoById(int id);

  @Insert(
    onConflict: OnConflictStrategy.replace,
  )
  Future<void> insertTodo(Todo todo);

  @update
  Future<void> updateTodo(Todo todo);

  @delete
  Future<void> deleteTodo(Todo todo);
}
