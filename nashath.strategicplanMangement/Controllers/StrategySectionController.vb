Imports System.Data.Entity

Public Class StrategySectionController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /StrategySection/



    Function Index(Optional section As Integer = -1) As ActionResult

        Dim comparer = New StringNumberComparer()

        ViewData("Sections") = db.Sections.ToList()

        Dim r = db.StrategicActions.ToList()
        Dim m = r.ToList()
        If section <> -1 Then
            m.Clear()


            For Each q In r
                For Each l In q.StrategySections
                    If l.SectionID = section Then
                        m.Add(q)
                        Exit For
                    End If
                Next
            Next
            ViewData("St") = m.OrderBy(Function(x) x.RefCode, comparer)
            Dim strategysections = db.StrategySections.Include(Function(s) s.Section).Include(Function(s) s.StrategicAction).ToList().Where(Function(x) x.SectionID = section).ToList().OrderBy(Function(x) x.StrategicAction.RefCode, comparer)

            Return View(strategysections)
        Else

            ViewData("St") = db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer)
            Dim strategysections = db.StrategySections.Include(Function(s) s.Section).Include(Function(s) s.StrategicAction).ToList().OrderBy(Function(x) x.StrategicAction.RefCode, comparer).ToList()
            Return View(strategysections)
        End If



       

    End Function

   
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create() As ActionResult

        Dim comparer = New StringNumberComparer()

        ViewBag.SectionID = New SelectList(db.Sections, "Id", "SectionNameEN")
        ViewBag.StrategyID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode")
        Return View()
    End Function

    '
    ' POST: /StrategySection/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal strategysection As StrategySection) As ActionResult
        If ModelState.IsValid Then
            db.StrategySections.Add(strategysection)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        Dim comparer = New StringNumberComparer()

        ViewBag.SectionID = New SelectList(db.Sections, "Id", "SectionNameEN", strategysection.SectionID)
        ViewBag.StrategyID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategysection.StrategyID)
        Return View(strategysection)
    End Function

    '
    ' GET: /StrategySection/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategysection As StrategySection = db.StrategySections.Find(id)

        Dim comparer = New StringNumberComparer()


        If IsNothing(strategysection) Then
            Return HttpNotFound()
        End If
        ViewBag.SectionID = New SelectList(db.Sections, "Id", "SectionNameEN", strategysection.SectionID)
        ViewBag.StrategyID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategysection.StrategyID)
        Return View(strategysection)
    End Function

    '
    ' POST: /StrategySection/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal strategysection As StrategySection) As ActionResult
        If ModelState.IsValid Then
            db.Entry(strategysection).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If
        Dim comparer = New StringNumberComparer()

        ViewBag.SectionID = New SelectList(db.Sections, "Id", "SectionNameEN", strategysection.SectionID)
        ViewBag.StrategyID = New SelectList(db.StrategicActions.ToList().OrderBy(Function(x) x.RefCode, comparer), "Id", "RefCode", strategysection.StrategyID)
        Return View(strategysection)
    End Function

    '
    ' GET: /StrategySection/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim strategysection As StrategySection = db.StrategySections.Find(id)
        If IsNothing(strategysection) Then
            Return HttpNotFound()
        End If
        Return View(strategysection)
    End Function

    '
    ' POST: /StrategySection/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim strategysection As StrategySection = db.StrategySections.Find(id)
        db.StrategySections.Remove(strategysection)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class