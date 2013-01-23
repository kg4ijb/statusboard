<%@ page import="com.statusboard.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">

<div class="nav" role="navigation">
    <ul class="nav nav-pills">
        <li><g:link class="list" action="list"><i class="icon-list"></i> <g:message code="default.list.label"
                                                                                    args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><i class="icon-pencil">></i> <g:message code="default.new.label"
                                                                                           args="[entityName]"/></g:link>
        </li>
    </ul>
</div>

<div id="show-staff" class="content scaffold-show" role="main">
    <h2><g:message code="default.show.label" args="[entityName]"/></h2>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list staff">

        <g:if test="${staffInstance?.username}">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><g:message code="staff.username.label"
                                                                            default="Username"/></span>

                <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="username"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.password}">
            <li class="fieldcontain">
                <span id="password-label" class="property-label"><g:message code="staff.password.label"
                                                                            default="Password"/></span>

                <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="password"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="staff.lastName.label"
                                                                            default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${staffInstance}"
                                                                                            field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="staff.firstName.label"
                                                                             default="First Name"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${staffInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.fdid}">
            <li class="fieldcontain">
                <span id="fdid-label" class="property-label"><g:message code="staff.fdid.label"
                                                                        default="Fdid"/></span>

                <span class="property-value" aria-labelledby="fdid-label"><g:fieldValue bean="${staffInstance}"
                                                                                        field="fdid"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.isCarDriver}">
            <li class="fieldcontain">
                <span id="isCarDriver-label" class="property-label"><g:message code="staff.isCarDriver.label"
                                                                               default="Is Car Driver"/></span>

                <span class="property-value" aria-labelledby="isCarDriver-label"><g:formatBoolean
                        boolean="${staffInstance?.isCarDriver}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.isEngineDriver}">
            <li class="fieldcontain">
                <span id="isEngineDriver-label" class="property-label"><g:message code="staff.isEngineDriver.label"
                                                                                  default="Is Engine Driver"/></span>

                <span class="property-value" aria-labelledby="isEngineDriver-label"><g:formatBoolean
                        boolean="${staffInstance?.isEngineDriver}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.isTruckDriver}">
            <li class="fieldcontain">
                <span id="isTruckDriver-label" class="property-label"><g:message code="staff.isTruckDriver.label"
                                                                                 default="Is Truck Driver"/></span>

                <span class="property-value" aria-labelledby="isTruckDriver-label"><g:formatBoolean
                        boolean="${staffInstance?.isTruckDriver}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.accountExpired}">
            <li class="fieldcontain">
                <span id="accountExpired-label" class="property-label"><g:message code="staff.accountExpired.label"
                                                                                  default="Account Expired"/></span>

                <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                        boolean="${staffInstance?.accountExpired}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.accountLocked}">
            <li class="fieldcontain">
                <span id="accountLocked-label" class="property-label"><g:message code="staff.accountLocked.label"
                                                                                 default="Account Locked"/></span>

                <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                        boolean="${staffInstance?.accountLocked}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.dutyShift}">
            <li class="fieldcontain">
                <span id="dutyShift-label" class="property-label"><g:message code="staff.dutyShift.label"
                                                                             default="Duty Shift"/></span>

                <span class="property-value" aria-labelledby="dutyShift-label"><g:link controller="dutyShift"
                                                                                       action="show"
                                                                                       id="${staffInstance?.dutyShift?.id}">${staffInstance?.dutyShift?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.emsLevel}">
            <li class="fieldcontain">
                <span id="emsLevel-label" class="property-label"><g:message code="staff.emsLevel.label"
                                                                            default="Ems Level"/></span>

                <span class="property-value" aria-labelledby="emsLevel-label"><g:link controller="emsLevel"
                                                                                      action="show"
                                                                                      id="${staffInstance?.emsLevel?.id}">${staffInstance?.emsLevel?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.enabled}">
            <li class="fieldcontain">
                <span id="enabled-label" class="property-label"><g:message code="staff.enabled.label"
                                                                           default="Enabled"/></span>

                <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                        boolean="${staffInstance?.enabled}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.passwordExpired}">
            <li class="fieldcontain">
                <span id="passwordExpired-label" class="property-label"><g:message
                        code="staff.passwordExpired.label" default="Password Expired"/></span>

                <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                        boolean="${staffInstance?.passwordExpired}"/></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.rank}">
            <li class="fieldcontain">
                <span id="rank-label" class="property-label"><g:message code="staff.rank.label"
                                                                        default="Rank"/></span>

                <span class="property-value" aria-labelledby="rank-label"><g:link controller="rank" action="show"
                                                                                  id="${staffInstance?.rank?.id}">${staffInstance?.rank?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${staffInstance?.authorities}">
            <li class="fieldcontain">
                <span id="role-label" class="property-label"><g:message code="staff.authorities.label"
                                                                        default="Authorities"></g:message></span>
                <span class="property-value" aria-labelledby="authorities-label"><g:link controller="authorities"
                                                                                         action="show"
                                                                                         id="${staffInstance?.authorities.id}">${staffInstance?.authorities?.authority?.encodeAsHTML()}</g:link></span>
            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${staffInstance?.id}"/>
            <g:link class="btn btn-primary" action="edit" id="${staffInstance?.id}"><g:message
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
