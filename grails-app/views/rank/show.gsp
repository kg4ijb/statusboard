<%@ page import="com.statusboard.Rank" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'rank.label', default: 'Rank')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="nav" role="navigation">
        <ul class="nav nav-pills">
            <li><g:link class="list" action="list"><i class="icon-list"></i> <g:message code="default.list.label"
                                                                                        args="[entityName]"/></g:link>
            </li>
            <li><g:link class="create" action="create"><i class="icon-pencil"></i> <g:message code="default.new.label"
                                                                                              args="[entityName]"/></g:link>
            </li>
        </ul>
    </div>

    <div id="show-rank" class="content scaffold-show" role="main">
        <h2><g:message code="default.show.label" args="[entityName]"/></h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list rank">

            <g:if test="${rankInstance?.rank}">
                <li class="fieldcontain">
                    <span id="rank-label" class="property-label"><g:message code="rank.rank.label"
                                                                            default="Rank"/>:</span>

                    <span class="property-value" aria-labelledby="rank-label"><g:fieldValue bean="${rankInstance}"
                                                                                            field="rank"/></span>

                </li>
            </g:if>

            <g:if test="${rankInstance?.description}">
                <li class="fieldcontain">
                    <span id="description-label" class="property-label"><g:message code="rank.description.label"
                                                                                   default="Description"/>:</span>

                    <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                            bean="${rankInstance}"
                            field="description"/></span>

                </li>
            </g:if>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${rankInstance?.id}"/>
                <g:link class="btn btn-primary" action="edit" id="${rankInstance?.id}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
