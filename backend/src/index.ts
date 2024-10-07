// Terá uma página de adicionar monitores, nessa página, será obrigatória a configuração de todos os dias da semana.
// E depois terá momentos para que se mude as paradinhas
import express, { Request, Response } from "express";
import cors from "cors";

import { Monitor, MonitorManager } from "./model/Monitor";
import { Schedule, Time } from "./model/Schedule";

const app = express();
app.use(cors());
app.use(express.json());

const monitorManager = new MonitorManager();

app.get("/api/getMonitors", (req: Request, res: Response) => {
    res.status(200).send({
        "status-code": 200,
        "monitor": monitorManager.getMonitor()
    });
});

app.post("/api/postMonitor", (req: Request, res: Response) => {
    const { name, image, schedule } = req.body;

    if (!name || !image || !schedule || schedule.length !== 7) {
        res.status(400).send({
            "status-code": 400,
            "message": "Invalid input data"
        });
    }

    const data: Monitor = { name, image, schedule };
    monitorManager.addMonitor(data);

    res.status(201).send({
        "status-code": 200,
        "message": "Monitor added",
        "monitor": data
    });
});

app.listen(3000, () => {
    console.log("Listening port 3000...");
});