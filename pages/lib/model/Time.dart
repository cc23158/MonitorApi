class Time
{
  final String start;
  final String end;

  Time(this.start, this.end);
  factory Time.fromMap(Map<String, dynamic> json) { return Time(json["start"], json["end"]); }
  factory Time.fromJson(Map<String, dynamic> json) { return Time(json["start"], json["end"]); }
}