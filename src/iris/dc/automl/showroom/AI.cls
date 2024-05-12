Class dc.automl.showroom.AI
{

ClassMethod Migrate()
{
    Do $SYSTEM.SQL.Schema.ImportDDL("/opt/irisapp/migration.sql","/opt/irisapp/migration.log","IRIS")
}

ClassMethod ExecuteSQL(ByRef pSQL As %String)
{
    Kill %objlasterror
    Set start = $ZHorolog

    Write "SQL> "_pSQL, !
    Set rs = ##class(%SQL.Statement).%ExecDirect(, pSQL)
    Do rs.%Display()
    
    Set ignoreSQLCODEList = $LB(
        0, // no error
        100, // no error
        -181, // ignores Model or Trained Model not found error
        -30, // ignores Table or view not found error
        -201 // ignores Table or view name not unique error
    )
    If ('$LF(ignoreSQLCODEList, rs.%SQLCODE)) {
        Throw ##class(%Exception.SQL).CreateFromSQLCODE(rs.%SQLCODE, rs.%Message)
    }
    If ($Get(%objlasterror)) {
        Throw ##class(%Exception.StatusException).CreateFromStatus(%objlasterror)
    }

    Write !,"Time elapsed: "_($ZHorolog - start)_" sec",!
    Write "--------",!
}

}
