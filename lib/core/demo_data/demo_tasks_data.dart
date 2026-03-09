class TaskModel {
  final String title;
  final String description;
  final String date;
  final String time;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}
List<TaskModel> demoTasks = [
  TaskModel(
    title: "Improve English",
    description: "Practice speaking for 30 minutes",
    date: "11/03/2025",
    time: "05:00 PM",
  ),
  TaskModel(
    title: "Workout",
    description: "Go to the gym and train chest",
    date: "12/03/2025",
    time: "07:00 AM",
  ),
  TaskModel(
    title: "Study Flutter",
    description: "Build a Todo app UI",
    date: "13/03/2025",
    time: "09:00 PM",
  ),
];