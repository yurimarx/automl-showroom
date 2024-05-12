Class iris.dc.automl.showroom.datasets.InternetChurn Extends %Persistent
{

Property HasTvOrMoviePack As %Integer;

Property SubscriptionAge As %String;

Property BillAvg As %String;

Property ReaminingContract As %String;

Property Churn As %Integer;

Storage Default
{
<Data name="InternetChurnDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>HasTvOrMoviePack</Value>
</Value>
<Value name="3">
<Value>SubscriptionAge</Value>
</Value>
<Value name="4">
<Value>BillAvg</Value>
</Value>
<Value name="5">
<Value>ReaminingContract</Value>
</Value>
<Value name="6">
<Value>Churn</Value>
</Value>
</Data>
<DataLocation>^iris.dc.auto5B03.InternetChurnD</DataLocation>
<DefaultData>InternetChurnDefaultData</DefaultData>
<IdLocation>^iris.dc.auto5B03.InternetChurnD</IdLocation>
<IndexLocation>^iris.dc.auto5B03.InternetChurnI</IndexLocation>
<StreamLocation>^iris.dc.auto5B03.InternetChurnS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
