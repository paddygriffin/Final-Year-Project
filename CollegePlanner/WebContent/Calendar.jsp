<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calendar</title>

<!-- https://jqueryui.com/datepicker/ -->
<!-- http://docs.telerik.com/kendo-ui/api/javascript/ui/scheduler -->

 
 <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.rtl.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.silver.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2017.1.118/styles/kendo.mobile.all.min.css"/>

    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="http://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
</head>
<body>
  
<div id="scheduler"></div>
<script>
$("#scheduler").kendoScheduler({
  date: new Date(),
  currentTimeMarker: {
    updateInterval: 100
  },
  views: [
    "day", "week", "workWeek"
  ]
});
</script>

<BODY>
<FORM action="" method="post">
Event Name: <INPUT type="text" name="title" size="35"><BR>
Event Time: 
Sun<INPUT type="checkbox" name="day" value="sun"> 
Mon<INPUT type="checkbox" name="day" value="mon"> 
Tue<INPUT type="checkbox" name="day" value="tue"> 
Wed<INPUT type="checkbox" name="day" value="wed"> 
Thu<INPUT type="checkbox" name="day" value="thu"> 
Fri<INPUT type="checkbox" name="day" value="fri"> 
Sat<INPUT type="checkbox" name="day" value="sat"> 
<SELECT name="starttime">
<OPTION value="8">8:00am</OPTION>
<OPTION value="9">9:00am</OPTION>
<OPTION value="10">10:00am</OPTION>
<OPTION value="11">11:00am</OPTION>
<OPTION value="12">12:00pm</OPTION>
<OPTION value="13">1:00pm</OPTION>
<OPTION value="14">2:00pm</OPTION>
<OPTION value="15">3:00pm</OPTION>
<OPTION value="16">4:00pm</OPTION>
<OPTION value="17">5:00pm</OPTION>
<OPTION value="18">6:00pm</OPTION>
<OPTION value="19">7:00pm</OPTION>
<OPTION value="20">8:00pm</OPTION>
<OPTION value="21">9:00pm</OPTION>
</SELECT> 
to 
<SELECT name="endtime">
<OPTION value="9">9:00am</OPTION>
<OPTION value="10">10:00am</OPTION>
<OPTION value="11">11:00am</OPTION>
<OPTION value="12">12:00pm</OPTION>
<OPTION value="13">1:00pm</OPTION>
<OPTION value="14">2:00pm</OPTION>
<OPTION value="15">3:00pm</OPTION>
<OPTION value="16">4:00pm</OPTION>
<OPTION value="17">5:00pm</OPTION>
<OPTION value="18">6:00pm</OPTION>
<OPTION value="19">7:00pm</OPTION>
<OPTION value="20">8:00pm</OPTION>
<OPTION value="21">9:00pm</OPTION>
<OPTION value="22">10:00pm</OPTION>
</SELECT>
<BR>
<BR>
<INPUT type="submit" name="Submit" value="Add Event">
</FORM>
</body>
</html>