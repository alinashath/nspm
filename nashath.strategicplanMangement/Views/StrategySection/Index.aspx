<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.StrategySection))" %>

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
    <h2 style="width: 100%;">ހަރަކާތް   <span dir="ltr" style="text-align: left; float: left; font-size: 12px;"><% If User.IsInRole("PlanningAdmin") Then%><a href="<%: Url.Action("Create")%>"><span class="icon icon-plus" /></a></span><% End If%></h2>

     <form action="" method="post" style="float:left;">
       <span dir="ltr"style="padding:5px;margin:5px;text-align :center; float:left;">Section:</span> 
        <% Dim sec = DirectCast(ViewData("Sections"), List(Of Section))%>
        <select name="section" dir="ltr" name="id" style="width:300px;padding:5px;margin:5px;text-align :center;float:left;" >
            <option value="-1">All</option>
            <% For Each n In sec%>
            <option value="<%: n.Id%>"><%: n.SectionNameEN%></option>
            <% Next%>
        </select>
        <input type="submit" value="Filter" class="button" style="float:left;margin:5px;padding:2px;min-width:50px;" />
    </form> 

    <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
        <tr>
            <th style="width: 10%;">ނަންބަރު
            </th>
            <th style="width: 60%;" colspan="2">ސްޓްރެޛިކް އެކްޝަން
            </th>

            <th style="width: 30%;" colspan="2">ސެކްޝަން
            </th>

        
        </tr>
        <tr>
            <th style="width: 10%;">Number
            </th>
            <th style="width: 60%;" colspan="2">Strategic Action
            </th>

            <th style="width: 30%;" >Section
            </th>

          
        </tr>


        <% Dim p = DirectCast(ViewData("St"), System.Linq.IOrderedEnumerable(Of StrategicAction))
    
            For Each item In p%>
        <% Dim currentItem = item%>
        <tr>
            <td style="vertical-align: top;">
                <%: Html.DisplayFor(Function(modelItem) currentItem.RefCode)%>
            </td>
            <td style="width: 20%; vertical-align: top;">
                <%: Html.DisplayFor(Function(modelItem) currentItem.ActionDV)%>
            </td>
            <td style="width: 20%; vertical-align: top;" class="en">
                <%: Html.DisplayFor(Function(modelItem) currentItem.ActionEN)%>
            </td>
            <td style="width: 20%; vertical-align: top;">
                <% For Each rt In Model%>
                <% Dim currentItems = rt%>
                <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;border :none;padding:0;margin:0;">
                    <tr>
                        <%
                            If currentItem.Id = currentItems.StrategyID Then
                        %>
                        <td style="width:45%;">

                            <%: Html.DisplayFor(Function(modelItem) currentItems.Section.SectionNameDV)%>
                        </td>
                        <td style="width: 45%; vertical-align: top;" class="en">
                            <%: Html.DisplayFor(Function(modelItem) currentItems.Section.SectionNameEN)%>
                        </td>
                        <td dir="ltr" style="text-align: center; font-size: 10px;">
                            <% If User.IsInRole("PlanningAdmin") Then%>
                            <%: Html.ActionLink("  ", "Delete", New With {.id = currentItems.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", New With {.id = currentItems.Id}, New With {.class = "icon icon-edit"})%>  
          <% End If%>
                        </td>

                        <% End If%>
                    </tr>
                </table>
                <%Next%>
            </td>
        </tr>
        <% Next%>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding: 10px;"><span class="en" style="float: left;">Responsible Section/Division</span><span class="dv" style="float: right; margin-bottom: 11px;">ޒިންމާވާ ފަރާތްތައް</span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
