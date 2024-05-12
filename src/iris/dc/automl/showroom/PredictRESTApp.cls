Class dc.automl.showroom.PredictRESTApp Extends %CSP.REST
{

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

Parameter CONTENTTYPE = "application/json";

Parameter Version = "1.0.0";

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- Server Info -->
<Route Url="/" Method="GET" Call="GetInfo" Cors="true"/>

<!-- predict telecom churn -->
<Route Url="/predict-telco-churn" Method="POST" Call="PredictTelcoChurn" />

<!-- predict internet churn -->
<Route Url="/predict-internet-churn" Method="POST" Call="PredictInternetChurn" />

</Routes>
}

/// Predict Internet Churn
ClassMethod PredictInternetChurn() As %Status
{
    Try {
      Set data = {}.%FromJSON(%request.Content)
      Set %response.Status = 200
      Set %response.Headers("Access-Control-Allow-Origin")="*"
      
      Set qry = "SELECT PREDICT(InternetChurnModel) As PredictedInternetChurn, "
                  _" BillAvg, HasTvOrMoviePack, ReaminingContract, SubscriptionAge " 
                  _" FROM (SELECT '"_data.BillAvg_"' AS BillAvg, '"
                  _data.HasTvOrMoviePack_"' As HasTvOrMoviePack, '" 
                  _data.ReaminingContract_"' AS ReaminingContract, '"
                  _data.SubscriptionAge_"' AS SubscriptionAge)"
      Set tStatement = ##class(%SQL.Statement).%New()
      Set qStatus = tStatement.%Prepare(qry)
      If qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
      Set rset = tStatement.%Execute()
      Do rset.%Next()

      Set Response = {}
      Set Response.PredictedInternetChurn = rset.PredictedInternetChurn
      Set Response.BillAvg = rset.BillAvg
      Set Response.HasTvOrMoviePack = rset.HasTvOrMoviePack
      Set Response.ReaminingContract = rset.ReaminingContract
      Set Response.SubscriptionAge = rset.SubscriptionAge

      Write Response.%ToJSON()
      
      Return 1
      
    } Catch err {
      write !, "Error name: ", ?20, err.Name,
          !, "Error code: ", ?20, err.Code,
          !, "Error location: ", ?20, err.Location,
          !, "Additional data: ", ?20, err.Data, !
      Return 0
    }
}

/// Predict Telecom Churn
ClassMethod PredictTelcoChurn() As %Status
{
    Try {
      Set data = {}.%FromJSON(%request.Content)
      Set %response.Status = 200
      Set %response.Headers("Access-Control-Allow-Origin")="*"
      
      Set qry = "SELECT PREDICT(TelcoChurnModel) As PredictedTelcoChurn, "
                  _" Contract, Dependents, Gender, HasStreaming, InternetService, MonthlyCharges, MultipleLines, Partner, PhoneService, Tenure " 
                  _" FROM (SELECT '"_data.Contract_"' AS Contract, '"
                  _data.Dependents_"' As Dependents, '" 
                  _data.Gender_"' AS Gender, '"
                  _data.HasStreaming_"' AS HasStreaming, '"
                  _data.InternetService_"' As InternetService, '"
                  _data.MonthlyCharges_"' As MonthlyCharges, '" 
                  _data.MultipleLines_"' AS MultipleLines, '"
                  _data.Partner_"' AS Partner, '"
                  _data.PhoneService_"' As PhoneService, '"
                  _data.Tenure_"' AS Tenure)"
      Set tStatement = ##class(%SQL.Statement).%New()
      Set qStatus = tStatement.%Prepare(qry)
      If qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
      Set rset = tStatement.%Execute()
      Do rset.%Next()

      Set Response = {}
      Set Response.PredictedTelcoChurn = rset.PredictedTelcoChurn
      Set Response.Contract = rset.Contract
      Set Response.Dependents = rset.Dependents
      Set Response.Gender = rset.Gender
      Set Response.HasStreaming = rset.HasStreaming
      Set Response.InternetService = rset.InternetService
      Set Response.MonthlyCharges = rset.MonthlyCharges
      Set Response.MultipleLines = rset.MultipleLines
      Set Response.Partner = rset.Partner
      Set Response.PhoneService = rset.PhoneService
      Set Response.Tenure = rset.Tenure

      Write Response.%ToJSON()
      
      Return 1
      
    } Catch err {
      write !, "Error name: ", ?20, err.Name,
          !, "Error code: ", ?20, err.Code,
          !, "Error location: ", ?20, err.Location,
          !, "Additional data: ", ?20, err.Data, !
      Return 0
    }
}

/// General information
ClassMethod GetInfo() As %Status
{
  SET version = ..#Version
  SET fmt=##class(%SYS.NLS.Format).%New("ptbw")
  
  SET info = {
    "Service": "Churn Show API",
    "version": (version),
    "Developer": "Yuri Gomes",
    "Status": "Ok",
    "Date": ($ZDATETIME($HOROLOG))
  }
  Set %response.ContentType = "application/json"
  Set %response.Headers("Access-Control-Allow-Origin")="*"
  

  Write info.%ToJSON()
  Quit $$$OK
}

}
