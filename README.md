This is the InterSystems IRIS AutoML Showroom application using InterSystems IntegratedML to Predict some Churns

## Installation using ZPM
1. Execute this command from IRIS Terminal:
```
zpm "install automl-showroom"
```
2. Open the SQL Manager: http://localhost:52773/csp/sys/exp/%25CSP.UI.Portal.SQL.Home.zen?$NAMESPACE=USER&$NAMESPACE=USER
   1. Execute the SQL command: ```TRAIN MODEL InternetChurnModel```
   2. Execute the SQL command: ```TRAIN MODEL TelcoChurnModel ``` 

3. Import the Postman collection from https://raw.githubusercontent.com/yurimarx/automl-showroom/main/churn-samples.postman_collection.json to execute some samples

## Installation using Docker Compose
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/automl-showroom.git
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

5. Execute the models: 
   1. Execute the SQL command: ```TRAIN MODEL InternetChurnModel```
   2. Execute the SQL command: ```TRAIN MODEL TelcoChurnModel```
   
6. Import the Postman collection from https://raw.githubusercontent.com/yurimarx/automl-showroom/main/churn-samples.postman_collection.json to execute some samples

# Credits
This application used InterSystems IRIS IntegratedML project

