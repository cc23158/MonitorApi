export interface Time {
    start: string;
    end: string;
};

// o atributo day: será um número de acordo com o dia da semana. EX: Domingo -> 0 / Segunda -> 1
export interface Day {
    day: Number;
    times: Time[];
};

export class Schedule {
    private days: Day[];

    constructor() {
        this.days = [];
    }

    getSchedule(): Day[] {
        return this.days;
    }

    addSchedule(day: Number, time: Time): void {
        this.days.push({day, times: [time]});
    }
};