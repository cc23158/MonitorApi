class Time {
    constructor(start, end) {
        this.start = start;
        this.end = end;
    }

    toJson() {
        return {
            start: this.start,
            end: this.end
        };
    }
}

module.exports = { Time };