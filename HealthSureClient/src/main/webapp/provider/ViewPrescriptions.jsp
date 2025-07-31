<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
<head>
<meta charset="UTF-8">
<title>Prescription List</title>
<style>
/* Reusing your existing table styles */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f9f9f9;
	color: #333;
	padding: 20px;
}

h2 {
	color: #3f51b5;
	font-size: 30px;
	margin: 20px 0;
}

.data-table {
	width: 100%;
	margin-top: 30px;
	border-collapse: collapse;
}

.data-table th, .data-table td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

.data-table th {
	background-color: #3f51b5;
	color: white;
}

.data-table td {
	background-color: #fff;
	color: #333;
}

.data-table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.data-table tr:hover {
	background-color: #ddd;
}

.message-container li {
	background-color: #ffe6e6; /* Light red background for visibility */
	color: #c62828; /* Strong red text */
	padding: 0.5rem 1rem;
	margin-bottom: 0.5rem;
	border-radius: 0.5rem;
	font-weight: 500;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}
</style>
</head>
<body>
	<center>
		<h2>
			<h:outputText value="Prescriptions" />
		</h2>
	</center>
	<h:form prependId="false">
		<div class="message-container">
			<h:messages globalOnly="true" layout="list" />
		</div>
		<h:dataTable value="#{procedureController.viewPrescriptions}" var="p"
			styleClass="data-table" border="1">
			<h:column>
				<f:facet name="header">
					<h:outputText value="Prescription ID" />
				</f:facet>
				<h:outputText value="#{p.prescriptionId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Procedure" />
				</f:facet>
				<h:outputText value="#{procedureController.procedure.diagnosis}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Procedure Doctor" />
				</f:facet>
				<h:outputText value="#{p.doctor.doctorId}" />
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Prescribed Doctor" />
				</f:facet>
				<h:outputText value="#{p.prescribedDoc.doctorId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Start Date" />
				</f:facet>
				<h:outputText value="#{p.startDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
				</h:outputText>
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="End Date" />
				</f:facet>
				<h:outputText value="#{p.endDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
				</h:outputText>
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Action" />
				</f:facet>
				<h:commandButton value="edit"
					action="#{procedureController.editPrescription(p)}" />
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Action" />
				</f:facet>
				<h:commandButton value="viewMedicines"
					action="#{procedureController.loadViewMedicines(p)}" />
			</h:column>
			<h:column>
				<f:facet name="header">
					<h:outputText value="Action" />
				</f:facet>
				<h:commandButton value="viewTests"
					action="#{procedureController.loadViewTests(p)}" />
			</h:column>

		</h:dataTable>
		<h:commandButton value="back"
			action="#{procedureController.backFromViewPrescription()}" />
	</h:form>
</body>
	</html>
</f:view>