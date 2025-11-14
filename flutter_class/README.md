# Task Notes Manager

## Student Information
- **Name**: Asasira Arthur
- **Registration Number**: 23/U/06534/PS

## Project Description
A Flutter application for managing tasks and notes with persistent local storage. Users can create, view, and manage their tasks with priority levels. The app supports dark mode and stores data locally using SQLite database.

## Features
- Create and manage tasks with title, description, and priority levels
- Mark tasks as completed
- Dark mode toggle with persistent theme preference
- Local data persistence using SQLite (SQFLITE)
- JSON serialization for data models
- Responsive UI with Material Design

## Getting Started

### Prerequisites
- Flutter SDK (version 3.9.2 or higher)
- Dart SDK (comes with Flutter)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ArthurKagwa/AsasiraArtur_Mobile.git
cd AsasiraArtur_Mobile/flutter_class
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

### Building for Release
```bash
flutter build apk        # For Android
flutter build ios        # For iOS
flutter build web        # For Web
```

## Project Structure
```
lib/
├── main.dart                 # App entry point with theme management
├── screens/
│   ├── home_screen.dart      # Home screen with task list
│   └── add_task_screen.dart  # Form screen to add new tasks
├── models/
│   └── task_item.dart        # TaskItem data model with JSON serialization
└── data/
    └── database_helper.dart  # SQLite database helper class
```

## Technologies Used
- **Framework**: Flutter
- **Language**: Dart
- **Database**: SQLite (sqflite)
- **State Management**: StatefulWidget
- **Data Persistence**: SharedPreferences & SQLite

## Dependencies
- `sqflite: ^2.2.8` - SQLite plugin
- `path_provider: ^2.0.14` - Path utilities
- `path: ^1.8.3` - Path manipulation
- `shared_preferences: ^2.2.0` - Persistent user preferences

## Assignment Requirements Completed
- Project setup with Git & GitHub (meaningful commit history)
- User Interface with two screens and dynamic lists
- Data modeling with TaskItem class and JSON serialization
- Data persistence with SharedPreferences (theme toggle)
- Local database with SQFLITE (create, read, delete operations)
- Integration of database with UI for dynamic task management

## Git Commit History
The project demonstrates a meaningful commit history with incremental development steps:
- Initial project setup
- Project structure creation
- TaskItem model and database helper implementation
- HomeScreen implementation
- AddTaskScreen implementation with database integration

## License
This project is submitted as part of BSE 3106: Flutter Assignment 3 for Makerere University.

