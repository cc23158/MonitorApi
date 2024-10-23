import "package:pages/model/Schedule.dart";

class Monitor
{
  final String name;
  final String image;
  final Schedule schedule;

  Monitor(this.name, this.image, this.schedule);

  factory Monitor.fromJson(Map<String, dynamic> json) { return Monitor(json["name"], json["image"], Schedule.fromJson(json["schedule"])); }

  Map<String, dynamic> toJson()
  {
    return
    {
      "name": name,
      "image": image,
      "schedule": schedule.toJson()
    };
  }
}