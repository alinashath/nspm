<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.StrategicActivity))" %>

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
        <%: ""%>
    </style>
    <h2 style="width: 100%;">ހަރަކާތް   <span dir="ltr" style="text-align: left; float: left; font-size: 12px;"><% If User.IsInRole("PlanningAdmin") Then%><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus" /></a></span><% End If%></h2>
    <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
        <tr>
            <th style="width: 100px;">ތަނބު
            </th>
            <th style="width: 100px;">ސްޓްރެޓެޖީ
            </th>
            <th style="width: 100px;">އެކްޝަން
            </th>
            <th colspan="2">އެކްޓިވިޓީ
            </th>
            <th style="width: 95px;">ސަރުކާރު ބަޖެޓް
            </th>
            <th style="width: 90px;">ބޭރުގެ އެހީ
            </th>
            <th style="width: 75px;"></th>
        </tr>
        <tr style="font-size: 11px;">
            <th>Piller
            </th>
            <th>Strategy
            </th>
            <th>Action
            </th>
            <th colspan="2">Activity
            </th>
            <th>Govt. Budget
            </th>
            <th>Grant
            </th>
            <th></th>
        </tr>

        <% For Each item In Model%>
        <% Dim currentItem = item
            
            
            %>
        <tr>
            <td style="text-align: center">
                  <%: Html.ActionLink(currentItem.StrategicAction.Strategy.Piller.PillerNo, "Details", "Pillers", New With {.id = currentItem.StrategicAction.Strategy.Piller.Id}, "")%>
              
            </td>
            <td style="text-align: center">
                 <%: Html.ActionLink(currentItem.StrategicAction.Strategy.RefCode, "Details", "Strategy", New With {.id = currentItem.StrategicAction.Strategy.Id}, "")%>
              
            </td>
            <td style="text-align: center">
                 <%: Html.ActionLink(currentItem.StrategicAction.RefCode, "Details", "StrategicAction", New With {.id = currentItem.StrategicAction.Id}, "")%>
               
            </td>
            <td>

                <%: currentItem.ActivityDV%>
            </td>
            <td style="text-align: left" dir="rtl">

                <%: currentItem.ActivityEN%>
            </td>
            <td>
                <%: Html.DisplayFor(Function(modelItem) currentItem.BudgetNB) %>
            </td>
            <td>
                <%: Html.DisplayFor(Function(modelItem) currentItem.BudgetGrant) %>
            </td>
            <td dir="ltr" style="text-align: center; font-size: 10px;">
                <% If User.IsInRole("PlanningAdmin") Then%>
              
                <%: Html.ActionLink("  ", "Delete", New With {.id = currentItem.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItem.Id}, New With {.class = "icon icon-edit"})%>  
                <% End If%>
            &nbsp;&nbsp;<%: Html.ActionLink("  ", "Details", New With {.id = currentItem.Id}, New With {.class = "icon icon-list"})%>  
            </td>
        </tr>
        <% Next%>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding: 10px;"><span class="en" style="float: left;">Strategic Activity</span><span class="dv" style="float: right; margin-bottom: 11px;">ސްޓްރެޓެޖިކް އެކްޓިވިޓީ</span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
