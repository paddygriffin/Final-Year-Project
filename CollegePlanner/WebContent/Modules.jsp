<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/Module.js"></script>
<title>Modules</title>
</head>
<body style="padding-top: 70px; margin-right: 150px; margin-left: 150px; background-color: #eaeaea;">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">
					<span class="glyphicon glyphicon-education" aria-hidden="true"></span>
				</a>
				<a class="navbar-brand" href="About.jsp">College Planner</a>
			</div>
	
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="Calendar">Calendar</a></li>
					<li><a href="Timetable">Timetable</a></li>
					<li><a href="ToDoList">To do</a></li>
					<li><a href="Modules">Modules</a></li>
					<li><a href="Assignments">Assignments</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username}<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li>
								<a href="Profile">Account Details
									<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
								</a>
							</li>
							<li role="separator" class="divider"></li>
							<li><a href="Logout">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="background-color: white; min-height: 600px; box-shadow: 0 0 10px #888888;">
	<!-- Table Header -->
		<div class="col-md-6">
			<h2>Modules</h2>
			<button style="float: left;" id="newModule" name="newModule"
				data-original-title="Edit" data-toggle="modal" type="button"
				class="btn btn-primary btn-info" data-target="#moduleModal">
				<span class="glyphicon glyphicon-plus"></span>
			</button>
		</div>

		<div class="col-md-6">
			<div style="float: right; width: 80%;">
				<h3>GPA:</h3>
				<div class="progress">
					<div class="progress-bar progress-bar-warning" role="progressbar"
						aria-valuemin="0" aria-valuemax="100" style="width:${average}%">
						${average}%</div>
				</div>
			</div>
		</div>

		<!-- Module Table -->
<div>
       <div class="span12" style="padding-left:2%; padding-right:2%;">
   		<div class="menu">
               <div class="accordion">
           		<div class="accordion-group">
           		    <c:forEach var="module" items="${modules.moduleList}">
            			<div class="accordion-header country">
	            			<hr>
	            			<table style="width: 100%;">
	            				<thead>
	            					<tr>
	            						<th style="width: 30%">
	            							<a class="accordion-toggle" data-toggle="collapse" href="#${module.id}">${module.title}</a>
            							</th>
            							<th style="width: 30%">
            								<a class="accordion-toggle" data-toggle="collapse" href="#${module.id}">${module.lecturer}</a>
            							</th>
			            				<th style="width: 35%">
			            				Total:
			            					<div class="progress" style="width: 80%; float: right;">
												<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${module.average}%">
												${module.average}%
							  					</div>
											</div>
										</th>
			            				<th style="width: 5%">
			            					<button id="deleteModuleBtn" name="deleteModuleBtn" data-original-title="Delete"
													data-toggle="modal" type="button" class="remove-item btn btn-default btn-xs pull-right"
													data-target="#deleteModuleModal" value="${module.title}|${module.lecturer}" onClick="deleteModule(this);">
													<span class="glyphicon glyphicon-remove"></span>
											</button>
										</th>
									</tr>
								</thead>
							</table>
            			</div>
            			<div id="${module.id}" class="accordion-body collapse">
            				<div class="accordion-inner">
            					<table class="table table-striped table-condensed">
            						<thead>
            							<tr>
            								<th style="width: 20%">Title</th>
            								<th style="width: 20%">Date</th>
            								<th style="width: 10%">Worth (%)</th>
            								<th style="width: 10%">Result (%)</th>
            								<th style="width: 30%">Percentage Awarded</th>
            								<th style="width: 10%">
	            								<button id="newGrade" name="newGrade" data-original-title="Add"
														data-toggle="modal" type="button" class="btn btn-sm btn-info pull-right"
														data-target="#gradeModal" value="${module.title}" onClick="getModuleTitle(this);">
														<span class="glyphicon glyphicon-plus"></span>
												</button>
											</th>
            							</tr>
            						</thead>
            						<c:forEach var="moduleGrade" items="${moduleData.moduleGrades}">
	            						<c:if test="${module.title == moduleGrade.title}">
		            						<tbody>
		            							<tr>
		            								<td style="width: 20%">${moduleGrade.gradeTitle}</td>
		            								<td style="width: 20%">${moduleGrade.date}</td>
		            								<td style="width: 10%">${moduleGrade.value}%</td>
		            								<td style="width: 10%">${moduleGrade.result}%</td>
		            								<td style="width: 30%">
			            								<div class="progress">
																	<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${moduleGrade.grade}%">
  																	${moduleGrade.grade}%
														  	</div>
														</div>
													</td>
													<td style="width: 10%">
														<button type="submit" form="deleteGrades" id="submitBtn" name="submitBtn" data-original-title="DeleteGrade"
																class="remove-item btn btn-default btn-xs pull-right"
																value="${module.title}|${moduleGrade.gradeTitle}|${moduleGrade.date}|${moduleGrade.value}|${moduleGrade.result}" onClick="removeGrade(this);">
														<span class="glyphicon glyphicon-remove"></span>
														</button>
													</td>
		            							</tr>
		            						</tbody>
	            						</c:if>
            						</c:forEach>
            					</table>
            				</div>
            			</div>
           			</c:forEach>
            			<hr>
            		</div>
            	</div>
            </div>
        </div>
	</div>
</div>

	
<!-- Modals -->
<!-- Module Modal -->
<div class="modal fade" id="moduleModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Module</h4>
			</div>
			<div class="modal-body">
				<form id="createModule" action="Modules" method="post">
					<div class="form-group">
						<label>Module Title:</label> <input class="form-control" type="text" id="moduleTitle" name="moduleTitle" placeholder="Module Title max 30 characters" maxlength="30" required>
						 <%
                                 String error_msg = (String) request.getAttribute("error");
                                 if (error_msg != null)
                                 	out.println("<font color=red size=4px>" + error_msg + "</font>");
                                 %>
					</div>
					<div class="form-group">
						<label>Lecturer:</label> <input class="form-control" type="text" id="lecturer" name="lecturer" placeholder="Lecturer max 30 characters" maxlength="30" required>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button form="createModule" name="submitBtn" value="CreateModule" type="submit" class="btn btn-default">Create Module</button>
			</div>
		</div>
	</div>
</div>

<!-- Grade Modal -->
<div class="modal fade" id="gradeModal" role="dialog">
	<div class="modal-dialog modal-sm">

		<!-- Modal content-->
		<div class="modal-content ">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add</h4>
			</div>
			<div class="modal-body">
				<form id="createGrade" action="Modules" method="post">
					<div class="form-group">
						<label>Title:</label> <input class="form-control" type="text" id="gradeTitle" name="gradeTitle" placeholder="Title max 30 characters" maxlength="30" required>
					</div>
					<div class="form-group">
						<label>Date:</label> <input class="form-control" type="date" id="gradeDate" name="gradeDate" required>
					</div>
					<div class="form-group">
						<label>Value:</label> <input class="form-control" type="number" id="gradeValue" name="gradeValue" placeholder="Worth - Out of 100%" max="100" required>
					</div>
					<div class="form-group">
						<label>Result:</label> <input class="form-control" type="number" id="gradeResult" name="gradeResult" placeholder="Result - Out of 100%" max="100" required>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button form="createGrade" name="submitBtn" value="CreateGrade" type="submit" class="btn btn-default">Create Grade</button>
			</div>
		</div>
	</div>
</div>

<!-- Delete Module Modal -->
<div class="modal fade" id="deleteModuleModal" role="dialog">
	<div class="modal-dialog">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Delete Module</h4>
			</div>
			<div class="modal-body">
				<form id="deleteModule" action="Modules" method="post">
					<div class="form-group">
						<h4>Are you sure you wish to delete:</h4>
						<label>Module Title:</label> <input class="form-control" type="text" id="deleteModuleTitle" name="deleteModuleTitle"  maxlength="40" readonly>
					</div>
					<div class="form-group">
						<label>Lecturer:</label> <input class="form-control" type="text" id="deleteModuleLecturer" name="deleteModuleLecturer" maxlength="40" readonly>
					</div>
					<h4>Doing so will remove all data belonging to this module!</h4>
				</form>
			</div>
			<div class="modal-footer">
				<button form="deleteModule" name="submitBtn" value="DeleteModule" type="submit" class="btn btn-default btn-danger">Delete Module</button>
			</div>
		</div>
	</div>
</div>

<input form="createGrade"type="text" id="gradeModuleTitle" name="gradeModuleTitle" style="visibility: hidden;">
<form id="deleteGrades" name="deleteGrades" action="Modules" method="post">
	<input type="text" id="deleteGradeModule" name="deleteGradeModule" style="visibility: hidden;">
	<input type="text" id="deleteGradeTitle" name="deleteGradeTitle" style="visibility: hidden;">
	<input type="text" id="deleteGradeDate" name="deleteGradeDate" style="visibility: hidden;">
	<input type="text" id="deleteGradeValue" name="deleteGradeValue" style="visibility: hidden;">
	<input type="text" id="deleteGradeResult" name="deleteGradeResult" style="visibility: hidden;">
</form>
</body>
</html>