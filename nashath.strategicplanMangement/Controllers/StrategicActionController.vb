Imports System.Data.Entity

Public Class StrategicActionController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /StategicAction/

    Function Index(Optional opt As Integer = -1) As ActionResult

        Dim comparer = New StringNumberComparer()
        ViewData("Strategies-filter") = db.Strategies.OrderBy(Function(x) x.Piller.PillerNo).OrderBy(Function(x) x.RefCode).ToList()

        If opt <> -1 Then
            ViewData("Strategies") = db.Strategies.OrderBy(Function(x) x.Piller.PillerNo).OrderBy(Function(x) x.RefCode).ToList().Where(Function(x) x.Id = opt).ToList()
            Dim strategicactions = db.StrategicActions.Include(Function(s) s.Strategy).ToList().OrderBy(Function(x) x.Strategy.Piller.PillerNo, comparer).OrderBy(Function(s) s.Strategy.RefCode, comparer).OrderBy(Function(s) s.RefCode, comparer).Where(Function(x) x.StrategyID = opt).ToList()

            Return View(strategicactions.ToList())
        Else
            ViewData("Strategies") = db.Strategies.OrderBy(Function(x) x.Piller.PillerNo).OrderBy(Function(x) x.RefCode).ToList()
            Dim strategicactions = db.StrategicActions.Include(Function(s) s.Strategy).ToList().OrderBy(Function(x) x.Strategy.Piller.PillerNo, comparer).OrderBy(Function(s) s.Strategy.RefCode, comparer).OrderBy(Function(s) s.RefCode, comparer)

            Return View(strategicactions.ToList())
        End If

      
    End Function

    '
    ' GET: /StategicAction/Details/5

    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicaction As StrategicAction = db.StrategicActions.Find(id)
        If IsNothing(strategicaction) Then
            Return HttpNotFound()
        End If
        Return View(strategicaction)
    End Function

    '
    ' GET: /StategicAction/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create() As ActionResult
        ViewBag.StrategyID = New SelectList(db.Strategies, "Id", "RefCode")
        Return View()
    End Function

    '
    ' POST: /StategicAction/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal strategicaction As StrategicAction) As ActionResult
        If ModelState.IsValid Then
            db.StrategicActions.Add(strategicaction)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        ViewBag.StrategyID = New SelectList(db.Strategies, "Id", "RefCode", strategicaction.StrategyID)
        Return View(strategicaction)
    End Function

    '
    ' GET: /StategicAction/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicaction As StrategicAction = db.StrategicActions.Find(id)
        If IsNothing(strategicaction) Then
            Return HttpNotFound()
        End If
        ViewBag.StrategyID = New SelectList(db.Strategies, "Id", "RefCode", strategicaction.StrategyID)
        Return View(strategicaction)
    End Function

    '
    ' POST: /StategicAction/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal strategicaction As StrategicAction) As ActionResult
        If ModelState.IsValid Then
            db.Entry(strategicaction).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        ViewBag.StrategyID = New SelectList(db.Strategies, "Id", "RefCode", strategicaction.StrategyID)
        Return View(strategicaction)
    End Function

    '
    ' GET: /StategicAction/Delete/5

    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategicaction As StrategicAction = db.StrategicActions.Find(id)
        If IsNothing(strategicaction) Then
            Return HttpNotFound()
        End If
        Return View(strategicaction)
    End Function

    '
    ' POST: /StategicAction/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim strategicaction As StrategicAction = db.StrategicActions.Find(id)
        db.StrategicActions.Remove(strategicaction)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class