import "Schedule.dart";

class Monitor
{
  final String name;
  final String image;
  final Schedule schedule;

  Monitor(this.name, this.image, this.schedule);
  factory Monitor.fromMap(Map<String, dynamic> json) { return Monitor(json["name"], json["image"], json["schedule"]); }
  factory Monitor.fromJson(Map<String, dynamic> json) { return Monitor(json["name"], json["image"], json["schedule"]); }
}