import "package:flutter/material.dart";
import "package:pages/model/Time.dart";
import "package:pages/model/schedule.dart";
import "package:pages/service/http.dart";

class Insert extends StatefulWidget
{
  const Insert({super.key});

  @override
  InsertState createState() => InsertState();
}

class InsertState extends State<Insert>
{
  Schedule schedule = Schedule();

  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final List<String> days = 
  [
    "Segunda-Feira",
    "Terça-Feira",
    "Quarta-Feira",
    "Quinta-Feira",
    "Sexta-Feira",
    "Sábado",
    "Domingo",
  ];

  final List<Time> weekSchedule = 
  [
    Time("07:30", "08:15"),
    Time("08:15", "09:00"),
    Time("09:00", "09:45"),
    Time("10:00", "10:45"),
    Time("10:45", "11:30"),
    Time("11:30", "12:15"),
    Time("13:30", "14:15"),
    Time("14:15", "15:00"),
    Time("15:00", "15:45"),
    Time("16:00", "16:45"),
    Time("16:45", "17:30"),
    Time("17:30", "18:15")
  ];

  // levará a outra página, a dos horários
  void navigateToSchedule(int dayIndex)
  {
    Navigator.push
    (
      context,
      MaterialPageRoute(builder: (context) => Planning
      (
        // é passado o dia da semana, a lista de horários a se considerar e pede-se
        // uma lista dos horários selecionados, pois serão usados para preencher o Schedule do objeto Monitor
        day: days[dayIndex],
        times: weekSchedule,
        onTimesSelected: (selectedTimes)
        {
          setState(() {
            schedule.addSchedule(dayIndex, selectedTimes);
          });
        }
      )),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Adicionando Monitor"),
        centerTitle: true,
        backgroundColor: Colors.white38,
        leading: IconButton(onPressed: () => { Navigator.of(context).pop() }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            const Icon(Icons.monitor, size: 50.0, color: Colors.blueGrey),
            const Text("Nome do monitor:", style: TextStyle(fontSize: 20.0, color: Color.fromARGB(183, 139, 7, 216))),
            TextField
            (
              controller: nameController,
              decoration: const InputDecoration
              (
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid)
                ),
                hintText: "Digite o nome do monitor"
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 25),
            const Text("URL da imagem", style: TextStyle(fontSize: 20, color: Color.fromARGB(183, 139, 7, 216))),
            TextField
            (
              controller: imageController,
              decoration: const InputDecoration
              (
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid)
                ),
                hintText: "Digite a URL da sua imagem"
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 32),
            // cria um espaço para acoplar os botões que representam os dias da semana para o planejamento (Schedule) do monitor
            Wrap
            (
              spacing: 10,
              // define o núero de elementos a serem acoplados e os atribui um índice de acesso
              children: List.generate(days.length, (index)
              {
                // botão que levará a tela de horários do dia
                return ElevatedButton
                (
                  onPressed: () => navigateToSchedule(index),
                  child: Text(days[index], style: const TextStyle(fontSize: 16),)
                );
              })
            ),
            const SizedBox(height: 32),
            ElevatedButton
            (
              onPressed: ()
              {
                if (nameController.text != "" && imageController.text != "")
                {
                  var data =
                  {
                    "name": nameController.text,
                    "image": imageController.text,
                    "schedule": schedule.toJson()
                  };
                  Http.postMonitor(data);
                  Navigator.pop(context);
                }
              },
              child: const Text("Adicionar monitor", style: TextStyle(fontSize: 18, color: Colors.blue),)
            )
          ],
        )
      ),
    );
  }  
}

class Planning extends StatefulWidget
{
  final String day;
  final List<Time> times;
  final Function(List<Time>) onTimesSelected;

  const Planning({super.key,  required this.day, required this.times, required this.onTimesSelected });
  
  @override
  PlanningState createState() => PlanningState();
}

class PlanningState extends State<Planning>
{
  List<Time> selectedTimes = [];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Selecione os horários - ${widget.day}"),
        centerTitle: true,
      ),
      body: ListView.builder
      (
        itemCount: widget.times.length, // números de items da lista
        itemBuilder: (context, index)
        {
          // lógica de marcar / desmarcar um item da lista
          return CheckboxListTile
          (
            title: Text("${widget.times[index].start} - ${widget.times[index].end}"),
            value: selectedTimes.contains(widget.times[index]), // se o tempo já está selecionado, retorna true e marca o check
            onChanged: (bool? selected)
            {
              // se um item foi selecionado, ele é adicionado aos tempos selecionados, caso contrário, remove-o da lista de tempos selecionados
              setState(() {
                if (selected == true) { selectedTimes.add(widget.times[index]); }
                else { selectedTimes.remove(widget.times[index]); }
              });
            },
          );
        },
      ),
      // botão para confirmar o planejamento dos horários da monitoria
      floatingActionButton: FloatingActionButton
      (
        // retorna à classe Planning os horários selecionados
        onPressed: ()
        {
          widget.onTimesSelected(selectedTimes);
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}