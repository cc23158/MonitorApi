import "package:flutter/material.dart";

class MonitorSchedule extends StatefulWidget
{
  @override
  MonitorScheduleState createState() => MonitorScheduleState();
}

class MonitorScheduleState extends State<MonitorSchedule>
{
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Monitor Insert"),
        centerTitle: true,
        backgroundColor: Colors.white38,
        leading: IconButton(onPressed: () => {Navigator.of(context).pop() }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            const Icon(Icons.monitor, size: 50.0, color: Colors.blueGrey,),
            Text("Monitor name:", style: TextStyle(fontSize: 20.0, color: const Color.fromARGB(183, 139, 7, 216))),
            TextField
            (
              controller: nameController,
              decoration: InputDecoration
              (
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid)
                ),
                hintText: "Type the monitor's name"
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 25),
            Text("Image URL", style: TextStyle(fontSize: 20, color: const Color.fromARGB(183, 139, 7, 216))),
            TextField
            (
              controller: imageController,
              decoration: InputDecoration
              (
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid)
                ),
                hintText: "Type the monitor's image URL"
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton
            (
              onPressed: () { print("Name: ${nameController.text} / Image: ${imageController.text}"); },
              child: Text("Save Data", style: TextStyle(fontSize: 18, color: Colors.blue),)
            )
          ],
        )
      ),
    );
  }  
}