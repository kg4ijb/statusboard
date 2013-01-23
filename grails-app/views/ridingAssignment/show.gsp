<%@ page import="com.statusboard.RidingAssignment" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ridingAssignment.label', default: 'RidingAssignment')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-ridingAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                       default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-ridingAssignment" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list ridingAssignment">

        <g:if test="${ridingAssignmentInstance?.apparatus}">
            <li class="fieldcontain">
                <span id="apparatus-label" class="property-label"><g:message code="ridingAssignment.apparatus.label"
                                                                             default="Apparatus"/></span>

                <span class="property-value" aria-labelledby="apparatus-label"><g:link controller="apparatus"
                                                                                       action="show"
                                                                                       id="${ridingAssignmentInstance?.apparatus?.id}">${ridingAssignmentInstance?.apparatus?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${ridingAssignmentInstance?.seat}">
            <li class="fieldcontain">
                <span id="seat-label" class="property-label"><g:message code="ridingAssignment.seat.label"
                                                                        default="Seat"/></span>

                <span class="property-value" aria-labelledby="seat-label"><g:link controller="seat" action="show"
                                                                                  id="${ridingAssignmentInstance?.seat?.id}">${ridingAssignmentInstance?.seat?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${ridingAssignmentInstance?.staff}">
            <li class="fieldcontain">
                <span id="staff-label" class="property-label"><g:message code="ridingAssignment.staff.label"
                                                                         default="Staff"/></span>

                <span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show"
                                                                                   id="${ridingAssignmentInstance?.staff?.id}">${ridingAssignmentInstance?.staff?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${ridingAssignmentInstance?.id}"/>
            <g:link class="edit" action="edit" id="${ridingAssignmentInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
