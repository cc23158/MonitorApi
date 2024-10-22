import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pages/model/Monitor.dart';
import 'package:pages/screen/insert.dart';
import 'package:pages/service/http.dart';

class Get extends StatefulWidget {
  const Get({super.key});

  @override
  GetState createState() => GetState();
}

class GetState extends State<Get> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carossel de Cards", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: FutureBuilder
      (
        future: Http.getMonitors(),
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum monitor encontrado.'));
          }

          List<Monitor> data = snapshot.data!;
          return Carousel(monitors: data, currentIndex: currentIndex, onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Insert())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Carousel extends StatelessWidget
{
  final List<Monitor> monitors;
  final Function(int) onPageChanged;
  final int currentIndex;

  const Carousel({ super.key, required this.monitors, required this.currentIndex, required this.onPageChanged });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              onPageChanged(index); // Atualiza o índice atual
            },
          ),
          items: monitors.map((monitor) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 174, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(monitor.image, height: 100, width: 100), // Use Image.network
                      const SizedBox(height: 20),
                      Text(monitor.name, style: const TextStyle(color: Colors.white, fontSize: 18)),
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
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

/*
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
*/