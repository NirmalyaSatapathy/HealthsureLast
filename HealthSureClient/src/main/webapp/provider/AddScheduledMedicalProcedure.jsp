<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>Scheduled Medical Procedure</title>

    <!-- Disable caching -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <script type="text/javascript">
        window.addEventListener('pageshow', function(event) {
            var navEntries = performance.getEntriesByType?.("navigation");
            var navType = navEntries?.length ? navEntries[0].type : "";
            if (event.persisted || navType === "back_forward") {
                document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
            }
        });
    </script>

    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f8fb;
            overflow: hidden;
        }

        .page-wrapper {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .main-content {
            flex-grow: 1;
            padding: 10px;
            overflow-y: auto;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 90px;
        }

        .form-container {
            max-width: 600px;
            width: 100%;
            padding: 15px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        .form-title {
            text-align: center;
            font-size: 22px;
            margin-bottom: 12px;
            color: #2a3f54;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label, h\:outputLabel {
            font-weight: bold;
            margin-bottom: 4px;
            font-size: 15px;
            color: #2c3e50;
        }

        .form-control {
            width: 100%;
            padding: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 15px;
        }

        .error-message {
            display: block;
            color: #f44336 !important;
            font-size: 14px;
            font-weight: 600;
            margin-top: 3px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }

        .green-button, .blue-button {
            padding: 8px 14px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .green-button {
            background-color: #28a745;
        }

        .green-button:hover {
            background-color: #218838;
        }

        .blue-button {
            background-color: #007bff;
        }

        .blue-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="page-wrapper">
    <jsp:include page="/navbar/NavProvider.jsp" />
    <div class="main-content">
        <div class="form-container">
            <div class="form-title">Scheduled Medical Procedure</div>

            <h:form prependId="false">
                <h:messages globalOnly="true" styleClass="error-message" />

                <div class="form-grid">
                    <div class="form-group">
                        <h:outputLabel for="procedureId" value="Procedure ID:" />
                        <h:inputText id="procedureId" value="#{procedureController.procedure.procedureId}" readonly="true" styleClass="form-control" />
                        <h:message for="procedureId" styleClass="error-message" />
                    </div>

                    <div class="form-group">
                        <h:outputLabel for="appointmentId">Appointment ID <span style="color:red">*</span></h:outputLabel>
                        <h:inputText id="appointmentId" value="#{procedureController.procedure.appointment.appointmentId}" readonly="true" styleClass="form-control" />
                        <h:message for="appointmentId" styleClass="error-message" />
                    </div>

                    <div class="form-group">
                        <h:outputLabel for="recipientId">Patient (h_id) <span style="color:red">*</span></h:outputLabel>
                        <h:inputText id="recipientId" value="#{procedureController.procedure.recipient.hId}" readonly="true" styleClass="form-control" />
                        <h:message for="recipientId" styleClass="error-message" />
                    </div>

                    <div class="form-group">
                        <h:outputLabel for="providerId">Provider ID <span style="color:red">*</span></h:outputLabel>
                        <h:inputText id="providerId" value="#{procedureController.procedure.provider.providerId}" readonly="true" styleClass="form-control" />
                        <h:message for="providerId" styleClass="error-message" />
                    </div>

                    <div class="form-group">
                        <h:outputLabel for="doctorId">Doctor ID <span style="color:red">*</span></h:outputLabel>
                        <h:inputText id="doctorId" value="#{procedureController.procedure.doctor.doctorId}" readonly="true" styleClass="form-control" />
                        <h:message for="doctorId" styleClass="error-message" />
                    </div>

                    <div class="form-group">
                        <h:outputLabel for="scheduledDate">Scheduled Date <span style="color:red">*</span></h:outputLabel>
                        <h:inputText id="scheduledDate" value="#{procedureController.procedure.scheduledDate}" styleClass="form-control">
                            <f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:inputText>
                        <h:message for="scheduledDate" styleClass="error-message" />
                        <script>
                            const calendarInput = document.querySelector("#scheduledDate");
                            if (calendarInput) {
                                calendarInput.setAttribute("type", "date");
                                const today = new Date().toISOString().split("T")[0];
                                calendarInput.setAttribute("min", today);
                            }
                        </script>
                    </div>

                    <div class="form-group full-width">
                        <h:outputLabel for="diagnosis">Diagnosis <span style="color:red">*</span></h:outputLabel>
                        <h:inputTextarea id="diagnosis" value="#{procedureController.procedure.diagnosis}" styleClass="form-control" />
                        <h:message for="diagnosis" styleClass="error-message" />
                    </div>

                    <div class="form-group full-width">
                        <h:outputLabel for="recommendations" value="Recommendations:" />
                        <h:inputTextarea id="recommendations" value="#{procedureController.procedure.recommendations}" styleClass="form-control" />
                        <h:message for="recommendations" styleClass="error-message" />
                    </div>
                </div>

                <div class="button-group">
                    <h:commandButton value="Add Scheduled Procedure" action="#{procedureController.addScheduledMedicalProcedureController(procedureController.procedure)}" styleClass="green-button" />
                    <h:commandButton value="Reset Form" action="#{procedureController.createNewProcedure()}" styleClass="blue-button" />
                </div>
            </h:form>
        </div>
    </div>
</div>
</body>
</html>
</f:view>