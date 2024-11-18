import 'package:floor/floor.dart';
import 'package:todo_list_base/model/project.dart';
import 'package:todo_list_base/model/project_todo_status_counts.dart';

// Todo : add the ProjectDao class
abstract class ProjectDao {
  @Query("SELECT * FROM projects")
  Stream<List<Project>> observeProjects();

  @Query("SELECT * FROM projects WHERE id = :id")
  Future<Project?> findProjectById(int id);

  @Insert(
    onConflict: OnConflictStrategy.replace,
  )
  Future<void> insertProject(Project project);

  @update
  Future<void> updateProject(Project project);

  @delete
  Future<void> deleteProject(Project project);

  @Query('SELECT * FROM projects WHERE id = :pid')
  Stream<ProjectTodoStatusCounts> observeProjectTodoStatusCounts(int pid);
}
