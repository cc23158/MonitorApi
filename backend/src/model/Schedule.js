"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Schedule = void 0;
;
;
class Schedule {
    constructor(initDays = []) {
        this.days = [];
        this.days = initDays;
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
