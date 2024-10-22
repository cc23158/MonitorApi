const { Time } = require("./Time");

class Day {
    constructor(day) {
        this.day = day;
        this.times = [];
    }

    addTime(start, end) {
        const time = new Time(start, end);
        this.times.push(time);
    }

    toJson() {
        return {
            day: this.day,
            times: this.times.map(time => time.toJson())
        };
    }
}

module.exports = { Day };