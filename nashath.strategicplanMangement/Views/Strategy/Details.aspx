<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Strategy)" %>

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
    <p style="width:50%;font-size:26px;" class="dv">ނަތީޖާ</p>
    <p> <%: Html.DisplayFor(Function(model) model.Result)%></p>



    

    <table style="width:100%;">
        <tr >
            <td style="width:50%;font-size:26px;" class="dv">ސްޓްރެޓެޖީކް އެކްޝަންސް</td>
             <td style="width:50%;font-size:26px;" class="en" dir="ltr">Strategic Actions</td>
        </tr>
   
    <% For Each n In Model.StrategicActions%>
    <tr>
        <td class="dv" style="vertical-align :top;">

              <div class="dv" > <% Dim strips As String = n.RefCode & " - " & n.ActionDV%>
                   <%: Html.ActionLink(strips, "Details", "StrategicAction", New With {.id = n.Id}, "")%>
            </div>
        </td>
          <td class="en" dir="ltr">   <div class="en"> <% Dim stripsEN As String = n.RefCode & " - " & n.ActionEN%>
                   <%: Html.ActionLink(stripsEN, "Details", "StrategicAction", New With {.id = n.Id}, "")%>
            </div></td>
    </tr>
        <tr>
            <td colspan="2" dir="ltr" style="text-align :center;font-size:10px;">
                <%: Html.ActionLink("  ", "Delete", "StrategicAction", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "StrategicAction", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
            </td>
        </tr>

     <% Next%>
     </table>
  


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
     <h3 style="padding:10px;"><span class="en" style="float:left;">Strategy</span><span class="dv" style="float:right;">ސްޓްރެޓެޖީ</span></h3>
     <div class="display-field dv" style="padding:20px;">
        <h2><%: Html.DisplayFor(Function(model) model.RefCode)%> : <%: Html.DisplayFor(Function(model) model.StrategyDV)%></h2>
         
    </div>
    <div class="display-field en" style="font-weight :200;padding:20px;" dir="ltr">
        <h3> <%: Html.DisplayFor(Function(model) model.RefCode)%> : <%: Html.DisplayFor(Function(model) model.StrategyEN)%></h3>
        
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
