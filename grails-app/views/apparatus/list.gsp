<%@ page import="com.statusboard.Apparatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'apparatus.label', default: 'Apparatus')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="nav" role="navigation">
        <ul class="nav nav-pills">
            <li><g:link class="create" action="create"><i class="icon-pencil"></i> <g:message code="default.new.label"
                                                                                              args="[entityName]"/></g:link>
            </li>
        </ul>
    </div>

    <div id="list-apparatus" class="content scaffold-list" role="main">
        <h2><g:message code="default.list.label" args="[entityName]"/></h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>

                <g:sortableColumn property="name" title="${message(code: 'apparatus.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'apparatus.description.label', default: 'Description')}"/>

                <g:sortableColumn property="isALS"
                                  title="${message(code: 'apparatus.isALS.label', default: 'Is ALS')}"/>

                <g:sortableColumn property="isRescue"
                                  title="${message(code: 'apparatus.isRescue.label', default: 'Is Rescue')}"/>

                <g:sortableColumn property="numSeats"
                                  title="${message(code: 'apparatus.numSeats.label', default: 'Seats')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${apparatusInstanceList}" status="i" var="apparatusInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${apparatusInstance.id}">${fieldValue(bean: apparatusInstance, field: "name")}</g:link></td>

                    <td>${fieldValue(bean: apparatusInstance, field: "description")}</td>

                    <td><g:formatBoolean boolean="${apparatusInstance.isALS}" true="Yes" false="No"/></td>

                    <td><g:formatBoolean boolean="${apparatusInstance.isRescue}" true="Yes" false="No"/></td>

                    <td>${fieldValue(bean: apparatusInstance, field: "numSeats")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination pagination-right">
            <g:paginate total="${apparatusInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
