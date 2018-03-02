<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of nashath.strategicplanManagement.Schedule))" %>

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
            vertical-align: top;
            min-height: 50px;
        }

        tr {
            padding: 0;
            margin: 0;
        }

        th {
            border-left: 1px solid #dcdcdc;
            border-right: 1px solid #dcdcdc;
            height: 75px;
        }

        #portfolio .icon {
            margin-bottom: 0em;
            font-size: 12px;
        }

        .color {
            background-color: #6C2A6A;
        }


        .rotate {
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083); /* IE6,IE7 */
            -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083)"; /* IE8 */
            -moz-transform: rotate(-90.0deg); /* FF3.5+ */
            -ms-transform: rotate(-90.0deg); /* IE9+ */
            -o-transform: rotate(-90.0deg); /* Opera 10.5 */
            -webkit-transform: rotate(-90.0deg); /* Safari 3.1+, Chrome */
            transform: rotate(-90.0deg); /* Standard */
        }
    </style>
    <%
        Dim pillers = Model.ToList().Select(Function(x) x.StrategicActivity.StrategicAction.Strategy.Piller).ToList().OrderBy(Function(x) x.PillerNo).ToList()
       
        
    %>

    <form action="" method="post" style="float: left;">
        <input type="number" value="<%: ViewData("Year")%>" dir="ltr" name="id" style="width: 100px; padding: 5px; margin: 5px; text-align: center; float: left;" />
        <% Dim sec = DirectCast(ViewData("Sections"), List(Of Section))%>
        <select name="section" dir="ltr" name="id" style="width: 300px; padding: 5px; margin: 5px; text-align: center; float: left;">
            <option value="-1">All</option>
            <% For Each n In sec%>
            <option value="<%: n.Id%>"><%: n.SectionNameEN%></option>
            <% Next%>
        </select>
        <input type="submit" value="Filter" class="button" style="float: left; margin: 5px; padding: 2px; min-width: 50px;" />
    </form>

    <table id="workplan" style="width: 100%; border-spacing: 0px; border-collapse: collapse; padding: 0; margin: 0; font-size: 12px;">
        <tr>
            <th style="width: 25px!important;">ތަނބު
            </th>
            <th style="width: 150px!important;">ސްޓްރެޓެޖީ
            </th>
            <th style="width: 150px!important;">ސްޓްރެޖިކް އެކްޝަންސް
            </th>
            <th style="width: 200px!important;">ހަރަކާތް
            </th>
            <th style="width: 40px!important;" class="rotate ">ޖެނުއަރީ - މާޗް
            </th>
            <th style="width: 40px!important;" class="rotate ">އޭޕްރިލް - ޖޫން
            </th>
            <th style="width: 40px!important;" class="rotate ">ޖުލައި- ސެޕްޓެމްބަރ
            </th>
            <th style="width: 40px!important;" class="rotate ">އޮކްޓޯބަރ- ޑިސެމްބަރ
            </th>
            <th style="width: 75px!important;">ސަރުކާރު ބަޖެޓް
            </th>
            <th style="width: 75px!important;">ބޭރުގެ އެހީ
            </th>
            <th style="width: 200px!important;">ސްޓޭޓަސް
            </th>
            <th style="width: 150px!important;">ސެކްޝަން
            </th>
        </tr>

        <%    
            Dim pillerRowspanCount = 1
            Dim previouspiller = "0"
            Dim StrategyRowspanCount = 1
            Dim previousstrategy = "0"
            Dim actionRowspanCount = 1
            Dim previousaction = "0"
            Dim actionRowspanCounts = 1
            Dim previousactions = "0"
         
            For Each item In Model%>
        <tr>
            <% 
            
                Dim currentItem = item
         
            %>



            <% If previouspiller <> currentItem.StrategicActivity.StrategicAction.Strategy.Piller.PillerNo Then
                    pillerRowspanCount = Model.ToList().Select(Function(x) x.StrategicActivity.StrategicAction.Strategy.Piller).Where(Function(x) x.PillerNo = currentItem.StrategicActivity.StrategicAction.Strategy.Piller.PillerNo).ToList().Count()
            %>
            <td rowspan="<%: pillerRowspanCount %>"><%: currentItem.StrategicActivity.StrategicAction.Strategy.Piller.PillerNo%></td>
            <%
                previouspiller = currentItem.StrategicActivity.StrategicAction.Strategy.Piller.PillerNo
            End If
            %>
            <% If previousstrategy <> currentItem.StrategicActivity.StrategicAction.Strategy.RefCode Then
                    StrategyRowspanCount = Model.ToList().Select(Function(x) x.StrategicActivity.StrategicAction).Where(Function(x) x.Strategy.RefCode = currentItem.StrategicActivity.StrategicAction.Strategy.RefCode).ToList().Count()
            %>

            <td rowspan="<%: StrategyRowspanCount%>"><%: currentItem.StrategicActivity.StrategicAction.Strategy.RefCode%>: <%: currentItem.StrategicActivity.StrategicAction.Strategy.StrategyDV%></td>

            <%
                previousstrategy = currentItem.StrategicActivity.StrategicAction.Strategy.RefCode
            End If
            %>
            <% If previousaction <> currentItem.StrategicActivity.StrategicAction.RefCode Then
                    actionRowspanCount = Model.ToList().Select(Function(x) x.StrategicActivity.StrategicAction).Where(Function(x) x.RefCode = currentItem.StrategicActivity.StrategicAction.RefCode).ToList().Count()
            %>
            <td rowspan="<%: actionRowspanCount%%>"><%: currentItem.StrategicActivity.StrategicAction.RefCode%> : <%: currentItem.StrategicActivity.StrategicAction.ActionDV%></td>
            <%
                previousaction = currentItem.StrategicActivity.StrategicAction.RefCode
            End If
            %>


            <td><%: currentItem.StrategicActivity.ActivityDV%></td>
            <td class=" <%: IIf(IIf(Not currentItem.Qt_One.HasValue, False, currentItem.Qt_One), "color", "")%>"></td>
            <td class="<%: IIf(IIf(Not currentItem.Qt_Two.HasValue, False, currentItem.Qt_Two), "color", "")%>"></td>
            <td class="<%: IIf(IIf(Not currentItem.Qt_Three.HasValue, False, currentItem.Qt_Three), "color", "")%>"></td>
            <td class="<%: IIf(IIf(Not currentItem.Qt_Four.HasValue, False, currentItem.Qt_Four), "color", "")%>"></td>
            <td><%: currentItem.StrategicActivity.BudgetNB%></td>
            <td><%: currentItem.StrategicActivity.BudgetGrant%></td>
            <td>
                <ul>
                    <% For Each i In currentItem.StrategicActivity.Status%>
                    <li>- <%: i.StatusDV%></li>
                    <% Next%>
                </ul>
            </td>
            <% If previousactions <> currentItem.StrategicActivity.StrategicAction.RefCode Then
                    actionRowspanCounts = Model.ToList().Select(Function(x) x.StrategicActivity.StrategicAction).Where(Function(x) x.RefCode = currentItem.StrategicActivity.StrategicAction.RefCode).ToList().Count()
            %>
            <td rowspan="<%: actionRowspanCounts%%>">
                <ul>
                    <% For Each i In currentItem.StrategicActivity.StrategicAction.StrategySections%>
                    <li><%: i.Section.SectionNameDV%></li>
                    <% Next%>
                </ul>
            </td>
            <%
                previousactions = currentItem.StrategicActivity.StrategicAction.RefCode
            End If
            %>

            <% Next%>
        </tr>

    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding: 10px;"><span class="en" style="float: left;">Work Plan - <%: ViewData("Year")%></span><span class="dv" style="float: right; margin-bottom: 11px;">ވޯކްޕްލޭން - <%: ViewData("Year")%></span></h3>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>