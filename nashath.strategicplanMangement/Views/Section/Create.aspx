<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Section)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<h2 dir="ltr">Add Section</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

   

        <div class="editor-label">
            Section Name DV
        </div>
        <div class="editor-field dv">
            <%: Html.EditorFor(Function(model) model.SectionNameDV) %>
            <%: Html.ValidationMessageFor(Function(model) model.SectionNameDV) %>
        </div>

        <div class="editor-label">
          Section Name EN
        </div>
        <div class="editor-field en">
            <%: Html.TextBoxFor(Function(model) model.SectionNameEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.SectionNameEN) %>
        </div>

        <p>
            <input type="submit" value="Create" class="button"/>
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
