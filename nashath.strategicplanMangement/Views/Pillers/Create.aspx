<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Pillers)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Create New Piller</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

  
    <div class="editor-label" dir="ltr">
           Piller No.
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.PillerNo, New With {.dir = "ltr", .type = "number"})%>
            <%: Html.ValidationMessageFor(Function(model) model.PillerNo) %>
        </div>
        <div class="editor-label">
          Piller DV
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(Function(model) model.PillerDV) %>
            <%: Html.ValidationMessageFor(Function(model) model.PillerDV) %>
        </div>

        <div class="editor-label">
           Piller EN
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.PillerEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.PillerEN) %>
        </div>

        <div class="editor-label">
            Strategic Goal DV
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.PillerDescDV)%>
            <%: Html.ValidationMessageFor(Function(model) model.PillerDescDV) %>
        </div>

        <div class="editor-label">
           Strategic Goal EN
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(Function(model) model.PillerDescEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.PillerDescEN) %>
        </div>

        

        <p>
            <input type="submit" value="Create" class="button" />
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
