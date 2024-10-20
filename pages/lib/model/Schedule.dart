// Linha 11 - https://api.flutter.dev/flutter/dart-core/List/List.generate.html

import "Time.dart";
import "day.dart";

class Schedule
{
  final List<Day> days;

  // cria a lista de dias apenas com o campo day, sem os horários
  Schedule(): days = List.generate(7, (index) => Day(index, []));

  List<Day> getSchedule() { return days; }

  void addSchedule(int day, List<Time> time)
  {
    days[day] = Day(day, time);
  }

  // para converter Schedule em map na inserção de monitores
  Map<String, dynamic> toJson()
  {
    return { "days": days.map((day) => day.toJson()).toList() };
  }
}