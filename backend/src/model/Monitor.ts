import { Schedule } from "./Schedule";

export interface Monitor {
    name: string;
    image: string;
    schedule: Schedule;
};

export class MonitorManager {
    private monitors: Monitor[] = [];

    getMonitor(): Monitor[] {
        return this.monitors;
    }

    addMonitor(monitor: Monitor): void {
        this.monitors.push(monitor);
    }
};