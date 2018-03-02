<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Schedule)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Schedule</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.StrategicActivity.ActivityDV) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.StrategicActivity.ActivityDV) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Year) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Year) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Qt_One) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Qt_One) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Qt_Two) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Qt_Two) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Qt_Three) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Qt_Three) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(Function(model) model.Qt_Four) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.Qt_Four) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", New With {.id = Model.Id}) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
