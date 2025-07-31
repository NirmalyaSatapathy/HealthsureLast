<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
<head>
<meta charset="UTF-8">
<title>Procedure Logs</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	color: #333;
	padding: 20px;
}

h2 {
	color: #0077cc;
	font-size: 28px;
	margin: 20px 0;
	text-align: center;
}

.data-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.data-table th, .data-table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.data-table th {
	background-color: #0077cc;
	color: white;
}

.data-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.data-table tr:hover {
	background-color: #e0e0e0;
}

.back-button {
	margin-top: 20px;
}
</style>
</head>
<body>
	<h2>
		<h:outputText value="Procedure Daily Logs" />
	</h2>

	<h:form prependId="false">
		<h:dataTable value="#{procedureController.viewLogs}" var="log"
			styleClass="data-table" border="1">
			<h:column>
				<f:facet name="header">
					<h:outputText value="Log ID" />
				</f:facet>
				<h:outputText value="#{log.logId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Procedure ID" />
				</f:facet>
				<h:outputText value="#{log.medicalProcedure.procedureId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Logged Doctor" />
				</f:facet>
				<h:outputText value="#{log.loggedDoctor.doctorId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Log Date" />
				</f:facet>
				<h:outputText value="#{log.logDate}">
					<f:convertDateTime pattern="yyyy-MM-dd HH:mm" />
				</h:outputText>
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Vitals" />
				</f:facet>
				<h:outputText value="#{log.vitals}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Notes" />
				</f:facet>
				<h:outputText value="#{log.notes}" />
			</h:column>
			<h:column>
			<f:facet name="header">
				<h:outputText value="Action" />
			</f:facet>
			<h:commandButton value="edit"
				action="#{procedureController.editLog(log)}" />
		</h:column>
		</h:dataTable>
		
		<div class="back-button">
			<h:commandButton value="Back"
				action="LongTermProcedureDashboard?faces-redirect=true" />
		</div>
	</h:form>
</body>
	</html>
</f:view>