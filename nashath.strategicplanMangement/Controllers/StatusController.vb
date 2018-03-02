Imports System.Data.Entity

Public Class StatusController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /Status/


    '
    ' GET: /Status/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create(Optional id As Integer = 0) As ActionResult


        If id <> 0 Then
            ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", id)

        Else
            ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV")
        End If

        Return View()
    End Function

    '
    ' POST: /Status/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal status As Status, Optional id As Integer = 0) As ActionResult
        If ModelState.IsValid Then
            status.DateTime = Date.Now
            status.StatusUser = User.Identity.Name
            db.Status.Add(status)
            db.SaveChanges()
            Return RedirectToAction("Details", "StrategicActivity", New With {.id = status.StrategicActionID})
        End If

        If id <> 0 Then
            ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", id)

        Else
            ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV")
        End If
        Return View(status)
    End Function

    '
    ' GET: /Status/Edit/5

    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim status As Status = db.Status.Find(id)
        If IsNothing(status) Then
            Return HttpNotFound()
        End If
        ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", status.StrategicActionID)
        Return View(status)
    End Function

    '
    ' POST: /Status/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal status As Status) As ActionResult
        If ModelState.IsValid Then
            status.DateTime = Date.Now
            status.StatusUser = User.Identity.Name
            db.Entry(status).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Details", "StrategicActivity", New With {.id = status.StrategicActionID})
        End If

        ViewBag.StrategicActionID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", status.StrategicActionID)
        Return View(status)
    End Function

    '
    ' GET: /Status/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim status As Status = db.Status.Find(id)
        If IsNothing(status) Then
            Return HttpNotFound()
        End If
        Return View(status)
    End Function

    '
    ' POST: /Status/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As ActionResult
        Dim status As Status = db.Status.Find(id)
        db.Status.Remove(status)
        db.SaveChanges()
        Return RedirectToAction("Details", "StrategicActivity", New With {.id = status.StrategicActionID})
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class