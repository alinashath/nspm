<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Schedule)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Edit Schedule</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

 

        <%: Html.HiddenFor(Function(model) model.Id) %>

        <div class="editor-field">
            <%: Html.DropDownList("StrategicActivityID", String.Empty) %>
            <%: Html.ValidationMessageFor(Function(model) model.StrategicActivityID) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(Function(model) model.Year) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.Year, New With {.dir = "ltr", .type = "number"})%>
            <%: Html.ValidationMessageFor(Function(model) model.Year) %>
        </div>

        <div class="editor-label">
           Quater One
        </div>
        <div class="editor-field" dir="ltr">
            <%: Html.EditorFor(Function(model) model.Qt_One) %>
            <%: Html.ValidationMessageFor(Function(model) model.Qt_One) %>
        </div>

        <div class="editor-label">
           Quater Two
        </div>
        <div class="editor-field" dir="ltr">
            <%: Html.EditorFor(Function(model) model.Qt_Two) %>
            <%: Html.ValidationMessageFor(Function(model) model.Qt_Two) %>
        </div>

        <div class="editor-label" >
          Quater Three
        </div>
        <div class="editor-field" dir="ltr">
            <%: Html.EditorFor(Function(model) model.Qt_Three) %>
            <%: Html.ValidationMessageFor(Function(model) model.Qt_Three) %>
        </div>

        <div class="editor-label">
          Quater Four
        </div>
        <div class="editor-field" dir="ltr">
            <%: Html.EditorFor(Function(model) model.Qt_Four) %>
            <%: Html.ValidationMessageFor(Function(model) model.Qt_Four) %>
        </div>


        <p>
            <input type="submit" value="Save" class="button" />
        </p>
   
<% End Using %>

<div>
    <%: Html.ActionLink("Back to List", "Details", "StrategicActivity", New With {.id = Model.StrategicActivityID}, "")%>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
