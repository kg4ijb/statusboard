<%@ page import="com.statusboard.Shift" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'shift.label', default: 'Shift')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-shift" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-shift" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="shift.dutyTime.label" default="Duty Time"/></th>

            <th><g:message code="shift.dutyShift.label" default="Duty Shift"/></th>

            <th><g:message code="shift.dutyOfficer.label" default="Duty Officer"/></th>

            <th><g:message code="shift.stationCommander.label" default="Station Commander"/></th>

            <th><g:message code="shift.notes.label" default="Notes"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'shift.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${shiftInstanceList}" status="i" var="shiftInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${shiftInstance.id}">${fieldValue(bean: shiftInstance, field: "dutyTime")}</g:link></td>

                <td>${fieldValue(bean: shiftInstance, field: "dutyShift")}</td>

                <td>${fieldValue(bean: shiftInstance, field: "dutyOfficer")}</td>

                <td>${fieldValue(bean: shiftInstance, field: "stationCommander")}</td>

                <td>${fieldValue(bean: shiftInstance, field: "notes")}</td>

                <td>${fieldValue(bean: shiftInstance, field: "dateCreated")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${shiftInstanceTotal}"/>
    </div>
</div>
</body>
</html>
