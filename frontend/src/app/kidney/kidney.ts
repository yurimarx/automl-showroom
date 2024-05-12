export class Kidney {
    
    classification: string;
    age: number;
    bp: number; //blood pressure
    sg: number; //specific gravity
    al: number; //albumin
    su: number; //sugar
    rbc: string; //red blood cells
    pc: string; //pus cell
    pcc: string; //pus cell clumps
    ba: string; //bacteria
    bgr: number; //blood glucose random
    bu: number; //blood urea
    sc: number; //serum creatinine
    sod: number; //sodium
    pot: number; //potassio
    hemo: number; //hemoglobin
    pcv: number; //packed cell volume
    wc: number; //white blood cell count
    rc: number; //red blood cell count
    htn: string; //hypertension
    dm: string; //diabetes mellitus
    cad: string; //coronary artery disease
    appet: string; //appetite
    pe: string; //pedal edema
    ane: string; //anemia 

    constructor() {
        this.classification = null;
        this.age = 0;
        this.bp = 0; //blood pressure
        this.sg = 0; //specific gravity
        this.al = 0; //albumin
        this.su = 0; //sugar
        this.rbc = null; //red blood cells
        this.pc = null; //pus cell
        this.pcc = null; //pus cell clumps
        this.ba = null; //bacteria
        this.bgr = 0; //blood glucose random
        this.bu = 0; //blood urea
        this.sc = 0; //serum creatinine
        this.sod = 0; //sodium
        this.pot = 0; //potassio
        this.hemo = 0; //hemoglobin
        this.pcv = 0; //packed cell volume
        this.wc = 0; //white blood cell count
        this.rc = 0; //red blood cell count
        this.htn = null; //hypertension
        this.dm = null; //diabetes mellitus
        this.cad = null; //coronary artery disease
        this.appet = null; //appetite
        this.pe = null; //pedal edema
        this.ane = null; //anemia 
    }
    
}