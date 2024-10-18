import "Monitor.dart";

class Monitormanager
{
  final List<Monitor> monitors;

  Monitormanager() : monitors = [];

  List<Monitor> getMonitor() { return monitors; }

  void addMonitor(Monitor monitor) { monitors.add(monitor); }
}