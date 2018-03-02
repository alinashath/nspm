Imports System.Data.Entity

Public Class WorkPlanController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /WorkPaln/

    Function Index(Optional id As Integer = 0, Optional section As Integer = -1) As ActionResult
        If id = 0 Then
            id = Date.Now.Year

        End If
        ViewData("Year") = id
        ViewData("Sections") = db.Sections.ToList()

        Dim comparer = New StringNumberComparer()

        Dim schedules = db.Schedules.Include(Function(s) s.StrategicActivity).Where(Function(s) s.Year = id).ToList().OrderBy(Function(x) x.StrategicActivity.StrategicAction.Strategy.Piller.PillerNo, comparer) _
                            .OrderBy(Function(x) x.StrategicActivity.StrategicAction.Strategy.RefCode, comparer) _
                            .OrderBy(Function(x) x.StrategicActivity.StrategicAction.RefCode, comparer)

        Dim l = schedules.ToList()
        If section <> -1 Then
            l.Clear()
            For Each n In schedules
                For Each q In n.StrategicActivity.StrategicAction.StrategySections
                    If q.SectionID = section Then
                        l.Add(n)
                        Exit For
                    End If
                Next
            Next

            Return View(l)
        Else




        End If
        Return View(schedules.ToList())
    End Function

    '
    ' GET: /WorkPaln/Details/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim schedule As Schedule = db.Schedules.Find(id)
        If IsNothing(schedule) Then
            Return HttpNotFound()
        End If
        Return View(schedule)
    End Function

    '
    ' GET: /WorkPaln/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create(Optional id As Integer = 0) As ActionResult
        If id <> 0 Then
            ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", id)

        Else
            ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV")
        End If

        Return View()
    End Function

    '
    ' POST: /WorkPaln/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal schedule As Schedule, Optional id As Integer = 0) As ActionResult
        If ModelState.IsValid Then
            db.Schedules.Add(schedule)
            db.SaveChanges()

            If id <> 0 Then
                Return RedirectToAction("Details", "StrategicActivity", New With {.id = id})
            End If
            Return RedirectToAction("Index")
        End If


        If id <> 0 Then
            ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", id)

        Else
            ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV")
            Return View(schedule)
        End If



    End Function

    '
    ' GET: /WorkPaln/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim schedule As Schedule = db.Schedules.Find(id)
        If IsNothing(schedule) Then
            Return HttpNotFound()
        End If
        ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", schedule.StrategicActivityID)
        Return View(schedule)
    End Function

    '
    ' POST: /WorkPaln/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal schedule As Schedule) As ActionResult
        If ModelState.IsValid Then
            db.Entry(schedule).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Details", "StrategicActivity", New With {.id = schedule.StrategicActivityID})
        End If

        ViewBag.StrategicActivityID = New SelectList(db.StrategicActivities, "Id", "ActivityDV", schedule.StrategicActivityID)
        Return View(schedule)
    End Function

    '
    ' GET: /WorkPaln/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim schedule As Schedule = db.Schedules.Find(id)
        If IsNothing(schedule) Then
            Return HttpNotFound()
        End If
        Return View(schedule)
    End Function

    '
    ' POST: /WorkPaln/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim schedule As Schedule = db.Schedules.Find(id)
        db.Schedules.Remove(schedule)
        db.SaveChanges()
        Return RedirectToAction("Details", "StrategicActivity", New With {.id = schedule.StrategicActivityID})
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class