Imports System.Data.Entity

Public Class SectionController
    Inherits System.Web.Mvc.Controller

    Private db As New StrategicPlanEntities

    '
    ' GET: /Section/

    Function Index() As ActionResult
        Return View(db.Sections.ToList())
    End Function

    '
    ' GET: /Section/Details/5

    Function Details(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim section As Section = db.Sections.Find(id)
        If IsNothing(section) Then
            Return HttpNotFound()
        End If
        Return View(section)
    End Function

    '
    ' GET: /Section/Create
    <Authorize(Roles:="PlanningAdmin")> _
    Function Create() As ActionResult
        Return View()
    End Function

    '
    ' POST: /Section/Create

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Create(ByVal section As Section) As ActionResult
        If ModelState.IsValid Then
            db.Sections.Add(section)
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        Return View(section)
    End Function

    '
    ' GET: /Section/Edit/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim section As Section = db.Sections.Find(id)
        If IsNothing(section) Then
            Return HttpNotFound()
        End If
        Return View(section)
    End Function

    '
    ' POST: /Section/Edit/5

    <HttpPost()> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function Edit(ByVal section As Section) As ActionResult
        If ModelState.IsValid Then
            db.Entry(section).State = EntityState.Modified
            db.SaveChanges()
            Return RedirectToAction("Index")
        End If

        Return View(section)
    End Function

    '
    ' GET: /Section/Delete/5
    <Authorize(Roles:="PlanningAdmin")> _
    Function Delete(Optional ByVal id As Integer = Nothing) As ActionResult
        Dim section As Section = db.Sections.Find(id)
        If IsNothing(section) Then
            Return HttpNotFound()
        End If
        Return View(section)
    End Function

    '
    ' POST: /Section/Delete/5

    <HttpPost()> _
    <ActionName("Delete")> _
    <ValidateAntiForgeryToken()> _
     <Authorize(Roles:="PlanningAdmin")> _
    Function DeleteConfirmed(ByVal id As Integer) As RedirectToRouteResult
        Dim section As Section = db.Sections.Find(id)
        db.Sections.Remove(section)
        db.SaveChanges()
        Return RedirectToAction("Index")
    End Function

    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        db.Dispose()
        MyBase.Dispose(disposing)
    End Sub

End Class