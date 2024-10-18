import "Time.dart";
import "Day.dart";

class Schedule
{
  final List<Day> days;

  Schedule() : days = [];

  List<Day> getSchedule() { return days; }

  void addSchedule(int day, List<Time> time) {
    days.add(Day(day, time));
  }
}