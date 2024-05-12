import { Component, OnInit } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Diabetes } from './diabetes';
import { DiabetesService } from './diabetesservice';

@Component({
    templateUrl: './diabetes.component.html',
    providers: [MessageService, ConfirmationService],
})
export class DiabetesComponent implements OnInit {

    public diabetes: Diabetes = new Diabetes();
    public showResults = false;

    public samples = [
        {PredictedDiabetes:1, age:50, bloodpressure:72, bmi:33, diabetespedigree:0.62, glucose:148, insulin:0, pregnancies:6, skinthickness:35},
        {PredictedDiabetes:0, age:31, bloodpressure:66, bmi:26, diabetespedigree:0.35, glucose:85, insulin:0, pregnancies:1, skinthickness:29}
    ]

    constructor(private diabetesService: DiabetesService, 
                private messageService: MessageService) {}

    ngOnInit() {

    }

    selectValues(sample: Diabetes) {
        this.diabetes = sample;
        this.showResults = false;
    }

    predict() {
        this.diabetesService.predict(this.diabetes).subscribe(
            response => {
                this.diabetes = response;
                this.showResults = true;
            },
            error => {
                console.log(error);
                this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error on load the predictions.' });
            }
        );
    }

    
}
