import "package:pages/model/Time.dart";

class Day
{
  final int day;
  final List<Time> times;

  Day(this.day, this.times);
  
  factory Day.fromJson(Map<String, dynamic> json)
  {
    var timesJson = json["times"] as List;
    List<Time> timesList = timesJson.map((time) => Time.fromJson(time)).toList();
    return Day(json["day"], timesList);
  }

  Map<String, dynamic> toJson()
  {
    return
    {
      "day": day,
      "times": times.map((time) => time.toJson()).toList()
    };
  }
}