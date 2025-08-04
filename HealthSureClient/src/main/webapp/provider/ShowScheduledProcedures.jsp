<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scheduled Procedures</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ShowScheduledProcedures.css" />
</head>

<body>
    <h:form prependId="false">
        <h2>Search Scheduled Procedures</h2>

        <div class="form-group">
            <label for="doctorId"><span style="color: red;">*</span>Doctor ID:</label>
            <h:inputText id="doctorId"
                         value="#{procedureController.doctorId}"
                         styleClass="form-control" />
            <h:message for="doctorId" styleClass="error" />
        </div>

        <div class="form-group">
            <label for="procedureId">Procedure ID (optional):</label>
            <h:inputText id="procedureId"
                         value="#{procedureController.procedureId}"
                         styleClass="form-control" />
            <h:message for="procedureId" styleClass="error" />
        </div>

        <div class="form-group">
            <h:commandButton value="Search"
                             action="#{procedureController.fetchScheduledProceduresController()}"
                             styleClass="btn btn-primary" />
            <h:commandButton value="Reset"
                             action="#{procedureController.resetPage()}"
                             immediate="true"
                             styleClass="btn btn-secondary" />
            <h:commandButton value="Go to Dashboard"
                             action="#{procedureController.goToDashboard1()}"
                             styleClass="btn btn-tertiary" />
        </div>

        <h:panelGroup rendered="#{not empty procedureController.scheduledProcedures}">
            <h:outputText value="Total: #{procedureController.allScheduledProcedures.size()} procedures"
                          style="font-weight: bold; display: block; margin-top: 20px;" />

           <h:dataTable value="#{procedureController.scheduledProcedures}"
             var="p"
             styleClass="data-table">

    <!-- Appointment ID -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Appointment ID" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('appointmentId')}"
                                  rendered="#{!(procedureController.sortField eq 'appointmentId' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('appointmentId')}"
                                  rendered="#{!(procedureController.sortField eq 'appointmentId' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.appointment.appointmentId}" />
    </h:column>

    <!-- Procedure ID -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Procedure ID" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('procedureId')}"
                                  rendered="#{!(procedureController.sortField eq 'procedureId' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('procedureId')}"
                                  rendered="#{!(procedureController.sortField eq 'procedureId' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.procedureId}" />
    </h:column>

    <!-- Recipient First Name -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Recipient First Name" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('recipientFirstName')}"
                                  rendered="#{!(procedureController.sortField eq 'recipientFirstName' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('recipientFirstName')}"
                                  rendered="#{!(procedureController.sortField eq 'recipientFirstName' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.recipient.firstName}" />
    </h:column>

    <!-- Recipient Last Name -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Recipient Last Name" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('recipientLastName')}"
                                  rendered="#{!(procedureController.sortField eq 'recipientLastName' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('recipientLastName')}"
                                  rendered="#{!(procedureController.sortField eq 'recipientLastName' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.recipient.lastName}" />
    </h:column>

    <!-- Doctor Name -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Doctor" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('doctorName')}"
                                  rendered="#{!(procedureController.sortField eq 'doctorName' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('doctorName')}"
                                  rendered="#{!(procedureController.sortField eq 'doctorName' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.doctor.doctorName}" />
    </h:column>

    <!-- Provider Name -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Provider" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('providerName')}"
                                  rendered="#{!(procedureController.sortField eq 'providerName' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('providerName')}"
                                  rendered="#{!(procedureController.sortField eq 'providerName' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.provider.hospitalName}" />
    </h:column>

    <!-- Scheduled Date -->
    <h:column>
        <f:facet name="header">
            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                <h:outputText value="Scheduled Date" />
                <h:panelGroup styleClass="sort-icons">
                    <h:commandLink action="#{procedureController.sortByAsc('scheduledDate')}"
                                  rendered="#{!(procedureController.sortField eq 'scheduledDate' and procedureController.sortAscending)}"
                                  styleClass="sort-icon">▲</h:commandLink>
                    <h:commandLink action="#{procedureController.sortByDesc('scheduledDate')}"
                                  rendered="#{!(procedureController.sortField eq 'scheduledDate' and not procedureController.sortAscending)}"
                                  styleClass="sort-icon">▼</h:commandLink>
                </h:panelGroup>
            </h:panelGroup>
        </f:facet>
        <h:outputText value="#{p.scheduledDate}">
            <f:convertDateTime pattern="yyyy-MM-dd" />
        </h:outputText>
    </h:column>

    <!-- Action Column -->
    <h:column>
        <f:facet name="header">
            <h:outputText value="Action" />
        </f:facet>
        <h:commandButton value="Start Procedure"
                         action="#{procedureController.startProcedure(p)}"
                         styleClass="btn btn-primary" />
    </h:column>
</h:dataTable>
            <div class="pagination-group">
                <h:panelGrid columns="5" cellpadding="10">
                    <h:commandButton value="First"
                                     action="#{procedureController.goToFirstPage()}"
                                     disabled="#{!procedureController.hasPreviousPage()}"
                                     styleClass="btn btn-tertiary" />

                    <h:commandButton value="Previous"
                                     action="#{procedureController.previousPage()}"
                                     disabled="#{!procedureController.hasPreviousPage()}"
                                     styleClass="btn btn-tertiary" />

                    <h:outputText value="Page #{procedureController.currentPage} of #{procedureController.totalPages}"
                                  style="font-weight: bold; align-self: center;" />

                    <h:commandButton value="Next"
                                     action="#{procedureController.nextPage()}"
                                     disabled="#{!procedureController.hasNextPage()}"
                                     styleClass="btn btn-tertiary" />

                    <h:commandButton value="Last"
                                     action="#{procedureController.goToLastPage()}"
                                     disabled="#{!procedureController.hasNextPage()}"
                                     styleClass="btn btn-tertiary" />
                </h:panelGrid>
            </div>

        </h:panelGroup>
    </h:form>
</body>
</html>
</f:view>