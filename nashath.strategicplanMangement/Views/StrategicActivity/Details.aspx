<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage(Of nashath.strategicplanManagement.StrategicActivity)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
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
            text-align :center!important;
            font-size :11px;
        }

        .color {
            background-color : #c6a2c5;
        }

        #portfolio .icon {
           
             margin-bottom: 0em; 
            font-size: 12px;
          
        }
    </style>
 <p style="text-align :center;width:100%;font-size:12px;">
        <span dir="ltr" style="text-align :center;width:100%;font-size:12px;">
             <%: Html.ActionLink("  ", "Edit", New With {.id = Model.Id}, New With {.class = "icon icon-edit"})%>    
            &nbsp;&nbsp;
              <%: Html.ActionLink("  ", "Index", Nothing, New With {.class = "icon icon-list-ol"})%>
            </span> 
</p>

    <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;font-size :12px;" >
        <tr>
             <td style="width:20%;font-size:16px;" colspan ="1" class="dv">ސަރުކާރު ބަޖެޓް</td>
             <td style="width:60%;font-size:18px;text-align :center;" colspan ="2" class="en" dir="ltr">Mrf: <%: Model.BudgetNB%></td>
           
             <td style="width:20%;font-size:16px;" colspan ="1" class="en" dir="ltr">Budget</td>
        </tr>
        <tr>
             <td style="width:20%;font-size:16px;" colspan ="1" class="dv">ބޭރުގެ އެހީ</td>
             <td style="width:60%;font-size:18px;text-align :center;" colspan ="2" class="en" dir="ltr">Mrf: <%: Model.BudgetGrant%></td>
           
             <td style="width:20%;font-size:16px;" colspan ="1" class="en" dir="ltr">Grant</td>
        </tr>
         <tr >
            <td style="width:50%;font-size:16px;" colspan ="2" class="dv">ތަނބު : <%: Model.StrategicAction.Strategy.Piller.PillerNo & " : " & Model.StrategicAction.Strategy.Piller.PillerDV%></td>
             <td style="width:50%;font-size:16px;" colspan ="2" class="en" dir="ltr">Piller: <%: Model.StrategicAction.Strategy.Piller.PillerNo & " : " & Model.StrategicAction.Strategy.Piller.PillerEN%></td>
        </tr>
        <tr >
            <td style="width:50%;font-size:16px;" colspan ="2" class="dv">ސެޓްރެޓެޖީ : <%: Model.StrategicAction.Strategy.RefCode & " : " & Model.StrategicAction.Strategy.StrategyDV%></td>
             <td style="width:50%;font-size:16px;" colspan ="2" class="en" dir="ltr">Strategy: <%: Model.StrategicAction.Strategy.RefCode & " : " & Model.StrategicAction.Strategy.StrategyEN%></td>
        </tr>
         <tr >
            <td style="width:50%;font-size:16px;" colspan ="2" class="dv">އެކްޝަން : <%: Model.StrategicAction.Strategy.RefCode & " : " & Model.StrategicAction.ActionDV%></td>
             <td style="width:50%;font-size:16px;" colspan ="2" class="en" dir="ltr">Action: <%: Model.StrategicAction.Strategy.RefCode & " : " & Model.StrategicAction.ActionEN%></td>
        </tr>
         <tr>
             <td style="width:20%;font-size:16px;" colspan ="1" class="dv">ޒިންމާވާ ސެކްޝަން / ޑިވިޜަން</td>
             <td style="width:60%;font-size:16px;text-align :center;" colspan ="2" class="en" dir="ltr">
                 <% For Each i In Model.StrategicAction.StrategySections%>
                 <%: i.Section.SectionNameEN%> <br />
                 <% Next%>
             </td>
           
             <td style="width:20%;font-size:16px;" colspan ="1" class="en" dir="ltr">Responsible Section/Divison</td>
        </tr>
        </table> 
    <br />
          <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;font-size :12px;" >


        <tr style="" >
            <td style="width:50%;font-size:26px;" class="dv">އެކްޓިވިޓީ ކުރިއަށް ދާނެގޮތް</td>
             <td style="width:50%;font-size:26px;" class="en" dir="ltr">Activity Schedule</td>
        </tr>
              <% If User.IsInRole("PlanningAdmin") Then%>
               <tr style="" >
           <td colspan ="2"><a href="<%: Url.Action("Create", "WorkPlan", New With {.id = Model.Id})%>"><span class="icon icon-plus" /></a></td>
        </tr>
   
   <% End If%>
        </table> 
   
 <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;font-size :12px;" dir="ltr">
        <tr >
            <th style="width:50%;font-size:11px;" class="dv">އަހަރު</th>
             <th style="width:10%;font-size:11px;" class="dv" dir="ltr">ޖެނުއަރީ - މާޗް</th>
             <th style="width:10%;font-size:11px;" class="dv" dir="ltr">އޭޕްރިލް - ޖޫން</th>
             <th style="width:10%;font-size:11px;" class="dv" dir="ltr">ޖުލައި - ސެޕްޓެމްބަރ</th>
             <th style="width:10%;font-size:11px;" class="dv" dir="ltr">އޮކްޓޯބަރ - ޑިސެމްބަރ</th>
              <th style="width:10%;font-size:11px;" class="dv" dir="ltr"></th>
        </tr>
     <tr >
            <th style="width:50%;font-size:11px;" class="en">Year</th>
             <th style="width:10%;font-size:11px;" class="en" dir="ltr">Jan-Mar</th>
             <th style="width:10%;font-size:11px;" class="en" dir="ltr">Apr-Jun</th>
             <th style="width:10%;font-size:11px;" class="en" dir="ltr">Jul-Sep </th>
             <th style="width:10%;font-size:11px;" class="en" dir="ltr">Oct-Dec</th>
              <th style="width:10%;font-size:11px;" class="en" dir="ltr"></th>
        </tr>
   
    <% For Each n In Model.Schedules%>
    <tr>
        <td class="en" style="vertical-align :top;">
            
                   <%: n.Year%>
          
        </td>
        <td class="en <%: IIf(IIf(Not n.Qt_One.HasValue, False, n.Qt_One), "color", "")%>" style="vertical-align :top;">

        </td>
          <td class="en <%: IIf(IIf(Not n.Qt_Two.HasValue, False, n.Qt_Two), "color", "")%>" dir="ltr">  
                
         </td>
        <td class="en <%: IIf(IIf(Not n.Qt_Three.HasValue, False, n.Qt_Three), "color", "")%>" dir="ltr">  
                  
          </td>
        <td class="en <%: IIf(IIf(Not n.Qt_Four.HasValue, False, n.Qt_Four), "color","")%>" dir="ltr" >   
                 
           </td>
        <td>
            <% If User.IsInRole("PlanningAdmin") Then%>
              <%: Html.ActionLink("  ", "Delete", "WorkPlan", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "WorkPlan", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
            <% End If%>
        </td>
    </tr>
     
     <% Next%>
     </table>
    <br />
     <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;font-size :12px;" >


        <tr style="" >
            <td style="width:50%;font-size:26px;" class="dv">ސްޓޭޓަސް</td>
             <td style="width:50%;font-size:26px;" class="en" dir="ltr">Status</td>
        </tr>
         <% If User.IsInRole("PlanningAdmin") Then%>
               <tr style="" >
           <td colspan ="2"><a href="<%: Url.Action("Create", "Status", New With {.id = Model.Id})%>"><span class="icon icon-plus" /></a></td>
        </tr>
   <% End If%>
   
        </table> 


    <table style="width: 100%; border-spacing: 0px; border-collapse: collapse;font-size :12px;" dir="ltr">
        <tr >
            <th style="width:15%;font-size:11px;" class="dv">ތާރީޚް</th>
             <th style="width:70%;font-size:11px;" class="dv" colspan ="2" dir="ltr">ސްޓޭޓަސް</th>
            
             <th style="width:10%;font-size:11px;" class="dv" dir="ltr">ޔޫސަރ</th>
              <th style="width:5%;font-size:11px;" class="dv" dir="ltr"></th>
        </tr>
     <tr >
            <th style="width:15%;font-size:11px;" class="en">Date</th>
             <th style="width:70%;font-size:11px;" class="en" colspan ="2" dir="ltr">Status</th>
              <th style="width:10%;font-size:11px;" class="en" dir="ltr">User</th>
              <th style="width:5%;font-size:11px;" class="en" dir="ltr"></th>
        </tr>
   
    <% For Each n In Model.Status%>
    <tr>
        <td class="en" style="vertical-align :top;">
            
                   <%: n.DateTime%>
          
        </td>
          
           <td class="en" style="vertical-align :top;width:35%;">
            
                   <%: n.StatusEN%>
          
        </td>
         <td class="dv" style="vertical-align :top;width:35%;">
            
                   <%: n.StatusDV%>
          
        </td>
           <td class="en" style="vertical-align :top;">
            
                   <%: n.StatusUser%>
          
        </td>
        <td>
            <% If User.IsInRole("PlanningAdmin") Then%>
              <%: Html.ActionLink("  ", "Delete", "Status", New With {.id = n.Id}, New With {.class = "icon icon-trash"})%>  &nbsp;&nbsp;
            <%: Html.ActionLink("  ", "Edit", "Status", New With {.id = n.Id}, New With {.class = "icon icon-edit"})%>  
            <% End If%>
        </td>
       
    </tr>
     
     <% Next%>
     </table>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding:10px;"><span class="en" style="float:left;">Strategic Activity</span><span class="dv" style="float:right;">ސްޓްރެޓެޖިކް އެކްޓިވިޓީ</span></h3>
    <div class="display-field dv" style="padding:20px;">
        <h2>  <%: Html.DisplayFor(Function(model) model.ActivityDV)%></h2>
         
    </div>
    <div class="display-field en" style="padding:20px;" dir="ltr">
        <h2>  <%: Html.DisplayFor(Function(model) model.ActivityEN)%></h2>
        
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3 style="padding:10px;"><span class="en" style="float:left;">Strategic Activity</span><span class="dv" style="float:right;">ސްޓްރެޓެޖިކް އެކްޓިވިޓީ</span></h3>
    <div class="display-field dv" style="padding:20px;">
        <h2>  <%: Html.DisplayFor(Function(model) model.ActivityDV)%></h2>
         
    </div>
    <div class="display-field en" style="padding:20px;" dir="ltr">
        <h2>  <%: Html.DisplayFor(Function(model) model.ActivityEN)%></h2>
        
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
