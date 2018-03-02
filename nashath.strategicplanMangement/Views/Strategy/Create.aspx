<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Strategy)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Create Strategy</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

    
        <div class="editor-label">
            Code
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.RefCode, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.RefCode)%>
        </div>

        <div class="editor-label">
           Strategy DV
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.StrategyDV)%>
            <%: Html.ValidationMessageFor(Function(model) model.StrategyDV) %>
        </div>

        <div class="editor-label">
            Strategy EN
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.StrategyEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.StrategyEN) %>
        </div>

        <div class="editor-label">
            Strategy Result
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.Result, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.Result) %>
        </div>

        <div class="editor-label">
           Piller
        </div>
        <div class="editor-field" dir="ltr">
            <%: Html.DropDownList("PillerID", String.Empty)%>
            <%: Html.ValidationMessageFor(Function(model) model.PillerID) %>
        </div>

        <p>
            <input type="submit" value="Create" class="button" />
        </p>
   
<% End Using %>

<div>
   <%: Html.ActionLink("Back to List", "Details", "StrategicActivity", New With {.id = RouteData.ToString()}, "")%>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
