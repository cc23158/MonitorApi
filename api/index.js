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

function addDaysWithTimes(schedule) {
    for (let i = 1; i <= 7; i++) {
        const day = new Day(i);

        day.addTime("09:00", "10:00");
        day.addTime("10:00", "11:00");
        day.addTime("11:00", "12:00");

        schedule.addDay(day);
    }
}

addDaysWithTimes(schedule1);

var monitor1 = new Monitor("Monitor 1", "https://www.google.com/imgres?q=imagens%20png&imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fpt%2Ff%2Ff9%2FFuria_Esports_logo.png&imgrefurl=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FFicheiro%3AFuria_Esports_logo.png&docid=AyInFgcVH5A9sM&tbnid=XrwWxAOJi8PBMM&vet=12ahUKEwimqr3z8qCJAxU0D7kGHQWMNicQM3oECFQQAA..i&w=321&h=312&hcb=2&ved=2ahUKEwimqr3z8qCJAxU0D7kGHQWMNicQM3oECFQQAA", schedule1);

var monitorManager = new MonitorManager();
monitorManager.insert(monitor1);

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