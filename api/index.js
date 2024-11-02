const express = require("express");
const cors = require("cors");
const { MonitorManager } = require("./model/MonitorManager");
const { Monitor } = require("./model/Monitor");
const { Schedule } = require("./model/Schedule");
const { Day } = require("./model/Day");

const app = express();
app.use(cors());
app.use(express.json());

var schedule1 = new Schedule()
var schedule2 = new Schedule()

function addDaysWithTimes(schedule) {
    for (let i = 1; i <= 7; i++) {
        const day = new Day(i);

        day.addTime("09:00", "09:45");
        day.addTime("10:00", "10:45");
        day.addTime("10:45", "11:30");

        schedule.addDay(day);
    }
}

addDaysWithTimes(schedule1);

var monitor1 = new Monitor("Monitor 1", "https://upload.wikimedia.org/wikipedia/pt/f/f9/Furia_Esports_logo.png", schedule1);
var monitor2 = new Monitor("Monitor 2", "https://upload.wikimedia.org/wikipedia/commons/1/17/LOUD_LOGO.png", schedule1);

var monitorManager = new MonitorManager();
monitorManager.insert(monitor1);
monitorManager.insert(monitor2);

app.get("/api/getMonitors", (req, res) => {
    const monitors = monitorManager.getAll();
    res.status(200).send({
        "status-code": 200,
        "monitor": monitors
    });
});

app.post("/api/postMonitor", (req, res) => {
    const { name, image, schedule } = req.body;    

    const data = { name, image, schedule };
    monitorManager.insert(data);

    res.status(201).send({
        "status-code": 200,
        "message": "Monitor added",
        "monitor": data
    });
});

app.listen(3000, () => {
    console.log("Listening on port 3000...");
});