<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.Status))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(Function(model) model.StrategicActivity.ActivityDV) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(Function(model) model.DateTime) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(Function(model) model.StatusDV) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(Function(model) model.StatusEN) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(Function(model) model.StatusUser) %>
        </th>
        <th></th>
    </tr>

<% For Each item In Model %>
    <% Dim currentItem = item %>
    <tr>
        <td>
            <%: Html.DisplayFor(Function(modelItem) currentItem.StrategicActivity.ActivityDV) %>
        </td>
        <td>
            <%: Html.DisplayFor(Function(modelItem) currentItem.DateTime) %>
        </td>
        <td>
            <%: Html.DisplayFor(Function(modelItem) currentItem.StatusDV) %>
        </td>
        <td>
            <%: Html.DisplayFor(Function(modelItem) currentItem.StatusEN) %>
        </td>
        <td>
            <%: Html.DisplayFor(Function(modelItem) currentItem.StatusUser) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", New With {.id = currentItem.Id}) %> |
            <%: Html.ActionLink("Details", "Details", New With {.id = currentItem.Id}) %> |
            <%: Html.ActionLink("Delete", "Delete", New With {.id = currentItem.Id}) %>
        </td>
    </tr>
<% Next %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
