<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>Edit Prescribed Medicine</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/EditMedicine.css" />
    <!-- Prevent HTML caching -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <script type="text/javascript">
        window.addEventListener('pageshow', function(event) {
            var navEntries = performance.getEntriesByType?.("navigation");
            var navType = navEntries?.length ? navEntries[0].type : "";
            if (event.persisted || navType === "back_forward") {
                document.querySelectorAll('.error').forEach(el => el.textContent = '');
            }
        });
    </script>

</head>
<body>
<div class="page-wrapper">
    <jsp:include page="/navbar/NavProvider.jsp" />

    <div class="main-content">
        <div class="form-container">
            <div class="form-title">Edit Prescribed Medicine</div>

            <h:form prependId="false">
                <h:messages globalOnly="true" styleClass="error" />
<h:panelGroup rendered="#{not procedureController.validDoctor}">
						<div class="form-group center-group compact-auth">
							<h:outputLabel for="doctorId" value="Enter Doctor ID:" />

							<h:inputText id="doctorId"
								value="#{procedureController.doctorId}"
								styleClass="form-control input-small" />

							<h:message for="doctorId" styleClass="error" />

							<h:commandButton value="Authenticate"
								action="#{procedureController.authenticatePrescriptionDoctor(procedureController.doctorId)}"
								styleClass="btn-add btn-small btn-authenticate" />
						</div>
					</h:panelGroup>
					<h:panelGroup rendered="#{procedureController.validDoctor}">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="prescribedId">Prescribed ID</label>
                        <h:inputText id="prescribedId" value="#{procedureController.prescribedMedicine.prescribedId}" readonly="true" styleClass="form-control" />
                        <h:message for="prescribedId" styleClass="error" />
                    </div>

                    <div class="form-group">
                        <label for="prescriptionId">Prescription ID</label>
                        <h:inputText id="prescriptionId" value="#{procedureController.prescription.prescriptionId}" readonly="true" styleClass="form-control" />
                        <h:message for="prescriptionId" styleClass="error" />
                    </div>

                    <div class="form-group">
                        <label for="medicineName">Medicine Name <span style="color:red">*</span></label>
                        <h:inputText id="medicineName" value="#{procedureController.prescribedMedicine.medicineName}" styleClass="form-control" readonly="true"/>
                        <h:message for="medicineName" styleClass="error" />
                    </div>

                    <div class="form-group">
    <label for="type">Medicine Type <span style="color:red">*</span></label>

    <h:outputText value="#{procedureController.prescribedMedicine.type}" styleClass="form-control" />
    <h:inputHidden value="#{procedureController.prescribedMedicine.type}" />

    <h:message for="type" styleClass="error" />
</div>

                    <div class="form-group">
                        <label for="dosage">Dosage <span style="color:red">*</span></label>
                        <h:inputText id="dosage" value="#{procedureController.prescribedMedicine.dosage}" styleClass="form-control" />
                        <h:message for="dosage" styleClass="error" />
                    </div>

                    <div class="form-group">
                        <label for="duration">Duration (days) <span style="color:red">*</span></label>
                        <h:inputText id="duration" value="#{procedureController.prescribedMedicine.duration}" styleClass="form-control" />
                        <h:message for="duration" styleClass="error" />
                    </div>

                    <div class="form-group">
                        <label for="startDate">Start Date <span style="color:red">*</span></label>
                        <h:inputText id="startDate" value="#{procedureController.prescribedMedicine.startDate}" styleClass="form-control">
                            <f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:inputText>
                        <h:message for="startDate" styleClass="error" />
                        <script>
                            const calendarInput = document.querySelector("#startDate");
                            if (calendarInput) {
                                calendarInput.setAttribute("type", "date");
                            }
                        </script>
                    </div>

                    <div class="form-group full-width">
                        <label for="notes">Notes</label>
                        <h:inputTextarea id="notes" value="#{procedureController.prescribedMedicine.notes}" styleClass="form-control" />
                        <h:message for="notes" styleClass="error" />
                    </div>
                </div>

                <div class="button-group">
                    <h:commandButton value="save Medicine" action="#{procedureController.updateMedicine(procedureController.prescribedMedicine)}" styleClass="btn-add" />
                    <h:commandButton value="Reset Form" action="#{procedureController.restEditMedicine()}" immediate="true" styleClass="btn-reset" />
                	 <h:commandButton value="back"
							action="#{procedureController.backFromEditMedicine()}"
							styleClass="shared-button" />
                </div>
                </h:panelGroup>
        </h:form>
         </div>
    </div>
    </div>
</body>
</html>
</f:view>