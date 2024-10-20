import "Time.dart";

class Day
{
  final int day;
  final List<Time> times;

  Day(this.day, this.times);
  factory Day.fromMap(Map<String, dynamic> json)
  {
    var timesFromJson = json["times"] as List;
    List<Time> timesList = timesFromJson.map((i) => Time.fromMap(i)).toList();
    return Day(json["day"], timesList);
  }

  factory Day.fromJson(Map<String, dynamic> json)
  {
    var timesFromJson = json["times"] as List;
    List<Time> timesList = timesFromJson.map((i) => Time.fromMap(i)).toList();
    return Day(json["day"], timesList);
  }

  // para permitir a transformação do Schedule em JSON
  Map<String, dynamic> toJson()
  {
    return
    {
      "day": day,
      "times": times.map((time) => {"start": time.start, "end": time.end}).toList()
    };
  }
}