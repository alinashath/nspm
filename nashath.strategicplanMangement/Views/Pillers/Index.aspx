<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.Pillers))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="width:100%;">ތަނބުތައް   <span dir="ltr" style="text-align :left;float:left;font-size:12px;"><% If User.IsInRole("PlanningAdmin") Then%><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus"/> </a></span><% End If%></h2>

<p dir="ltr" style="text-align :left">
    
   
</p>
<table style="width:100%;font-size:18px;" id="mtable">
   

<% For Each item In Model %>
    <% Dim currentItem = item %>
    <tr>

         <td style="width:50%;">

            <div class="dv"> <% Dim strips As String = " ތަނބު " & currentItem.PillerNo & " : " & currentItem.PillerDV%>
                   <%: Html.ActionLink(strips, "Details", New With {.id = currentItem.Id})%>
            </div>
             </td>
        <td width:50%;>
              <div class="en" dir="ltr"> <% Dim stripsEN As String = " Piller " & currentItem.PillerNo & " : " & currentItem.PillerEN%>
                     <%: Html.ActionLink(stripsEN, "Details", New With {.id = currentItem.Id})%>
              </div>
           
       
   
    </tr>
    <% If User.IsInRole("PlanningAdmin") Then%>
    <tr>
        <td colspan ="2"  dir="ltr" style="text-align :center;font-size:10px;">
              <%: Html.ActionLink(" - ", "Delete", New With {.id = currentItem.Id}, New With {.class = "icon icon-trash"})%>  
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItem.Id}, New With {.class = "icon icon-edit"})%>  
          
        </td>
    </tr>
    <% End If%>
<% Next %>

</table>
   

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
      <h3 style="padding:10px;"><span class="en" style="float:left;">Piller</span><span class="dv" style="float:right;margin-bottom :11px;">ތަނބުތައް</span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
