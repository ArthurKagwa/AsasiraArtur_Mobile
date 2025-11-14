class TaskItem {
  final int? id;
  final String title;
  final int priority;
  final String description;
  final bool isCompleted;

  TaskItem({
    this.id,
    required this.title,
    required this.priority,
    required this.description,
    this.isCompleted = false,
  });

  TaskItem copyWith({
    int? id,
    String? title,
    int? priority,
    String? description,
    bool? isCompleted,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'] is int ? json['id'] as int : (json['id'] as int?),
      title: json['title'] as String? ?? '',
      priority: json['priority'] is int ? json['priority'] as int : int.parse((json['priority'] ?? '0').toString()),
      description: json['description'] as String? ?? '',
      isCompleted: (json['isCompleted'] == 1 || json['isCompleted'] == true),
    );
  }
}
