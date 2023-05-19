enum FilterByTasks {
  all,
  pending,
  done;

  String get name {
    switch (this) {
      case FilterByTasks.all:
        return 'Todos';
      case FilterByTasks.pending:
        return 'Pendentes';
      case FilterByTasks.done:
        return 'Feitos';
      default:
        return '';
    }
  }
}
