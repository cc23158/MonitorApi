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

module.exports = { Monitor };