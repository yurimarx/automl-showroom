LOAD DATA FROM FILE '/opt/irisapp/datasets/telco-churn.csv'
INTO dc_automl_showroom_datasets.TelcoChurn
USING {"from":{"file":{"header":true}}}
GO
CREATE VIEW TelcoChurnTrain AS SELECT Gender,Partner,Dependents,Tenure,PhoneService,MultipleLines,InternetService,Contract,MonthlyCharges,Churn,HasStreaming
FROM dc_automl_showroom_datasets.TelcoChurn WHERE ID < 4001
GO 
CREATE VIEW TelcoChurnValidate AS SELECT Gender,Partner,Dependents,Tenure,PhoneService,MultipleLines,InternetService,Contract,MonthlyCharges,Churn,HasStreaming
FROM dc_automl_showroom_datasets.TelcoChurn WHERE ID > 4000
GO 
CREATE MODEL TelcoChurnModel PREDICTING (Churn) FROM TelcoChurnTrain 
GO 
TRAIN MODEL TelcoChurnModel 
GO
VALIDATE MODEL TelcoChurnModel FROM TelcoChurnValidate 
GO

LOAD DATA FROM FILE '/opt/irisapp/datasets/internet-churn.csv'
INTO iris_dc_automl_showroom_datasets.InternetChurn
USING {"from":{"file":{"header":true}}}
GO
CREATE VIEW InternetChurnTrain AS SELECT BillAvg, Churn, HasTvOrMoviePack, ReaminingContract, SubscriptionAge 
FROM iris_dc_automl_showroom_datasets.InternetChurn WHERE ID < 3001
GO 
CREATE VIEW InternetChurnValidate AS SELECT BillAvg, Churn, HasTvOrMoviePack, ReaminingContract, SubscriptionAge 
FROM iris_dc_automl_showroom_datasets.InternetChurn WHERE ID > 3001
GO 
CREATE MODEL InternetChurnModel PREDICTING (Churn) FROM InternetChurnTrain 
GO 
TRAIN MODEL InternetChurnModel 
GO
VALIDATE MODEL InternetChurnModel FROM InternetChurnValidate 
GO


GO
SELECT * FROM INFORMATION_SCHEMA.ML_VALIDATION_METRICS

