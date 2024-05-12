export class Maternal {
    
    PredictedMaternalRisk: number;
    Age: number;
    SystolicBP: number;
    DiastolicBP: number;
    BS: number;
    BodyTemp: number;
    HeartRate: number;

    constructor() {
        this.PredictedMaternalRisk = -1;
        this.Age = 0;
        this.SystolicBP = 0;
        this.DiastolicBP = 0;
        this.BS = 0;
        this.BodyTemp = 0;
        this.HeartRate = 0;
    }
    
}