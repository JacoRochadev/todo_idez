class Task {
  final int? id;
  final String title;
  final bool checked;

  Task({
    this.id,
    required this.title,
    required this.checked,
  });

  Task.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int?,
        title = map['title'] as String,
        checked = map['checked'] as bool;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'checked': checked,
    };
  }

  copyWith({
    int? id,
    String? title,
    bool? checked,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      checked: checked ?? this.checked,
    );
  }
}
