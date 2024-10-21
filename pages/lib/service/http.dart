import "package:http/http.dart" as http;
import "dart:convert";
import "dart:io";

import "../model/monitor.dart";

class Http
{
  static String url = "http://192.168.253.210:3000/api/";

  // Obtém a lista de monitores
  static getMonitors() async
  {
    List<Monitor> monitorList = [];
    try
    {
      final res = await http.get(Uri.parse("${url}getMonitors"));
      if (res.statusCode == 200)
      {
        var data = jsonDecode(res.body);
        data["monitors"].forEach((value) {
          monitorList.add(Monitor.fromJson(value));
        });
      }
      
      else { return []; }
    }
    
    catch (e) { print(e.toString()); }

    return monitorList;
  }

  // Adiciona um novo monitor
  static postMonitor(Map monitorData) async
  {
    try
    {
      final res = await http.post
      (
        Uri.parse("${url}postMonitor"),
        body: json.encode(monitorData),
        headers: { HttpHeaders.contentTypeHeader: "application/json" }
      );

      if (res.statusCode == 201) { print("Monitor adicionado com sucesso"); }

      else { print("Falha ao adicionar monitor"); }
    }
    
    catch (e) { print(e.toString()); }
  }
}