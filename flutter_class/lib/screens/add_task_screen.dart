import 'package:flutter/material.dart';
import 'package:flutter_class/data/database_helper.dart';
import 'package:flutter_class/models/task_item.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _priority = 1;
  bool _isCompleted = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final task = TaskItem(
      title: _titleController.text.trim(),
      priority: _priority,
      description: _descriptionController.text.trim(),
      isCompleted: _isCompleted,
    );

    await DatabaseHelper().insertTask(task);
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter a title' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: _priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: [1, 2, 3]
                    .map((p) => DropdownMenuItem(value: p, child: Text('Priority $p')))
                    .toList(),
                onChanged: (v) => setState(() => _priority = v ?? 1),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                value: _isCompleted,
                onChanged: (v) => setState(() => _isCompleted = v ?? false),
                title: const Text('Completed'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
