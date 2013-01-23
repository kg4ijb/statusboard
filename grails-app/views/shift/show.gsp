<%@ page import="com.statusboard.Shift" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'shift.label', default: 'Shift')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-shift" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-shift" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list shift">

        <g:if test="${shiftInstance?.apparatus}">
            <li class="fieldcontain">
                <span id="apparatus-label" class="property-label"><g:message code="shift.apparatus.label"
                                                                             default="Apparatus"/></span>

                <g:each in="${shiftInstance.apparatus}" var="a">
                    <span class="property-value" aria-labelledby="apparatus-label"><g:link controller="apparatus"
                                                                                           action="show"
                                                                                           id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="shift.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${shiftInstance}"
                                                                                               field="dateCreated"/></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.dutyOfficer}">
            <li class="fieldcontain">
                <span id="dutyOfficer-label" class="property-label"><g:message code="shift.dutyOfficer.label"
                                                                               default="Duty Officer"/></span>

                <span class="property-value" aria-labelledby="dutyOfficer-label"><g:link controller="staff"
                                                                                         action="show"
                                                                                         id="${shiftInstance?.dutyOfficer?.id}">${shiftInstance?.dutyOfficer?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.dutyShift}">
            <li class="fieldcontain">
                <span id="dutyShift-label" class="property-label"><g:message code="shift.dutyShift.label"
                                                                             default="Duty Shift"/></span>

                <span class="property-value" aria-labelledby="dutyShift-label"><g:link controller="dutyShift"
                                                                                       action="show"
                                                                                       id="${shiftInstance?.dutyShift?.id}">${shiftInstance?.dutyShift?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.dutyTime}">
            <li class="fieldcontain">
                <span id="dutyTime-label" class="property-label"><g:message code="shift.dutyTime.label"
                                                                            default="Duty Time"/></span>

                <span class="property-value" aria-labelledby="dutyTime-label"><g:link controller="dutyTime"
                                                                                      action="show"
                                                                                      id="${shiftInstance?.dutyTime?.id}">${shiftInstance?.dutyTime?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="shift.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${shiftInstance}"
                                                                                               field="lastUpdated"/></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.notes}">
            <li class="fieldcontain">
                <span id="notes-label" class="property-label"><g:message code="shift.notes.label"
                                                                         default="Notes"/></span>

                <span class="property-value" aria-labelledby="notes-label"><g:link controller="note" action="show"
                                                                                   id="${shiftInstance?.notes?.id}">${shiftInstance?.notes?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${shiftInstance?.stationCommander}">
            <li class="fieldcontain">
                <span id="stationCommander-label" class="property-label"><g:message code="shift.stationCommander.label"
                                                                                    default="Station Commander"/></span>

                <span class="property-value" aria-labelledby="stationCommander-label"><g:link controller="staff"
                                                                                              action="show"
                                                                                              id="${shiftInstance?.stationCommander?.id}">${shiftInstance?.stationCommander?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${shiftInstance?.id}"/>
            <g:link class="edit" action="edit" id="${shiftInstance?.id}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
