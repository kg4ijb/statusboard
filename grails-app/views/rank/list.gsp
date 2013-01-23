<%@ page import="com.statusboard.Rank" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'rank.label', default: 'Rank')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul class="nav nav-pills">
        <li><g:link class="create" action="create"><i class="icon-pencil"></i> <g:message code="default.new.label"
                                                                                          args="[entityName]"/></g:link>
        </li>
    </ul>
</div>

<div id="list-rank" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>

            <g:sortableColumn property="rank" title="${message(code: 'rank.rank.label', default: 'Rank')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'rank.description.label', default: 'Description')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${rankInstanceList}" status="i" var="rankInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${rankInstance.id}">${fieldValue(bean: rankInstance, field: "rank")}</g:link></td>

                <td>${fieldValue(bean: rankInstance, field: "description")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination pagination-right">
        <g:paginate total="${rankInstanceTotal}"/>
    </div>
</div>
</body>
</html>
