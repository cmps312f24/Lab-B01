import 'package:floor/floor.dart';
//use sum if

// Todo : add the @Databaseview annotation
@DatabaseView('''
  SELECT
    p.id as id,
    IFNULL(SUM(CASE WHEN t.status = 'Pending' THEN 1 ELSE 0 END), 0) as pendingCount,
    IFNULL(SUM(CASE WHEN t.status = 'Completed' THEN 1 ELSE 0 END), 0) as completedCount
  FROM projects p
  LEFT JOIN todos t ON p.id = t.pid
  GROUP BY p.id
''', viewName: 'ProjectTodoStatusCounts')
@DatabaseView('''

''')
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
