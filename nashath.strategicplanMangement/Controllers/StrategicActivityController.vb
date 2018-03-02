Imports System.Data.Entity

Public Class StrategicActivityController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /StategicActivity/

    Function Index() As ActionResult

        Dim comparer = New StringNumberComparer()

        Dim strategicactivities = db.StrategicActivities.Include(Function(s) s.StrategicAction).ToList().OrderBy(Function(x) x.StrategicAction.Strategy.Piller.PillerNo, comparer) _
                        .OrderBy(Function(x) x.StrategicAction.Strategy.RefCode, comparer) _
                        .OrderBy(Function(x) x.StrategicAction.RefCode, comparer)
        Return View(strategicactivities.ToList())
    End Function

    '
    ' GET: /StategicActivity/Details/5

    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicactivity As StrategicActivity = db.StrategicActivities.Find(id)
        If IsNothing(strategicactivity) Then
            Return HttpNotFound()
        End If
        Return View(strategicactivity)
    End Function

    '
    ' GET: /StategicActivity/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create() As ActionResult
        Dim comparer = New StringNumberComparer()
        ViewBag.StrategicActionID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode")
        Return View()
    End Function

    '
    ' POST: /StategicActivity/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal strategicactivity As StrategicActivity) As ActionResult
        If ModelState.IsValid Then
            db.StrategicActivities.Add(strategicactivity)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If
        Dim comparer = New StringNumberComparer()
        ViewBag.StrategicActionID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategicactivity.StrategicActionID)
        Return View(strategicactivity)
    End Function

    '
    ' GET: /StategicActivity/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicactivity As StrategicActivity = db.StrategicActivities.Find(id)
        If IsNothing(strategicactivity) Then
            Return HttpNotFound()
        End If
        Dim comparer = New StringNumberComparer()
        ViewBag.StrategicActionID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategicactivity.StrategicActionID)
        Return View(strategicactivity)
    End Function

    '
    ' POST: /StategicActivity/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal strategicactivity As StrategicActivity) As ActionResult
        If ModelState.IsValid Then
            db.Entry(strategicactivity).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If
        Dim comparer = New StringNumberComparer()
        ViewBag.StrategicActionID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategicactivity.StrategicActionID)
        Return View(strategicactivity)
    End Function

    '
    ' GET: /StategicActivity/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicactivity As StrategicActivity = db.StrategicActivities.Find(id)
        If IsNothing(strategicactivity) Then
            Return HttpNotFound()
        End If
        Return View(strategicactivity)
    End Function

    '
    ' POST: /StategicActivity/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim strategicactivity As StrategicActivity = db.StrategicActivities.Find(id)
        db.StrategicActivities.Remove(strategicactivity)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class