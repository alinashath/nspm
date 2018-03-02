<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Strategy)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Delete</h2>

<h3 dir="ltr">Are you sure you want to delete this?</h3>
<fieldset dir="ltr">
    <legend>Strategy</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.RefCode) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.RefCode) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StrategyDV) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StrategyDV) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StrategyEN) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StrategyEN) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Result) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Result) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Piller.PillerDV) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Piller.PillerDV) %>
    </div>
</fieldset>
<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% End Using %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
