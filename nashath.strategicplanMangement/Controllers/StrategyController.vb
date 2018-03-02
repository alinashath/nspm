Imports System.Data.Entity

Public Class StrategyController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /Strategy/

    Function Index(Optional opt As Integer = -1) As ActionResult

        Dim comparer = New StringNumberComparer()

        ViewData("Piller-filter") = db.Pillers.ToList()

        If opt <> -1 Then
            Dim strategies = db.Strategies.Include(Function(s) s.Piller).ToList().OrderBy(Function(x) x.Piller.PillerNo).OrderBy(Function(p) p.RefCode, comparer).Where(Function(x) x.PillerID = opt).ToList()
            ViewData("Pillers") = db.Pillers.Where(Function(x) x.Id = opt).ToList()
            Return View(strategies.ToList())
        Else

            Dim strategies = db.Strategies.Include(Function(s) s.Piller).ToList().OrderBy(Function(x) x.Piller.PillerNo).OrderBy(Function(p) p.RefCode, comparer)
            ViewData("Pillers") = db.Pillers.ToList()
            Return View(strategies.ToList())
        End If

       
    End Function

    '
    ' GET: /Strategy/Details/5

    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategy As Strategy = db.Strategies.Find(id)
        If IsNothing(strategy) Then
            Return HttpNotFound()
        End If
        Return View(strategy)
    End Function

    '
    ' GET: /Strategy/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create() As ActionResult
        ViewBag.PillerID = New SelectList(db.Pillers, "Id", "PillerEN")
        Return View()
    End Function

    '
    ' POST: /Strategy/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal strategy As Strategy) As ActionResult
        If ModelState.IsValid Then
            db.Strategies.Add(strategy)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        ViewBag.PillerID = New SelectList(db.Pillers, "Id", "PillerEN", strategy.PillerID)
        Return View(strategy)
    End Function

    '
    ' GET: /Strategy/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategy As Strategy = db.Strategies.Find(id)
        If IsNothing(strategy) Then
            Return HttpNotFound()
        End If
        ViewBag.PillerID = New SelectList(db.Pillers, "Id", "PillerEN", strategy.PillerID)
        Return View(strategy)
    End Function

    '
    ' POST: /Strategy/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal strategy As Strategy) As ActionResult
        If ModelState.IsValid Then
            db.Entry(strategy).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        ViewBag.PillerID = New SelectList(db.Pillers, "Id", "PillerEN", strategy.PillerID)
        Return View(strategy)
    End Function

    '
    ' GET: /Strategy/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategy As Strategy = db.Strategies.Find(id)
        If IsNothing(strategy) Then
            Return HttpNotFound()
        End If
        Return View(strategy)
    End Function

    '
    ' POST: /Strategy/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim strategy As Strategy = db.Strategies.Find(id)
        db.Strategies.Remove(strategy)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class