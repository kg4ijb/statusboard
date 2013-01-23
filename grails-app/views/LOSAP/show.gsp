<%@ page import="com.statusboard.LOSAP" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'LOSAP.label', default: 'LOSAP')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-LOSAP" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-LOSAP" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list LOSAP">

        <g:if test="${LOSAPInstance?.staff}">
            <li class="fieldcontain">
                <span id="staff-label" class="property-label"><g:message code="LOSAP.staff.label"
                                                                         default="Staff"/></span>

                <span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show"
                                                                                   id="${LOSAPInstance?.staff?.id}">${LOSAPInstance?.staff?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${LOSAPInstance?.onDuty}">
            <li class="fieldcontain">
                <span id="onDuty-label" class="property-label"><g:message code="LOSAP.onDuty.label"
                                                                          default="On Duty"/></span>

                <span class="property-value" aria-labelledby="onDuty-label"><g:fieldValue bean="${LOSAPInstance}"
                                                                                          field="onDuty"/></span>

            </li>
        </g:if>

        <g:if test="${LOSAPInstance?.offDuty}">
            <li class="fieldcontain">
                <span id="offDuty-label" class="property-label"><g:message code="LOSAP.offDuty.label"
                                                                           default="Off Duty"/></span>

                <span class="property-value" aria-labelledby="offDuty-label"><g:fieldValue bean="${LOSAPInstance}"
                                                                                           field="offDuty"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${LOSAPInstance?.id}"/>
            <g:link class="edit" action="edit" id="${LOSAPInstance?.id}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
