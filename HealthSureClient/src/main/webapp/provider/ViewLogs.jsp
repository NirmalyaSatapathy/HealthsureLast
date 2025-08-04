<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
    <html>
<head>
<meta charset="UTF-8">
<title>Procedure Logs</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ViewLogs.css" />
</head>
<body>
    <jsp:include page="/navbar/NavProvider.jsp" />
    <div class="dashboard-container">
        <div class="dashboard-title">Procedure Daily Logs</div>

        <!-- Procedure Summary Section -->
        <h:panelGroup rendered="#{not empty procedureController.procedure}">
            <div class="summary-section">
                <div class="summary-grid">
                    <div class="summary-item">
                        <strong>Recipient Name:</strong>
                        <h:outputText value="#{procedureController.procedure.recipient.firstName}" />
                    </div>
                    <div class="summary-item">
                        <strong>Diagnosis:</strong>
                        <h:outputText value="#{procedureController.procedure.diagnosis}" />
                    </div>
                    <div class="summary-item">
                        <strong>Procedure Doctor:</strong>
                        <h:outputText value="#{procedureController.procedure.doctor.doctorName}" />
                    </div>
                    <div class="summary-item">
                        <strong>Procedure Start Date:</strong>
                        <h:outputText value="#{procedureController.procedure.fromDate}">
                            <f:convertDateTime pattern="dd MMM yyyy" />
                        </h:outputText>
                    </div>
                </div>
            </div>
        </h:panelGroup>

        <h:form prependId="false">
            <div class="message-container">
                <h:messages globalOnly="true" layout="list" />
            </div>

            <!-- Top Right Buttons -->
            <div class="button-row">

                <h:commandButton value="Back" styleClass="action-button secondary" 
                    action="LongTermProcedureDashboard?faces-redirect=true" />
            </div>

            <h:outputText value="Total logs: #{procedureController.viewLogs.size()}"
                          style="font-weight: bold; display: block; margin-bottom: 10px;" />
            
            <h:dataTable value="#{procedureController.getPaginatedLogs()}" var="log"
                styleClass="data-table" border="1">
                
                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Log ID" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','logId')}"
                                    rendered="#{!(procedureController.sortField eq 'logId' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','logId')}"
                                    rendered="#{!(procedureController.sortField eq 'logId' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.logId}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Procedure ID" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','procedureId')}"
                                    rendered="#{!(procedureController.sortField eq 'procedureId' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','procedureId')}"
                                    rendered="#{!(procedureController.sortField eq 'procedureId' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.medicalProcedure.procedureId}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Logged By" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','Logged By')}"
                                    rendered="#{!(procedureController.sortField eq 'Logged By' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','Logged By')}"
                                    rendered="#{!(procedureController.sortField eq 'Logged By' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.loggedDoctor.doctorName}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Log Date" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','logDate')}"
                                    rendered="#{!(procedureController.sortField eq 'logDate' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','logDate')}"
                                    rendered="#{!(procedureController.sortField eq 'logDate' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.logDate}">
                        <f:convertDateTime pattern="yyyy-MM-dd HH:mm" />
                    </h:outputText>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Vitals" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','vitals')}"
                                    rendered="#{!(procedureController.sortField eq 'vitals' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','vitals')}"
                                    rendered="#{!(procedureController.sortField eq 'vitals' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.vitals}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Notes" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('logs','notes')}"
                                    rendered="#{!(procedureController.sortField eq 'notes' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('logs','notes')}"
                                    rendered="#{!(procedureController.sortField eq 'notes' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{log.notes}" />
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Action" />
                    </f:facet>
                    <h:commandButton value="Edit" styleClass="action-button primary"
                        action="#{procedureController.editLog(log)}" />
                </h:column>
            </h:dataTable>
            
            <!-- Pagination Controls -->
            <div class="pagination-controls">
                <h:commandButton value="First"
                                 action="#{procedureController.setLogFirst(0)}"
                                 disabled="#{procedureController.logFirst == 0}"
                                 styleClass="action-button secondary" />
                
                <h:commandButton value="Previous"
                                 action="#{procedureController.previousLogPage()}"
                                 disabled="#{procedureController.logFirst == 0}"
                                 styleClass="action-button secondary" />
                
                <h:outputText value="Page #{procedureController.logCurrentPage} of #{procedureController.logTotalPages}"
                              style="margin: 0 12px; font-weight:bold;" />
                
                <h:commandButton value="Next"
                                 action="#{procedureController.nextLogPage()}"
                                 disabled="#{!procedureController.isLogHasNextPage()}"
                                 styleClass="action-button secondary" />
                
                <h:commandButton value="Last"
                                 action="#{procedureController.setLogFirst((procedureController.logTotalPages - 1) * procedureController.logPageSize)}"
                                 disabled="#{!procedureController.isLogHasNextPage()}"
                                 styleClass="action-button secondary" />
            </div>
        </h:form>
    </div>
</body>
    </html>
</f:view>