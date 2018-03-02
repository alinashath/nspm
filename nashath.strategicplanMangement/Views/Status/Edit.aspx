<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Status)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 dir="ltr">Edit Activity Status</h2>

<%-- The following line works around an ASP.NET compiler warning --%>
<%: "" %>

<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(True) %>

  

        <%: Html.HiddenFor(Function(model) model.Id) %>

      
        <div class="editor-label">
            <%: Html.LabelFor(Function(model) model.StrategicActionID, "StrategicActivity") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("StrategicActionID", String.Empty) %>
            <%: Html.ValidationMessageFor(Function(model) model.StrategicActionID) %>
        </div>

        
       
          <input  id="DateTime" name="DateTime" type="hidden" value="1990-01-01" />
         

         
        <div class="editor-label">
            Status DV
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(Function(model) model.StatusDV) %>
            <%: Html.ValidationMessageFor(Function(model) model.StatusDV) %>
        </div>

        <div class="editor-label">
           Status EN
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(Function(model) model.StatusEN, New With {.dir = "ltr"})%>
            <%: Html.ValidationMessageFor(Function(model) model.StatusEN) %>
        </div>

     
          <input id="StatusUser" name="StatusUser" type="hidden" value="User" />


        <p>
            <input type="submit" value="Save" class="button" />
        </p>
    
<% End Using %>

<div>
      <%: Html.ActionLink("Back to List", "Details", "StrategicActivity", New With {.id = Model.StrategicActionID}, "")%>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
