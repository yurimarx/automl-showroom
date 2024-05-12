This is the InterSystems IRIS AutoML Showroom application using InterSystems IntegratedML to Predict some Churns

## Installation using ZPM
1. Execute this command from IRIS Terminal:
```
zpm "install automl-showroom"
```
1. Import the Postman collection to execute some samples

## Installation using Docker Compose
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/predict-diseases.git
```

2. Open a Docker terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container:

```
$ docker-compose up -d 
```
4. Go to Execute Query into Management Portal to train the AI model: http://localhost:52773/csp/sys/exp/%25CSP.UI.Portal.SQL.Home.zen?$NAMESPACE=USER 

5. Create the VIEWS used to train diabetes and kidney models: 
```
CREATE VIEW DiabetesTrain AS SELECT Outcome, age, bloodpressure, bmi, diabetespedigree, glucose, insulin, pregnancies, skinthickness FROM dc_data_health.Diabetes
```

```
CREATE VIEW KidneyDiseaseTrain AS SELECT 
age, al, ane, appet, ba, bgr, bp, bu, cad, classification, dm, hemo, htn, pc, pcc, pcv, pe, pot, rbc, rc, sc, sg, sod, su, wc
FROM dc_data_health.KidneyDisease
```
```
CREATE VIEW MaternalRiskTrain AS SELECT BS, BodyTemp, DiastolicBP, HeartRate, RiskLevel, SystolicBP, age FROM dc_data_health.MaternalHealthRisk 
```

6. Create the AI Models for diabetes and kidney using the views: 
```
CREATE MODEL DiabetesModel PREDICTING (Outcome) FROM DiabetesTrain
```

```
CREATE MODEL KidneyDiseaseModel PREDICTING (classification) FROM KidneyDiseaseTrain
```

``` 
CREATE MODEL MaternalRiskModel PREDICTING (RiskLevel) FROM MaternalRiskTrain 
```

7. Train the models for diabetes and kidney diseases:
```
TRAIN MODEL DiabetesModel
```

```
TRAIN MODEL KidneyDiseaseModel
```

```
TRAIN MODEL MaternalRiskModel 
```

8. Go to http://localhost:52773/disease-predictor/index.html to use the Disease Predictor frontend and predict diseases like these screens:

![Diabetes-Predictor](https://github.com/yurimarx/predict-diseases/raw/master/mainscreen.png "Diabetes Predictor")

![Kidney-Predictor](https://github.com/yurimarx/predict-diseases/raw/master/secondscreen.png "Kidney Predictor")

![Maternal-Risk-Predictor](https://github.com/yurimarx/predict-diseases/raw/master/thirdscreen.png "Maternal Risk Predictor")

# Credits
This application used InterSystems IRIS IntegratedML project

