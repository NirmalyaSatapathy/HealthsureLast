<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
    <html>
<head>
<meta charset="UTF-8">
<title>Prescription List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ViewPrescriptions.css" />
</head>
<body>
    <jsp:include page="/navbar/NavProvider.jsp" />
    <div class="dashboard-container">
        <div class="dashboard-title">Prescription List</div>

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
            
            <h:outputText value="Total prescriptions: #{procedureController.viewPrescriptions.size()}"
                          style="font-weight: bold; display: block; margin-bottom: 10px;" />
            
            <h:dataTable value="#{procedureController.getPaginatedPrescriptions()}" var="p"
                styleClass="data-table" border="1">
                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Prescription ID" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('prescriptions','prescriptionId')}"
                                    rendered="#{!(procedureController.sortField eq 'prescriptionId' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('prescriptions','prescriptionId')}"
                                    rendered="#{!(procedureController.sortField eq 'prescriptionId' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{p.prescriptionId}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Prescribed Doctor" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('prescriptions','prescribedDocId')}"
                                    rendered="#{!(procedureController.sortField eq 'prescribedDocId' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('prescriptions','prescribedDocId')}"
                                    rendered="#{!(procedureController.sortField eq 'prescribedDocId' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{p.prescribedDoc.doctorName}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Start Date" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('prescriptions','startDate')}"
                                    rendered="#{!(procedureController.sortField eq 'startDate' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('prescriptions','startDate')}"
                                    rendered="#{!(procedureController.sortField eq 'startDate' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{p.startDate}">
                        <f:convertDateTime pattern="yyyy-MM-dd" />
                    </h:outputText>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="End Date" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('prescriptions','endDate')}"
                                    rendered="#{!(procedureController.sortField eq 'endDate' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('prescriptions','endDate')}"
                                    rendered="#{!(procedureController.sortField eq 'endDate' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{p.endDate}">
                        <f:convertDateTime pattern="yyyy-MM-dd" />
                    </h:outputText>
                </h:column>
                 <h:column>
                    <f:facet name="header">
                        <h:panelGroup layout="block" style="display: flex; align-items: center;">
                            <h:outputText value="Notes" />
                            <h:panelGroup styleClass="sort-icons">
                                <h:commandLink
                                    action="#{procedureController.sortByAsc('prescriptions','notes')}"
                                    rendered="#{!(procedureController.sortField eq 'notes' and procedureController.isAscending())}"
                                    styleClass="sort-icon">▲</h:commandLink>
                                <h:commandLink
                                    action="#{procedureController.sortByDesc('prescriptions','notes')}"
                                    rendered="#{!(procedureController.sortField eq 'notes' and not procedureController.isAscending())}"
                                    styleClass="sort-icon">▼</h:commandLink>
                            </h:panelGroup>
                        </h:panelGroup>
                    </f:facet>
                    <h:outputText value="#{p.notes}">
                        <f:convertDateTime pattern="yyyy-MM-dd" />
                    </h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Actions" />
                    </f:facet>
                    <h:commandButton value="Edit" styleClass="action-button primary"
                        action="#{procedureController.editPrescription(p)}" />
                    <h:commandButton value="Medicines" styleClass="action-button secondary"
                        action="#{procedureController.loadViewMedicines(p)}" />
                    <h:commandButton value="Tests" styleClass="action-button secondary"
                        action="#{procedureController.loadViewTests(p)}" />
                </h:column>
            </h:dataTable>

            <!-- Pagination Controls -->
            <div class="pagination-controls">
                <h:commandButton value="First"
                                 action="#{procedureController.setPrescriptionFirst(0)}"
                                 disabled="#{procedureController.prescriptionFirst == 0}"
                                 styleClass="action-button secondary" />

                <h:commandButton value="Previous"
                                 action="#{procedureController.previousPrescriptionPage()}"
                                 disabled="#{procedureController.prescriptionFirst == 0}"
                                 styleClass="action-button secondary" />

                <h:outputText value="Page #{procedureController.prescriptionCurrentPage} of #{procedureController.prescriptionTotalPages}"
                              style="margin: 0 12px; font-weight:bold;" />

                <h:commandButton value="Next"
                                 action="#{procedureController.nextPrescriptionPage()}"
                                 disabled="#{!procedureController.isPrescriptionHasNextPage()}"
                                 styleClass="action-button secondary" />

                <h:commandButton value="Last"
                                 action="#{procedureController.setPrescriptionFirst((procedureController.prescriptionTotalPages - 1) * procedureController.prescriptionPageSize)}"
                                 disabled="#{!procedureController.isPrescriptionHasNextPage()}"
                                 styleClass="action-button secondary" />
            </div>
            
            <div style="margin-top: 20px; text-align: center;">
                <h:commandButton value="Back" styleClass="action-button primary"
                    action="#{procedureController.backFromViewPrescription()}" />
            </div>
        </h:form>
    </div>
</body>
    </html>
</f:view>