<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.Pillers)" %>

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
    <table>
        <tr >
            <td style="width:50%;font-size:26px;" class="dv">ސްޓްރެޓެޖީ</td>
             <td style="width:50%;font-size:26px;" class="en" dir="ltr">Strategy</td>
        </tr>
   
    <% For Each n In Model.Strategies%>
    <tr>
        <td class="dv" style="vertical-align :top;">

              <div class="dv" > <% Dim strips As String = n.RefCode & " - " & n.StrategyDV%>
                   <%: Html.ActionLink(strips, "Details", "Strategy", New With {.id = n.Id}, "")%>
            </div>
        </td>
          <td class="en" dir="ltr">   <div class="en"> <% Dim stripsEN As String = n.RefCode & " - " & n.StrategyEN%>
                   <%: Html.ActionLink(stripsEN, "Details", "Strategy", New With {.id = n.Id}, "")%>
            </div></td>
    </tr>
        <tr>
            <td colspan="2" dir="ltr" style="text-align :center;font-size:10px;">
                <%: Html.ActionLink("  ", "Delete", "Strategy", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "Strategy", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
            </td>
        </tr>

     <% Next%>
     </table>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
     <h3 style="padding:10px;"><span class="en" style="float:left;">Piller</span><span class="dv" style="float:right;">ތަނބު</span></h3>
     <div class="display-field dv" style="padding:20px;">
        <h2> <%: Html.DisplayFor(Function(model) model.PillerNo) %> : <%: Html.DisplayFor(Function(model) model.PillerDV) %></h2>
         <p> <%: Html.DisplayFor(Function(model) model.PillerDescDV) %></p>
    </div>
    <div class="display-field en" style="padding:20px;" dir="ltr">
        <h2><%: Html.DisplayFor(Function(model) model.PillerNo) %> : <%: Html.DisplayFor(Function(model) model.PillerEN) %></h2>
         <p> <%: Html.DisplayFor(Function(model) model.PillerDescEN) %></p>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
