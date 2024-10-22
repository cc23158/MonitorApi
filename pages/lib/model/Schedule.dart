import "Time.dart";
import "day.dart";

class Schedule
{
  final List<Day> days;

  // cria a lista de dias apenas com o campo day, sem os horários
  Schedule(): days = List.generate(7, (index) => Day(index, []));
  Schedule.fromDays(this.days);

  void addSchedule(int day, List<Time> time) { days[day] = Day(day, time); }

  factory Schedule.fromJson(Map<String, dynamic> json)
  {
    var daysJson = json["days"] as List;
    List<Day> daysList = daysJson.map((day) => Day.fromJson(day)).toList();
    return Schedule.fromDays(daysList);
  }

  Map<String, dynamic> toJson()
  {
    return
    {
      "days": days.map((day) => day.toJson()).toList()
    };
  }
}