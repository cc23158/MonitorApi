class Schedule {
    constructor() {
        this.days = [];
    }

    addDay(day) {
        if (this.days.length < 7) { this.days.push(day); }
    }

    toJson() {
        return {
            days: this.days.map(day => day.toJson())
        };
    }
}

module.exports = { Schedule };