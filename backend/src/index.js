"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
// Terá uma página de adicionar monitores, nessa página, será obrigatória a configuração de todos os dias da semana.
// E depois terá momentos para que se mude as paradinhas
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const Monitor_1 = require("./model/Monitor");
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use(express_1.default.json());
const monitorManager = new Monitor_1.MonitorManager();
app.get("/api/getMonitors", (req, res) => {
    res.status(200).send({
        "status-code": 200,
        "monitor": monitorManager.getMonitor()
    });
});
app.post("/api/postMonitor", (req, res) => {
    const { name, image, schedule } = req.body;
    if (!name || !image || !schedule || schedule.length !== 7) {
        res.status(400).send({
            "status-code": 400,
            "message": "Invalid input data"
        });
    }
    const data = { name, image, schedule };
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
