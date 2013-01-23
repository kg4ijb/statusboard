<%@ page import="com.statusboard.LOSAP" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'LOSAP.label', default: 'LOSAP')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-LOSAP" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-LOSAP" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="LOSAP.staff.label" default="Staff"/></th>

            <g:sortableColumn property="onDuty" title="${message(code: 'LOSAP.onDuty.label', default: 'On Duty')}"/>

            <g:sortableColumn property="offDuty" title="${message(code: 'LOSAP.offDuty.label', default: 'Off Duty')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${LOSAPInstanceList}" status="i" var="LOSAPInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${LOSAPInstance.id}">${fieldValue(bean: LOSAPInstance, field: "staff")}</g:link></td>

                <td>${fieldValue(bean: LOSAPInstance, field: "onDuty")}</td>

                <td>${fieldValue(bean: LOSAPInstance, field: "offDuty")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${LOSAPInstanceTotal}"/>
    </div>
</div>
</body>
</html>
