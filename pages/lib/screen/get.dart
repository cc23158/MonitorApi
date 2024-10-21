// https://api.flutter.dev/flutter/material/CarouselView-class.html

import 'package:flutter/material.dart';
import 'package:pages/model/Monitor.dart';
import 'package:pages/screen/insert.dart';
import 'package:pages/service/http.dart';

class Get extends StatelessWidget
{
  final List<Monitor> monitors = []; //Http.getMonitors();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Carossel de Cards"),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemCount: monitors.length + 1, // +1 para o card de adição
        itemBuilder: (context, index) {
          if (index < monitors.length) {
            final monitor = monitors[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(monitor.image),
                  SizedBox(height: 10),
                  Text(monitor.name, style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Insert()),
                );
              },
              child: Card(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Icon(Icons.add, size: 50),
                ),
              ),
            );
          }
        },
      ),
    ); 
  }
}