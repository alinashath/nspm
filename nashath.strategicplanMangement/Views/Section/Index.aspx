<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.Section))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
        table {
            border: 1px solid #dcdcdc;
        }

        td {
            border: 1px solid #dcdcdc;
            padding: 5px;
        }

        th {
            border-left: 1px solid #dcdcdc;
            border-right: 1px solid #dcdcdc;
        }

        #portfolio .icon {
           
             margin-bottom: 0em; 
            font-size: 12px;
          
        }
    </style>
<h2 style="width:100%;">ސެކްޝަންތައް   <span dir="ltr" style="text-align :left;float:left;font-size:12px;"><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus"/> </a></span></h2>

<table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
    <tr>
        <th colspan ="2" style="width:90%;">
           ސެކްޝަން
        </th>
        <th></th>
    </tr>
    <tr>
        <th colspan ="2" style="width:90%;">
           Section
        </th>
        <th></th>
    </tr>

<% For Each item In Model %>
    <% Dim currentItem = item %>
    <tr>
        <td style="width:45%;">
            <%: Html.DisplayFor(Function(modelItem) currentItem.SectionNameDV) %>
        </td>
        <td class="en">
            <%: Html.DisplayFor(Function(modelItem) currentItem.SectionNameEN) %>
        </td>
         <td colspan ="6" style="text-align :center;font-size:10px;">
                <%: Html.ActionLink("  ", "Delete", New With {.id = currentItem.Id}, New With {.class = "icon icon-trash"})%> &nbsp;&nbsp
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItem.Id}, New With {.class = "icon icon-edit"})%>  
          
         
        </td>
    </tr>
<% Next %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
