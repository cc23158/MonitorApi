import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pages/model/Monitor.dart';
import 'package:pages/model/Schedule.dart';
import 'package:pages/screen/insert.dart';
import 'package:pages/service/http.dart';

class Get extends StatefulWidget {
  @override
  GetState createState() => GetState();
}

class GetState extends State<Get> {
  int currentIndex = 0;
  List<Monitor> monitors = [];

  @override
  void initState() {
    super.initState();
    fetchMonitors(); // Chama a função para buscar os monitores
  }

  // Função para buscar monitores da API
  Future<void> fetchMonitors() async {
    List<Monitor> fetchedMonitors = await Http.getMonitors(); // Chama a API
    setState(() {
      monitors = fetchedMonitors; // Atualiza o estado com os monitores recebidos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carossel de Cards", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: monitors.map((monitor) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 174, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(monitor.image, height: 100, width: 100),
                        SizedBox(height: 20),
                        Text(monitor.name, style: TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(monitors.length, (index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Insert())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
