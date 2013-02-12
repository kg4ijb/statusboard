%{--
  - Copyright 2005-2013 StationStatusboard.com
  - Licensed under the Apache License, Version 2.0 (the "License");
  - you may not use this file except in compliance with the License.
  - You may obtain a copy of the License at
  -
  -      http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  --}%

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
<h3><g:message code="default.show.label" args="[entityName]"/></h3>
<g:if test="${flash.message}">
    <div class="alert alert-success" role="status">${flash.message}</div>
</g:if>
<dl class="dl-horizontal staff">

    <g:if test="${staffInstance?.username}">
        <dt class="fieldcontain">
            <span id="username-label" class="property-label"><g:message code="staff.username.label"
                                                                        default="Username"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${staffInstance}"
                                                                                        field="username"/></span>
        </dd>

    </g:if>

    <g:if test="${staffInstance?.lastName}">
        <dt class="fieldcontain">
            <span id="lastName-label" class="property-label"><g:message code="staff.lastName.label"
                                                                        default="Last Name"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${staffInstance}"
                                                                                        field="lastName"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.firstName}">
        <dt class="fieldcontain">
            <span id="firstName-label" class="property-label"><g:message code="staff.firstName.label"
                                                                         default="First Name"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${staffInstance}"
                                                                                         field="firstName"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.fdid}">
        <dt class="fieldcontain">
            <span id="fdid-label" class="property-label"><g:message code="staff.fdid.label"
                                                                    default="FDID"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="fdid-label"><g:fieldValue bean="${staffInstance}"
                                                                                    field="fdid"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.email}">
        <dt class="fieldcontain">
            <span id="email-label" class="property-label"><g:message code="staff.email.label" default="email"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${staffInstance}"
                                                                                     field="email"/></span>
        </dd>
    </g:if>

    <g:if test="${staffInstance?.isCarDriver}">
        <dt class="fieldcontain">
            <span id="isCarDriver-label" class="property-label"><g:message code="staff.isCarDriver.label"
                                                                           default="Is Car Driver"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="isCarDriver-label"><g:formatBoolean
                    boolean="${staffInstance?.isCarDriver}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.isEngineDriver}">
        <dt class="fieldcontain">
            <span id="isEngineDriver-label" class="property-label"><g:message code="staff.isEngineDriver.label"
                                                                              default="Is Engine Driver"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="isEngineDriver-label"><g:formatBoolean
                    boolean="${staffInstance?.isEngineDriver}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.isTruckDriver}">
        <dt class="fieldcontain">
            <span id="isTruckDriver-label" class="property-label"><g:message code="staff.isTruckDriver.label"
                                                                             default="Is Truck Driver"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="isTruckDriver-label"><g:formatBoolean
                    boolean="${staffInstance?.isTruckDriver}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.accountExpired}">
        <dt class="fieldcontain">
            <span id="accountExpired-label" class="property-label"><g:message code="staff.accountExpired.label"
                                                                              default="Account Expired"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                    boolean="${staffInstance?.accountExpired}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.accountLocked}">
        <dt class="fieldcontain">
            <span id="accountLocked-label" class="property-label"><g:message code="staff.accountLocked.label"
                                                                             default="Account Locked"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                    boolean="${staffInstance?.accountLocked}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.dutyShift}">
        <dt class="fieldcontain">
            <span id="dutyShift-label" class="property-label"><g:message code="staff.dutyShift.label"
                                                                         default="Duty Shift"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="dutyShift-label"><g:link controller="dutyShift"
                                                                                   action="show"
                                                                                   id="${staffInstance?.dutyShift?.id}">${staffInstance?.dutyShift?.encodeAsHTML()}</g:link></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.emsLevel}">
        <dt class="fieldcontain">
            <span id="emsLevel-label" class="property-label"><g:message code="staff.emsLevel.label"
                                                                        default="EMS Level"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="emsLevel-label"><g:link controller="emsLevel"
                                                                                  action="show"
                                                                                  id="${staffInstance?.emsLevel?.id}">${staffInstance?.emsLevel?.encodeAsHTML()}</g:link></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.enabled}">
        <dt class="fieldcontain">
            <span id="enabled-label" class="property-label"><g:message code="staff.enabled.label"
                                                                       default="Enabled"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                    boolean="${staffInstance?.enabled}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.passwordExpired}">
        <dt class="fieldcontain">
            <span id="passwordExpired-label" class="property-label"><g:message
                    code="staff.passwordExpired.label" default="Password Expired"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                    boolean="${staffInstance?.passwordExpired}"/></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.rank}">
        <dt class="fieldcontain">
            <span id="rank-label" class="property-label"><g:message code="staff.rank.label"
                                                                    default="Rank"/></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="rank-label"><g:link controller="rank" action="show"
                                                                              id="${staffInstance?.rank?.id}">${staffInstance?.rank?.encodeAsHTML()}</g:link></span>

        </dd>
    </g:if>

    <g:if test="${staffInstance?.authorities}">
        <dt class="fieldcontain">
            <span id="role-label" class="property-label"><g:message code="staff.authorities.label"
                                                                    default="Authorities"></g:message></span>
        </dt>
        <dd>
            <span class="property-value" aria-labelledby="authorities-label"><g:link controller="authorities"
                                                                                     action="show"
                                                                                     id="${staffInstance?.authorities.id}">${staffInstance?.authorities?.authority?.encodeAsHTML()}</g:link></span>
        </dd>
    </g:if>

</dl>
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
