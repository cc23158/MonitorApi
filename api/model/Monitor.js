class Time {
    constructor(start, end) {
        this.start = start;
        this.end = end;
    }
}

class Day {
    constructor(day) {
        this.day = day;
        this.times = [];
    }

    addTime(start, end) {
        const time = new Time(start, end);
        this.times.push(time);
    }
}

class Schedule {
    constructor() {
        this.days = [];
    }

    addDay(day) {
        if (this.days.length < 7) { this.days.push(day); }
    }
}

class Monitor {
    constructor(name, image, schedule) {
        this.name = name;
        this.image = image;
        this.schedule = schedule;
    }

    toJson() {
        return {
            name: this.name,
            image: this.image,
            schedule: this.schedule.toJson()
        };
    }
}


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

module.exports = { Monitor };

/*

class Time {
    constructor(start, end) {
        this.start = start;
        this.end = end;
    }
}

class Day {
    constructor(day) {
        this.day = day;
        this.times = [];
    }

    addTime(start, end) {
        const time = new Time(start, end);
        this.times.push(time);
    }
}

class Schedule {
    constructor() {
        this.days = [];
    }

    addDay(day) {
        if (this.days.length < 7) { this.days.push(day); }
    }
}

class Monitor {
    constructor(name, image) {
        this.name = name;
        this.image = image;
        this.schedule = new Schedule();
    }
}


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

*/