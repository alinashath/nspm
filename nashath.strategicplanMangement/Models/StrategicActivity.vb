'------------------------------------------------------------------------------
' <auto-generated>
'    This code was generated from a template.
'
'    Manual changes to this file may cause unexpected behavior in your application.
'    Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Partial Public Class StrategicActivity
    Public Property Id As Integer
    Public Property StrategicActionID As Integer
    Public Property ActivityDV As String
    Public Property ActivityEN As String
    Public Property BudgetNB As Nullable(Of Decimal)
    Public Property BudgetGrant As Nullable(Of Decimal)

    Public Overridable Property Schedules As ICollection(Of Schedule) = New HashSet(Of Schedule)
    Public Overridable Property Status As ICollection(Of Status) = New HashSet(Of Status)
    Public Overridable Property StrategicAction As StrategicAction

End Class
