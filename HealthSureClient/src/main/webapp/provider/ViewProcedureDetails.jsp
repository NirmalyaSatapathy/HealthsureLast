<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<f:view>
<html>
<head>
    <title>Started Procedure Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ViewProcedureDetails.css" />
    <!-- Disable caching -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

</head>
<body>
    <div class="page-wrapper">
        <jsp:include page="/navbar/NavProvider.jsp" />

        <div class="main-content">
            <div class="form-container">
                <div class="form-title">Procedure Details</div>

                <h:form prependId="false">
                    <h:messages globalOnly="true" styleClass="error-message" />

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="procedureId">Procedure ID</label>
                            <h:inputText id="procedureId" value="#{procedureController.procedure.procedureId}" readonly="true" styleClass="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="appointmentId">Appointment ID <span style="color:red">*</span></label>
                            <h:inputText id="appointmentId" value="#{procedureController.procedure.appointment.appointmentId}" readonly="true" styleClass="form-control" />
                            <h:message for="appointmentId" styleClass="error-message" />
                        </div>

                        <div class="form-group">
                            <label for="recipientId">Patient (h_id) <span style="color:red">*</span></label>
                            <h:inputText id="recipientId" value="#{procedureController.procedure.recipient.hId}" readonly="true" styleClass="form-control" />
                            <h:message for="recipientId" styleClass="error-message" />
                        </div>

                        <div class="form-group">
                            <label for="providerId">Provider ID <span style="color:red">*</span></label>
                            <h:inputText id="providerId" value="#{procedureController.procedure.provider.providerId}" readonly="true" styleClass="form-control" />
                            <h:message for="providerId" styleClass="error-message" />
                        </div>

                        <div class="form-group">
                            <label for="doctorId">Doctor ID <span style="color:red">*</span></label>
                            <h:inputText id="doctorId" value="#{procedureController.procedure.doctor.doctorId}" readonly="true" styleClass="form-control" />
                            <h:message for="doctorId" styleClass="error-message" />
                        </div>

                        <div class="form-group">
                            <label for="procedureDate">Procedure Start Date <span style="color:red">*</span></label>
                            <h:inputText id="fromDate" value="#{procedureController.procedure.fromDate}" readonly="true" styleClass="form-control">
                                <f:convertDateTime pattern="yyyy-MM-dd" />
                            </h:inputText>
                            <h:message for="procedureDate" styleClass="error-message" />
                        </div>

                        <div class="form-group full-width">
                            <label for="diagnosis">Diagnosis <span style="color:red">*</span></label>
                            <h:inputTextarea id="diagnosis" value="#{procedureController.procedure.diagnosis}" readonly="true" styleClass="form-control" />
                            <h:message for="diagnosis" styleClass="error-message" />
                        </div>

                        <div class="form-group full-width">
                            <label for="recommendations">Recommendations</label>
                            <h:inputTextarea id="recommendations" value="#{procedureController.procedure.recommendations}" styleClass="form-control" />
                            <h:message for="recommendations" styleClass="error-message" />
                        </div>
                    </div>

                    <div class="button-group">
                        <h:commandButton value="Add Details" styleClass="green-button" action="#{procedureController.updateProcedure()}" />
                    </div>
                </h:form>
            </div>
        </div>
    </div>
</body>
</html>
</f:view>