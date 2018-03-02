<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.StrategicAction)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <p style="text-align :center;width:100%;font-size:12px;">
        <span dir="ltr" style="text-align :center;width:100%;font-size:12px;">
             <%: Html.ActionLink("  ", "Edit", New With {.id = Model.Id}, New With {.class = "icon icon-edit"})%>    
            &nbsp;&nbsp;
              <%: Html.ActionLink("  ", "Index", Nothing, New With {.class = "icon icon-list-ol"})%>
            </span> 
</p>

    <table style="width:100%;">
        <tr >
            <td style="width:40%;font-size:26px;" class="dv">ޒިންމާވާ ޑިވިޜަން / ސެކްޝަން</td>
            <td style="width:10%;"></td>
             <td style="width:40%;font-size:26px;" class="en" dir="ltr">Responsible Section/Division</td>
        </tr>
   
    <% For Each n In Model.StrategySections%>
    <tr>
        <td class="dv" style="vertical-align :top;">

              <div class="dv" > <% Dim strips As String = n.Section.SectionNameDV%>
                   <%: Html.ActionLink(strips, "Details", "StrategySection", New With {.id = n.Id}, "")%>
            </div>
        </td>
        <td style="text-align :center;font-size:10px;">
               <%: Html.ActionLink("  ", "Delete", "StrategySection", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "StrategySection", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
        </td>
          <td class="en" dir="ltr">   <div class="en"> <% Dim stripsEN As String = n.Section.SectionNameEN%>
                   <%: Html.ActionLink(stripsEN, "Details", "StrategySection", New With {.id = n.Id}, "")%>
            </div></td>
        
    </tr>
        
     <% Next%>
     </table>


    <table style="width:100%;">
        <tr >
            <td style="width:50%;font-size:26px;" class="dv">ހަރަކާތް</td>
             <td style="width:50%;font-size:26px;" class="en" dir="ltr">Activity</td>
        </tr>
   
    <% For Each n In Model.StrategicActivities%>
    <tr>
        <td class="dv" style="vertical-align :top;">

              <div class="dv" > <% Dim strips As String = IIf(IsNothing(n.ActivityDV), "", n.ActivityDV)%>
                   <%: Html.ActionLink(strips, "Details", "StrategicActivity", New With {.id = n.Id}, "")%>
            </div>
        </td>
          <td class="en" dir="ltr">   <div class="en"> <% Dim stripsEN As String = IIf(IsNothing(n.ActivityEN), "-", n.ActivityEN)%>
                   <%: Html.ActionLink(stripsEN, "Details", "StrategicActivity", New With {.id = n.Id}, "")%>
            </div></td>
    </tr>
        <tr>
            <td colspan="2" dir="ltr" style="text-align :center;font-size:10px;">
                <%: Html.ActionLink("  ", "Delete", "StrategicActivity", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "StrategicActivity", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
            </td>
        </tr>

     <% Next%>
     </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding:10px;"><span class="en" style="float:left;">Strategic Action</span><span class="dv" style="float:right;">ސްޓްރެޓެޖިކް އެކްޝަން</span></h3>
    <div class="display-field dv" style="padding:20px;">
        <h2> <%: Html.DisplayFor(Function(model) model.RefCode)%> : <%: Html.DisplayFor(Function(model) model.ActionDV)%></h2>
         
    </div>
    <div class="display-field en" style="padding:20px;" dir="ltr">
        <h2> <%: Html.DisplayFor(Function(model) model.RefCode)%> : <%: Html.DisplayFor(Function(model) model.ActionEN)%></h2>
        
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>

