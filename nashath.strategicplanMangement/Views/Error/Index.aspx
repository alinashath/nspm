<%@ Page Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Application Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title" dir="ltr">
        <h1 class="error" dir="ltr">Error.</h1>
        <h2 class="error" dir="ltr">An error occurred while processing your request.</h2>
    </hgroup>
</asp:Content>
