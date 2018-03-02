<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.StrategicAction))" %>

<%@ Import Namespace="nashath.strategicplanManagement" %>

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
<h2 style="width:100%;">އެކްޝަންތައް   <span dir="ltr" style="text-align :left;float:left;font-size:12px;"><% If User.IsInRole("PlanningAdmin") Then%><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus"/> </a></span><% End If%></h2>


     <form action="" method="post" style="float:left;">
      
        <% Dim sec = DirectCast(ViewData("Strategies-filter"), List(Of Strategy))%>
         <span dir="ltr"style="padding:5px;margin:5px;text-align :center; float:left;">Strategy:</span> 
        <select name="opt" dir="ltr" name="id" style="width:300px;padding:5px;margin:5px;text-align :center;float:left;" >
            <option value="-1">All</option>
            <% For Each n In sec%>
            <option value="<%: n.Id%>"><%: n.RefCode%></option>
            <% Next%>
        </select>
        <input type="submit" value="Filter" class="button" style="float:left;margin:5px;padding:2px;min-width:50px;" />
    </form> 
    

<table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
    
<% Dim q = DirectCast(ViewData("Strategies"), List(Of Strategy))
    For Each r In q%>
    <tr style="font-size :16px;">
        <td class="dv" style="width:50%;" colspan="3"><%: "ސްޓްރެޓެޖީ " & r.RefCode & " - " & r.StrategyDV%></td>
         <td class="en" dir="ltr" style="width:50%;" colspan="3"><%:"Strategy " & r.RefCode & " - " & r.StrategyEN%></td>
    </tr>

    <% For Each item In Model%>
    <% Dim currentItem = item
        If currentItem.StrategyID = r.Id Then
        %>
    <tr style="">
        <td class="dv" style="width:5%;vertical-align :top;"></td> 
       <td class="dv" style="width:5%;vertical-align :top;"> 
           
            <%: Html.ActionLink(currentItem.RefCode, "Details", New With {.id = currentItem.Id})%>
       </td>
        <td class="dv" style="width:40%;vertical-align :top;">
            <%: Html.DisplayFor(Function(modelItem) currentItem.ActionDV)%>
        </td>
       
        <td class="en" dir="ltr" style="width:40%;vertical-align :top;">
            <%: Html.DisplayFor(Function(modelItem) currentItem.ActionEN)%>
        </td>
         
         <td class="en" dir="ltr" style="width:5%;vertical-align :top;">
                         <%: Html.ActionLink(currentItem.RefCode, "Details", New With {.id = currentItem.Id})%>
        </td>
        <td class="dv" style="width:5%;vertical-align :top;font-size:10px;">

            <% If User.IsInRole("PlanningAdmin") Then%>
               <%: Html.ActionLink("  ", "Delete", New With {.id = currentItem.Id}, New With {.class = "icon icon-trash"})%> &nbsp;&nbsp
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItem.Id}, New With {.class = "icon icon-edit"})%>  
            <% End If%>
          
        </td> 
       </tr>
  
<% End If
Next%>

<% Next%>


</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
      <h3 style="padding:10px;"><span class="en" style="float:left;">Strategic Action</span><span class="dv" style="float:right;margin-bottom :11px;">ސްޓްރެޓެޖިކް އެކްޝަން</span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
