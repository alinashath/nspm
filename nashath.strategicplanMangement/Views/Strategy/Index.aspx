<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.Strategy))" %>

<%@ Import Namespace="nashath.strategicplanManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="width:100%;">ސްޓްރެޓެޖީތައް   <span dir="ltr" style="text-align :left;float:left;font-size:12px;"><% If User.IsInRole("PlanningAdmin") Then%><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus"/> </a></span><% End If%></h2>


 <form action="" method="post" style="float:left;">
      
        <% Dim sec = DirectCast(ViewData("Piller-filter"), List(Of Pillers))%>
         <span dir="ltr"style="padding:5px;margin:5px;text-align :center; float:left;">Piller:</span> 
        <select name="opt" dir="ltr" name="id" style="width:300px;padding:5px;margin:5px;text-align :center;float:left;" >
            <option value="-1">All</option>
            <% For Each n In sec%>
            <option value="<%: n.Id%>"><%: n.PillerNo%></option>
            <% Next%>
        </select>
        <input type="submit" value="Filter" class="button" style="float:left;margin:5px;padding:2px;min-width:50px;" />
    </form> 
    

<table style="width:100%;">
    
<% Dim q = DirectCast(ViewData("Pillers"), List(Of Pillers))
    For Each r In q%>
    <tr style="font-size :18px;">
        <td class="dv" style="width:50%;border-bottom:1px solid #808080" colspan="2"><%: "ތަނބު " & r.PillerNo & " - " & r.PillerDV%></td>
         <td class="en" dir="ltr" style="width:50%;border-bottom:1px solid #808080" colspan="2"><%:"Piller " & r.PillerNo & " - " & r.PillerEN%></td>
    </tr>

    <% For Each item In Model%>
    <% Dim currentItem = item
        If currentItem.PillerID = r.Id Then
        %>
    <tr style="">
       <td class="dv" style="width:5%;vertical-align :top;"> 
           
            <%: Html.ActionLink(currentItem.RefCode, "Details", New With {.id = currentItem.Id})%>
       </td>
        <td class="dv" style="width:45%;vertical-align :top;">
            <%: Html.DisplayFor(Function(modelItem) currentItem.StrategyDV) %>
        </td>
       
        <td class="en" dir="ltr" style="width:45%;vertical-align :top;">
            <%: Html.DisplayFor(Function(modelItem) currentItem.StrategyEN) %>
        </td>
         <td class="en" dir="ltr" style="width:5%;vertical-align :top;">
                         <%: Html.ActionLink(currentItem.RefCode, "Details", New With {.id = currentItem.Id})%>
        </td>
       </tr>
    <% If User.IsInRole("PlanningAdmin") Then%>
    <tr>
        <td colspan ="4" style="text-align :center;font-size:10px;">
                <%: Html.ActionLink("  ", "Delete", New With {.id = currentItem.Id}, New With {.class = "icon icon-trash"})%> &nbsp;&nbsp
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItem.Id}, New With {.class = "icon icon-edit"})%>  
          
         
        </td>
    </tr>
    <% End If%>
<% End If
Next%>

<% Next%>


</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
     <h3 style="padding:10px;"><span class="en" style="float:left;">Strategy</span><span class="dv" style="float:right;margin-bottom :11px;">ސްޓްރެޓެޖީ</span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
