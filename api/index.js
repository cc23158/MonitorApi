const express = require("express");
const cors = require("cors");
const { MonitorManager } = require("./model/Monitor");

const app = express();
app.use(cors());
app.use(express.json());

const monitorManager = new MonitorManager();

app.get("/api/getMonitors", (req, res) => {
    const monitors = monitorManager.getMonitor();
    res.status(200).send({
        "status-code": 200,
        "monitor": monitors
    });
});

app.post("/api/postMonitor", (req, res) => {
    const { name, image, schedule } = req.body;    

    const data = { name, image, schedule };
    monitorManager.addMonitor(data);

    res.status(201).send({
        "status-code": 200,
        "message": "Monitor added",
        "monitor": data
    });
});

app.listen(3000, () => {
    console.log("Listening on port 3000...");
});