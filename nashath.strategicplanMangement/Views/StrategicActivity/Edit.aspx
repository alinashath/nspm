<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.StrategicActivity)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Edit Strategic Activity</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

   
        <%: Html.HiddenFor(Function(model) model.Id) %>

        <div class="editor-label">
          Strategic Action
        </div>
         <div class="editor-field" dir="ltr">
            <%: Html.DropDownList("StrategicActionID", String.Empty) %>
            <%: Html.ValidationMessageFor(Function(model) model.StrategicActionID) %>
        </div>

        <div class="editor-label">
           Activity DV
        </div>
         <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.ActivityDV)%>
            <%: Html.ValidationMessageFor(Function(model) model.ActivityDV) %>
        </div>

        <div class="editor-label">
           Activity EN
        </div>
         <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.ActivityEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.ActivityEN) %>
        </div>

        <div class="editor-label">
           Government Budget
        </div>
         <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.BudgetNB, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.BudgetNB)%>
        </div>

        <div class="editor-label">
           Grant
        </div>
         <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.BudgetGrant, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.BudgetGrant) %>
        </div>

        <p>
            <input type="submit" value="Save" class="button" />
        </p>
   
<% End Using %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
