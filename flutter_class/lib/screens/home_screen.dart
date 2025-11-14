import 'package:flutter/material.dart';
import 'package:flutter_class/data/database_helper.dart';
import 'package:flutter_class/models/task_item.dart';
import 'package:flutter_class/screens/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({Key? key, required this.isDark, required this.onThemeChanged}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TaskItem>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    _tasksFuture = DatabaseHelper().getAllTasks();
  }

  Future<void> _refresh() async {
    setState(() {
      _loadTasks();
    });
    await _tasksFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks & Notes'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark theme'),
            value: widget.isDark,
            onChanged: (v) => widget.onThemeChanged(v),
          ),
          Expanded(
            child: FutureBuilder<List<TaskItem>>(
              future: _tasksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final tasks = snapshot.data ?? [];
                if (tasks.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [SizedBox(height: 200), Center(child: Text('No tasks yet.'))],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final t = tasks[index];
                      return ListTile(
                        title: Text(t.title),
                        subtitle: Text('Priority: ${t.priority}\n${t.description}'),
                        isThreeLine: t.description.isNotEmpty,
                        trailing: Icon(
                          t.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                          color: t.isCompleted ? Colors.green : null,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final created = await Navigator.of(context).push<bool>(
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          if (created == true) {
            _refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
