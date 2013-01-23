<%@ page import="com.statusboard.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}"/>
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

    <div id="list-staff" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <g:sortableColumn property="fdid" title="${message(code: 'staff.fdid.label', default: 'FDID')}"/>

                <g:sortableColumn property="lastName"
                                  title="${message(code: 'staff.lastName.label', default: 'Last Name')}"/>

                <g:sortableColumn property="firstName"
                                  title="${message(code: 'staff.firstName.label', default: 'First Name')}"/>
                <g:sortableColumn property="username"
                                  title="${message(code: 'staff.username.label', default: 'Username')}"/>

                <g:sortableColumn property="rank" title="${message(code: 'staff.rank.label', default: 'Rank')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${staffInstanceList}" status="i" var="staffInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${staffInstance.id}">${fieldValue(bean: staffInstance, field: "fdid")}</g:link></td>

                    <td>${fieldValue(bean: staffInstance, field: "lastName")}</td>

                    <td>${fieldValue(bean: staffInstance, field: "firstName")}</td>

                    <td>${fieldValue(bean: staffInstance, field: "username")}</td>

                    <td>${fieldValue(bean: staffInstance, field: "rank")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${staffInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
