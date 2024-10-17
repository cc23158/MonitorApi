"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Schedule = void 0;
;
;
class Schedule {
    constructor() {
        this.days = [];
    }
    getSchedule() {
        return this.days;
    }
    addSchedule(day, time) {
        this.days.push({ day, times: [time] });
    }
}
exports.Schedule = Schedule;
;
