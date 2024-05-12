Class dc.automl.showroom.datasets.TelcoChurn Extends %Persistent
{

Property Gender As %String;

Property Partner As %String;

Property Dependents As %String;

Property Tenure As %Integer;

Property PhoneService As %String;

Property MultipleLines As %String;

Property InternetService As %String;

Property Contract As %String;

Property MonthlyCharges As %String;

Property HasStreaming As %String;

Property Churn As %String;

Storage Default
{
<Data name="TelcoChurnDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Gender</Value>
</Value>
<Value name="3">
<Value>Partner</Value>
</Value>
<Value name="4">
<Value>Dependents</Value>
</Value>
<Value name="5">
<Value>Tenure</Value>
</Value>
<Value name="6">
<Value>PhoneService</Value>
</Value>
<Value name="7">
<Value>MultipleLines</Value>
</Value>
<Value name="8">
<Value>InternetService</Value>
</Value>
<Value name="9">
<Value>Contract</Value>
</Value>
<Value name="10">
<Value>MonthlyCharges</Value>
</Value>
<Value name="11">
<Value>HasStreaming</Value>
</Value>
<Value name="12">
<Value>Churn</Value>
</Value>
</Data>
<DataLocation>^dc.automl.showr6F50.TelcoChurnD</DataLocation>
<DefaultData>TelcoChurnDefaultData</DefaultData>
<IdLocation>^dc.automl.showr6F50.TelcoChurnD</IdLocation>
<IndexLocation>^dc.automl.showr6F50.TelcoChurnI</IndexLocation>
<StreamLocation>^dc.automl.showr6F50.TelcoChurnS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
