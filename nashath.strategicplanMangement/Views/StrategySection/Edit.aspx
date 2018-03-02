<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.StrategySection)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Edit Section to Strategy</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

    <fieldset dir="ltr">
        <legend>StrategySection</legend>

        <%: Html.HiddenFor(Function(model) model.Id) %>

        <div class="editor-label">
           Strategic Action
        </div>
         <div class="editor-field">
            <%: Html.DropDownList("StrategyID", String.Empty) %>
            <%: Html.ValidationMessageFor(Function(model) model.StrategyID) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(Function(model) model.SectionID, "Section") %>
        </div>
         <div class="editor-field">
            <%: Html.DropDownList("SectionID", String.Empty) %>
            <%: Html.ValidationMessageFor(Function(model) model.SectionID) %>
        </div>

        <p>
            <input type="submit" value="Save" class="button"  />
        </p>
    </fieldset>
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
