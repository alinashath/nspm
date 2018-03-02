Imports System.Data.Entity

Public Class PillersController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /Pillers/

    Function Index() As ActionResult
        Dim comparer = New StringNumberComparer()

        Return View(db.Pillers.ToList().OrderBy(Function(x) x.PillerNo, comparer))
    End Function

    '
    ' GET: /Pillers/Details/5

    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult

        
        Dim pillers As Pillers = db.Pillers.Find(id)
        If IsNothing(pillers) Then
            Return HttpNotFound()
        End If
        Return View(pillers)
    End Function

    '
    ' GET: /Pillers/Create

    Function Create() As ActionResult
        Return View()
    End Function

    '
    ' POST: /Pillers/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
    Function Create(ByVal pillers As Pillers) As ActionResult
        If ModelState.IsValid Then
            db.Pillers.Add(pillers)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        Return View(pillers)
    End Function

    '
    ' GET: /Pillers/Edit/5

    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim pillers As Pillers = db.Pillers.Find(id)
        If IsNothing(pillers) Then
            Return HttpNotFound()
        End If
        Return View(pillers)
    End Function

    '
    ' POST: /Pillers/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal pillers As Pillers) As ActionResult
        If ModelState.IsValid Then
            db.Entry(pillers).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        Return View(pillers)
    End Function

    '
    ' GET: /Pillers/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim pillers As Pillers = db.Pillers.Find(id)
        If IsNothing(pillers) Then
            Return HttpNotFound()
        End If
        Return View(pillers)
    End Function

    '
    ' POST: /Pillers/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim pillers As Pillers = db.Pillers.Find(id)
        db.Pillers.Remove(pillers)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class