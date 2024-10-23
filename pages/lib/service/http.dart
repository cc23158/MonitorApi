import "package:http/http.dart" as http;
import "dart:convert";
import "dart:io";

import "package:pages/model/Monitor.dart";

class Http
{
  static String url = "http://177.220.18.250:3000/api/";

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
        monitorList = (data["monitor"] as List).map((value) => Monitor.fromJson(value)).toList();
      }

      else { print("Erro: ${res.statusCode}"); }
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