<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Pillers)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>ފޮހެލުމަށް</h2>

<h3>މިތަނބު ފޮހެލަންވީތޯ؟</h3>
<fieldset>
    <legend>ތަނބު</legend>

    <div class="display-label">
       ތަނބު ދިވެހިން
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.PillerDV) %>
    </div>

    <div class="display-label">
       ތަނބު އިގިރޭސިން
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.PillerEN) %>
    </div>

    <div class="display-label">
      ތަފްސީލު
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.PillerDescDV) %>
    </div>

    <div class="display-label">
       ތަފްސީލު އިގިރޭސިން
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.PillerDescEN) %>
    </div>

    <div class="display-label">
       ތަނބުނަންބަރު
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(Function(model) model.PillerNo) %>
    </div>
</fieldset>
<% Using Html.BeginForm() %>
    <%: Html.AntiForgeryToken() %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("ތަނބުތަކުގެ ލިސްޓް", "Index") %>
    </p>
<% End Using %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
