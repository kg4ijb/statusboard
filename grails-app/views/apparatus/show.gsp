<%@ page import="com.statusboard.Apparatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'apparatus.label', default: 'Apparatus')}"/>
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

    <div id="show-apparatus" class="content scaffold-show" role="main">
        <h2><g:message code="default.show.label" args="[entityName]"/></h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list apparatus">

            <g:if test="${apparatusInstance?.name}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="apparatus.name.label"
                                                                            default="Name"/>:</span>

                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${apparatusInstance}"
                                                                                            field="name"/></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.description}">
                <li class="fieldcontain">
                    <span id="description-label" class="property-label"><g:message code="apparatus.description.label"
                                                                                   default="Description"/>:</span>

                    <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                            bean="${apparatusInstance}" field="description"/></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.isALS}">
                <li class="fieldcontain">
                    <span id="isALS-label" class="property-label"><g:message code="apparatus.isALS.label"
                                                                             default="Has ALS Package"/>:</span>

                    <span class="property-value" aria-labelledby="isALS-label"><g:formatBoolean
                            boolean="${apparatusInstance?.isALS}" true="Yes" false="No"/></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.isRescue}">
                <li class="fieldcontain">
                    <span id="isRescue-label" class="property-label"><g:message code="apparatus.isRescue.label"
                                                                                default="Has Rescue Package"/>:</span>

                    <span class="property-value" aria-labelledby="isRescue-label"><g:formatBoolean
                            boolean="${apparatusInstance?.isRescue}" true="Yes" false="No"/></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.numSeats}">
                <li class="fieldcontain">
                    <span id="numSeats-label" class="property-label"><g:message code="apparatus.numSeats.label"
                                                                                default="Num Seats"/>:</span>

                    <span class="property-value" aria-labelledby="numSeats-label"><g:fieldValue
                            bean="${apparatusInstance}" field="numSeats"/></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.note}">
                <li class="fieldcontain">
                    <span id="note-label" class="property-label"><g:message code="apparatus.note.label"
                                                                            default="Note"/>:</span>

                    <span class="property-value" aria-labelledby="note-label"><g:link controller="note" action="show"
                                                                                      id="${apparatusInstance?.note?.id}">${apparatusInstance?.note?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${apparatusInstance?.status}">
                <li class="fieldcontain">
                    <span id="status-label" class="property-label"><g:message code="apparatus.status.label"
                                                                              default="Status"/>:</span>

                    <span class="property-value" aria-labelledby="status-label"><g:link controller="apparatusStatus"
                                                                                        action="show"
                                                                                        id="${apparatusInstance?.status?.id}">${apparatusInstance?.status?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${apparatusInstance?.id}"/>
                <g:link class="btn btn-primary" action="edit" id="${apparatusInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</body>
</html>
