import { Component, OnInit } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Kidney } from './kidney';
import { KidneyService } from './kidneyservice';

@Component({
    templateUrl: './kidney.component.html',
    providers: [MessageService, ConfirmationService],
})
export class KidneyComponent implements OnInit {

    public kidney: Kidney = new Kidney();
    public showResults = false;

    public yesNoOptions = [
        {label: 'Yes', value: 'yes'},
        {label: 'No', value: 'no'},
    ];

    public presentNotPresentOptions = [
        {label: 'Present', value: 'present'},
        {label: 'Not Present', value: 'notpresent'},
    ];

    public normalAbnormalOptions = [
        {label: 'Normal', value: 'normal'},
        {label: 'Abnormal', value: 'abnormal'},
    ];

    public goodPoorOptions = [
        {label: 'Good', value: 'good'},
        {label: 'Poor', value: 'poor'},
    ];


    public samples = [
        {classification: "ckd",age: 48,al: 1.0,ane: "no",appet: "good",ba: "notpresent",bgr: 121.0,bp: 80.00,bu: 36.0,cad: "no",dm: "yes",hemo: 15.40,htn: "yes",pc: "normal",pcc: "notpresent",pcv: 44,pe: "no",pot: 2.50,rbc: "normal",rc: 5.2,sc: 1.2,sg: 1.02,sod: 111.0,su: 0.0,wc: 7800},
        {classification: "notckd", age: 40,al: 0.0,ane: "no",appet: "good",ba: "notpresent",bgr: 140.0,bp: 80.00,bu: 10.0,cad: "no",dm: "no",hemo: 15.00,htn: "no",pc: "normal",pcc: "notpresent",pcv: 48,pe: "no",pot: 5.0,rbc: "normal",rc: 4.5,sc: 1.2,sg: 1.03,sod: 135.0,su: 0.0,wc: 10400}
    ]

    constructor(private kidneyService: KidneyService, 
                private messageService: MessageService) {}

    ngOnInit() {

    }

    selectValues(sample: Kidney) {
        this.kidney = sample;
        this.showResults = false;
    }

    predict() {
        this.kidneyService.predict(this.kidney).subscribe(
            response => {
                this.kidney = response;
                this.showResults = true;
            },
            error => {
                console.log(error);
                this.messageService.add({ severity: 'error', summary: 'Error', detail: 'Error on load the predictions.' });
            }
        );
    }

    
}
