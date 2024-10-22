class MonitorManager {
    constructor() {
        this.monitors = [];
    }

    getAll() {
        return this.monitors;
    }

    insert(monitor) {
        this.monitors.push(monitor);
    }
}

module.exports = { MonitorManager };