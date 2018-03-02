<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Status)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Delete</h2>

<h3 dir="ltr">Are you sure you want to delete this?</h3>
<fieldset dir="ltr">
    <legend>Status</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StrategicActivity.ActivityDV) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StrategicActivity.ActivityDV) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.DateTime) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.DateTime) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StatusDV) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StatusDV) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StatusEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StatusEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StatusUser) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StatusUser) %>
    </div>
</fieldset>
<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" class="button" /> |
        <%: Html.ActionLink("Back to List", "Details", "StrategicActivity", New With {.id = Model.StrategicActionID}, "")%>
    </p>
<% End Using %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
