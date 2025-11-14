BSE 3106: Flutter Assignment 3 : 
Submit by 14th Nov, 2025
Via MUELE


Assignment 1
Submission Instructions
Ensure your final code is pushed to your public GitHub repository.
The repository must include:
A complete Flutter project source code.
A README.md file with:
Your Name and Student Number and Reg. No.
A brief description of the app.
Instructions on how to run the project (e.g., flutter pub get).
A meaningful Git commit history.
Your repo must be public
Submit the URL to your GitHub repository via the provided Google Form by the deadline: 4th October 2025.
Google From URL: https://forms.gle/jsBbbyHarUibNqqC6 
Marks (10)
Task 1: Project Setup with Git & GitHub (2 Marks)
Create a new Flutter project named task_notes_manager.
Initialize a Git repository within your project folder.
Create a public repository on GitHub named flutter-task-notes-app.
Link your local repository to the remote GitHub repository and push the initial code.
Your commit history should reflect your development process (e.g., "initial setup", "added form screen", "integrated sqflite"). A single, massive final commit will result in a penalty.

Task 2: Building the User Interface with Forms & Dynamic Lists (2 Marks)
Create two main screens using Navigator.
Screen 1 (Home Screen):
Use a Column as the main layout.
At the top of the Column, display a welcome message (e.g., "My Tasks & Notes").
Below the welcome message, display a dynamic ListView of tasks/notes. For now, this list can be hardcoded with 2-3 sample items.
Add a Floating Action Button (FAB) that navigates to Screen 2.


Task 3: Data Modeling & JSON Serialization (2 Marks)
Create a Dart class named TaskItem that models the data from your form. It should have the following properties: id, title, priority, description, and isCompleted.
Implement a toJson() method that converts a TaskItem object into a JSON map.
Implement a fromJson(Map<String, dynamic> json) factory constructor that creates a TaskItem object from a JSON map.


Task 4: Data Persistence with SharedPreferences & SQFLITE (4 Marks)
Part A: Stored Preferences (10 Marks)
Use the shared_preferences package to store and retrieve a simple setting.
On the Home Screen, add a SwitchListTile to toggle between a light and dark theme for the app.
The app must remember the user's theme choice and apply it automatically when the app is restarted.


Part B: Local Database with SQFLITE (30 Marks)
Use the sqflite package to create a local SQLite database.
Create a database helper class (database_helper.dart).
Implement methods to:
Initialize the database and create a table for TaskItems. The table should have columns that correspond to the TaskItem properties.
Insert a new TaskItem (convert it to a JSON map using toJson() before inserting).
Retrieve all TaskItems as a List (convert each row from a map to a TaskItem object using fromJson()).
(Bonus - 5 Marks) Delete a TaskItem by its id.


Integration:
Modify the "Submit" button in Screen 2 so that it inserts the new TaskItem into the database instead of just printing to the console.
Modify the Home Screen's ListView to be dynamically populated by the list of TaskItems fetched from the SQFLITE database.


