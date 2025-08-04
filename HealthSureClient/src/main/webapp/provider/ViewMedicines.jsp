<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Medicines</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ViewMedicines.css" />
</head>
<body>
    <jsp:include page="/navbar/NavProvider.jsp" />
    <div class="dashboard-container">
        <div class="dashboard-title">Medicine Details</div>

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
                <h:commandButton value="Add Medicine" styleClass="action-button add-row" 
                    action="#{procedureController.createNewexistingPrescPrescribedMedicine()}" />
                <h:commandButton value="Back" styleClass="action-button secondary" 
                    action="ViewPrescriptions?faces-redirect=true"/>
            </div>

            <!-- Empty State Table -->
            <h:dataTable value="#{empty procedureController.viewMedicines ? ['dummy'] : procedureController.getPaginatedMedicines()}"
                var="m"
                rendered="#{empty procedureController.viewMedicines}"
                styleClass="med-table"
                border="1">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Prescription ID" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Medicine Name" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Type" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Dosage" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Duration" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Start Date" />
                    </f:facet>
                    <h:outputText value="N/A" />
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="End Date" />
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
            <h:outputText value="No medicines added."
                style="font-weight: bold; color: red; display: block; margin-top: 10px; text-align: center; width: 100%;"
                rendered="#{empty procedureController.viewMedicines}" />
            
            <!-- Medicine Table -->
            <h:panelGroup rendered="#{not empty procedureController.viewMedicines}">
                <h:outputText value="Total medicines: #{procedureController.viewMedicines.size()}"
                    style="font-weight: bold; display: block; margin: 10px 0;" />
                
                <h:dataTable value="#{procedureController.getPaginatedMedicines()}" var="m" 
                    styleClass="med-table" border="1">
                    
                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Prescription ID" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','prescriptionId')}"
                                        rendered="#{!(procedureController.sortField eq 'prescriptionId' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','prescriptionId')}"
                                        rendered="#{!(procedureController.sortField eq 'prescriptionId' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.prescription.prescriptionId}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Medicine Name" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','medicineName')}"
                                        rendered="#{!(procedureController.sortField eq 'medicineName' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','medicineName')}"
                                        rendered="#{!(procedureController.sortField eq 'medicineName' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.medicineName}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Type" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','type')}"
                                        rendered="#{!(procedureController.sortField eq 'type' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','type')}"
                                        rendered="#{!(procedureController.sortField eq 'type' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.type}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Dosage" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','dosage')}"
                                        rendered="#{!(procedureController.sortField eq 'dosage' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','dosage')}"
                                        rendered="#{!(procedureController.sortField eq 'dosage' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.dosage}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Duration" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','duration')}"
                                        rendered="#{!(procedureController.sortField eq 'duration' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','duration')}"
                                        rendered="#{!(procedureController.sortField eq 'duration' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.duration}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="Start Date" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','startDate')}"
                                        rendered="#{!(procedureController.sortField eq 'startDate' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','startDate')}"
                                        rendered="#{!(procedureController.sortField eq 'startDate' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.startDate}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:panelGroup layout="block" style="display: flex; align-items: center;">
                                <h:outputText value="End Date" />
                                <h:panelGroup styleClass="sort-icons">
                                    <h:commandLink
                                        action="#{procedureController.sortByAsc('medicines','endDate')}"
                                        rendered="#{!(procedureController.sortField eq 'endDate' and procedureController.isAscending())}"
                                        styleClass="sort-icon">▲</h:commandLink>
                                    <h:commandLink
                                        action="#{procedureController.sortByDesc('medicines','endDate')}"
                                        rendered="#{!(procedureController.sortField eq 'endDate' and not procedureController.isAscending())}"
                                        styleClass="sort-icon">▼</h:commandLink>
                                </h:panelGroup>
                            </h:panelGroup>
                        </f:facet>
                        <h:outputText value="#{m.endDate}" />
                    </h:column>
                    
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Action" />
                        </f:facet>
                        <h:commandButton value="Edit" styleClass="action-button primary" 
                            action="#{procedureController.editMedicine(m)}" />
                    </h:column>
                </h:dataTable>
                
                <!-- Pagination Controls -->
                <div class="pagination-controls">
                    <h:commandButton value="First"
                        action="#{procedureController.setMedicineFirst(0)}"
                        disabled="#{procedureController.medicineFirst == 0}"
                        styleClass="action-button secondary" />
                    
                    <h:commandButton value="Previous"
                        action="#{procedureController.previousMedicinePage()}"
                        disabled="#{procedureController.medicineFirst == 0}"
                        styleClass="action-button secondary" />
                    
                    <h:outputText value="Page #{procedureController.medicineCurrentPage} of #{procedureController.medicineTotalPages}"
                        style="margin: 0 12px; font-weight:bold;" />
                    
                    <h:commandButton value="Next"
                        action="#{procedureController.nextMedicinePage()}"
                        disabled="#{!procedureController.isMedicineHasNextPage()}"
                        styleClass="action-button secondary" />
                    
                    <h:commandButton value="Last"
                        action="#{procedureController.setMedicineFirst((procedureController.medicineTotalPages - 1) * procedureController.medicinePageSize)}"
                        disabled="#{!procedureController.isMedicineHasNextPage()}"
                        styleClass="action-button secondary" />
                </div>
            </h:panelGroup>
        </h:form>
    </div>
</body>
</html>
</f:view>