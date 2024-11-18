import 'package:floor/floor.dart';
//use sum if

// Todo : add the @Databaseview annotation
@DatabaseView(
  '''
    
  
  '''
)
class ProjectTodoStatusCounts {
  @primaryKey
  final int id;
  final int pendingCount;
  final int completedCount;

  ProjectTodoStatusCounts({
    required this.id,
    required this.pendingCount,
    required this.completedCount,
  });
}
