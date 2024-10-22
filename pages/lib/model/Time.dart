class Time
{
  final String start;
  final String end;

  Time(this.start, this.end);

  factory Time.fromJson(Map<String, dynamic> json) { return Time(json["start"], json["end"]); }

  Map<String, dynamic> toJson()
  {
    return
    {
      "start": start,
      "end": end
    };
  }
}