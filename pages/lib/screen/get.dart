import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:pages/model/Monitor.dart";
import "package:pages/model/Schedule.dart";
import "package:pages/screen/insert.dart";
import "package:pages/service/http.dart";

class Get extends StatefulWidget {
  const Get({super.key});

  @override
  GetState createState() => GetState();
}

class GetState extends State<Get>
{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Carossel de Cards", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: FutureBuilder
      (
        future: Http.getMonitors(),
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          if (!snapshot.hasData || snapshot.data!.isEmpty) { return const Center(child: Text("Nenhum monitor encontrado.")); }

          else
          {
            List<Monitor> data = snapshot.data!;
            return CarouselSlider
            (
              options: CarouselOptions
              (
                height: 300.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: data.map((monitor)
              {
                return Builder
                (
                  builder: (BuildContext context)
                  {
                    return Container
                    (
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration
                      (
                        color: const Color.fromARGB(255, 0, 174, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column
                      (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        [
                          Image.network(monitor.image, height: 100, width: 100),
                          const SizedBox(height: 20),
                          Text(monitor.name, style: const TextStyle(color: Colors.white, fontSize: 18)),
                          IconButton
                          (
                            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleTable(schedule: monitor.schedule))); },
                            icon: const Icon(Icons.schedule_rounded, color: Colors.white)
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Insert())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ScheduleTable extends StatelessWidget
{
  final Schedule schedule;

  List<String> timeSlots =
  [
    "07:30 - 08:15",
    "08:15 - 09:00",
    "09:00 - 09:45",
    "10:00 - 10:45",
    "10:45 - 11:30",
    "11:30 - 12:15",
    "13:30 - 14:15",
    "14:15 - 15:00",
    "15:00 - 15:45",
    "16:00 - 16:45",
    "16:45 - 17:30",
    "17:30 - 18:15"
  ];

  ScheduleTable({ super.key, required this.schedule });

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Horários de Monitoria"),
        centerTitle: true,
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Table
        (
          border: TableBorder.all(),
          children:
          [
            TableRow
            (
              children: 
              [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Horário', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Segunda-feira', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Terça-feira', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Quarta-feira', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Quinta-feira', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sexta-feira', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Sábado', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Domingo', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ]
            ),
            for (String timeSlot in timeSlots)
              TableRow(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(timeSlot),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(''),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}