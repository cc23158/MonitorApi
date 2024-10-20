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

module.exports = { MonitorManager };