export class Diabetes {
    
    PredictedDiabetes: number;
    age: number;
    bloodpressure: number;
    bmi: number;
    diabetespedigree: number;
    glucose: number;
    insulin: number;
    pregnancies: number;
    skinthickness: number;

    constructor() {
        this.PredictedDiabetes = -1;
        this.age = 0;
        this.bloodpressure = 0;
        this.bmi = 0;
        this.diabetespedigree = 0;
        this.glucose = 0;
        this.insulin = 0;
        this.pregnancies = 0;
        this.skinthickness = 0;
    }
    
}