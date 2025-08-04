<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Tests</title>
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ViewTests.css" />
</head>
<body>
    <jsp:include page="/navbar/NavProvider.jsp" />
    <div class="dashboard-container">
        <div class="dashboard-title">Test Details</div>

        <!-- Prescription Summary Section -->
        <h:panelGroup rendered="#{not empty procedureController.prescription}">
            <div class="summary-section">
                <div class="summary-grid">
                    <div class="summary-item">
                        <strong>Prescription ID:</strong>
                        <h:outputText value="#{procedureController.prescription.prescriptionId}" />
                    </div>
                     <div class="summary-item">
				<strong>Recipient Name:</strong>
				<h:outputText value="#{procedureController.procedure.recipient.firstName}" />
			</div>
			<div class="summary-item">
				<strong>Diagnosis:</strong>
				<h:outputText value="#{procedureController.procedure.diagnosis}" />
			</div>
                    <div class="summary-item">
                        <strong>Prescribed Doctor:</strong>
                        <h:outputText value="#{procedureController.prescription.prescribedDoc.doctorName}" />
                    </div>
                    <div class="summary-item">
                        <strong>Prescription Start Date:</strong>
                        <h:outputText value="#{procedureController.prescription.startDate}">
                            <f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:outputText>
                    </div>
                    <div class="summary-item">
                        <strong>Prescription End Date:</strong>
                        <h:outputText value="#{procedureController.prescription.endDate}">
                            <f:convertDateTime pattern="yyyy-MM-dd" />
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
                <h:commandButton value="Add Test" styleClass="action-button add-row" 
                    action="#{procedureController.createNewExistingPrescProcedureTest()}" />
                <h:commandButton value="Back" styleClass="action-button secondary" 
                    action="ViewPrescriptions?faces-redirect=true"/>
            </div>

            <!-- Empty State Table -->
            <h:dataTable value="#{empty procedureController.viewTests ? ['dummy'] : procedureController.getPaginatedTests()}"
                var="m"
                rendered="#{empty procedureController.viewTests}"
                styleClass="test-table"
                border="1">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Prescription ID" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Test Name" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Test Date" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Result Summary" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Action" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
            </h:dataTable>
            
            <!-- Empty State Message -->
            <h:outputText value="No tests added."
                style="font-weight: bold; color: red; display: block; margin-top: 10px; text-align: center; width: 100%;"
                rendered="#{empty procedureController.viewTests}" />
            
            <!-- Test Table -->
            <h:panelGroup rendered="#{not empty procedureController.viewTests}">
                <h:outputText value="Total tests: #{procedureController.viewTests.size()}"
                    style="font-weight: bold; display: block; margin: 10px 0;" />
                
                <h:dataTable value="#{procedureController.getPaginatedTests()}" var="t" 
                    styleClass="test-table" border="1">
                    
                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Prescription ID" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('tests','prescriptionId')}"
                                        rendered="#{!(procedureController.sortField eq 'prescriptionId' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('tests','prescriptionId')}"
                                        rendered="#{!(procedureController.sortField eq 'prescriptionId' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{t.prescription.prescriptionId}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Test Name" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('tests','testName')}"
                                        rendered="#{!(procedureController.sortField eq 'testName' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('tests','testName')}"
                                        rendered="#{!(procedureController.sortField eq 'testName' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{t.testName}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Test Date" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('tests','testDate')}"
                                        rendered="#{!(procedureController.sortField eq 'testDate' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('tests','testDate')}"
                                        rendered="#{!(procedureController.sortField eq 'testDate' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{t.testDate}">
                            <f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:outputText>
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Result Summary" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('tests','resultSummary')}"
                                        rendered="#{!(procedureController.sortField eq 'resultSummary' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('tests','resultSummary')}"
                                        rendered="#{!(procedureController.sortField eq 'resultSummary' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{t.resultSummary}" />
                    </h:column>
                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Action" />
                        </f:facet>
                        <h:commandButton value="Edit" styleClass="action-button primary" 
                            action="#{procedureController.editTest(t)}" />
                    </h:column>
                </h:dataTable>
                
                <!-- Pagination Controls -->
                <div class="pagination-controls">
                    <h:commandButton value="First"
                        action="#{procedureController.setTestFirst(0)}"
                        disabled="#{procedureController.testFirst == 0}"
                        styleClass="action-button secondary" />
                    
                    <h:commandButton value="Previous"
                        action="#{procedureController.previousTestPage()}"
                        disabled="#{procedureController.testFirst == 0}"
                        styleClass="action-button secondary" />
                    
                    <h:outputText value="Page #{procedureController.testCurrentPage} of #{procedureController.testTotalPages}"
                        style="margin: 0 12px; font-weight:bold;" />
                    
                    <h:commandButton value="Next"
                        action="#{procedureController.nextTestPage()}"
                        disabled="#{!procedureController.isTestHasNextPage()}"
                        styleClass="action-button secondary" />
                    
                    <h:commandButton value="Last"
                        action="#{procedureController.setTestFirst((procedureController.testTotalPages - 1) * procedureController.testPageSize)}"
                        disabled="#{!procedureController.isTestHasNextPage()}"
                        styleClass="action-button secondary" />
                </div>
            </h:panelGroup>
        </h:form>
    </div>
</body>
</html>
</f:view>