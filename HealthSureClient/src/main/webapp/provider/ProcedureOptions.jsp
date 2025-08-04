<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<f:view>
<html>
<head>
    <title>Select Procedure Type</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ProcedureOptions.css" />
</head>
<body>
 <jsp:include page="/navbar/NavProvider.jsp" />
    <h:form>
        <div class="container">
            <h2>Select Procedure Type</h2>
            <div class="radio-group">
                <div class="radio-item">
                    <h:selectOneRadio value="#{procedureController.procedureType}" layout="lineDirection">
                        <f:selectItem itemLabel="Single Day (Completed Today)" itemValue="single" />
                        <f:selectItem itemLabel="Long-Term (Scheduled for Future)" itemValue="scheduled" />
                        <f:selectItem itemLabel="Long-Term (Starting Today)" itemValue="inprogress" />
                    </h:selectOneRadio>
                </div>
            </div>
            <h:commandButton value="Create New Procedure"
                             action="#{procedureController.createNewProcedure()}"
                             styleClass="submit-btn" />
        </div>
    </h:form>
</f:view>
</body>
</html>
