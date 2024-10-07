"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MonitorManager = void 0;
;
class MonitorManager {
    constructor() {
        this.monitors = [];
    }
    getMonitor() {
        return this.monitors;
    }
    addMonitor(monitor) {
        this.monitors.push(monitor);
    }
}
exports.MonitorManager = MonitorManager;
;
