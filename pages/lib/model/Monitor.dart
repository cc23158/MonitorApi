import "day.dart";
import "Schedule.dart";

class Monitor
{
  final String name;
  final String image;
  final Schedule schedule;

  Monitor(this.name, this.image, this.schedule);
  factory Monitor.fromMap(Map<String, dynamic> json) { return Monitor.fromMap(json); }

  factory Monitor.fromJson(Map<String, dynamic> json)
  {
    return Monitor
    (
      json["name"],
      json["image"],
      // crio um schedule e adiciono os dados vindos do JSON no formato de uma lista, transformando os dados em seguinda, em um objeto Day
      Schedule()..days.addAll((json["schedule"] as List).map((element) => Day.fromMap(element))),
    );
  }

  // transformando o monitor em JSON para inseri-lo
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