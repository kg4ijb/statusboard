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



<%@ page import="com.statusboard.LOSAP" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'LOSAP.label', default: 'LOSAP')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

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

<div id="show-LOSAP" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <dl class="dl-horizontal property-list LOSAP">

        <g:if test="${LOSAPInstance?.staff}">
            <dt class="fieldcontain">
                <span id="staff-label" class="property-label"><g:message code="LOSAP.staff.label"
                                                                         default="Staff"/></span>
            </dt>
            <dd>
                <span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show"
                                                                                   id="${LOSAPInstance?.staff?.id}">${LOSAPInstance?.staff?.encodeAsHTML()}</g:link></span>

            </dd>
        </g:if>

        <g:if test="${LOSAPInstance?.onDuty}">
            <dt class="fieldcontain">
                <span id="onDuty-label" class="property-label"><g:message code="LOSAP.onDuty.label"
                                                                          default="On Duty"/></span>
            </dt>
            <dd>
                <span class="property-value" aria-labelledby="onDuty-label"><g:fieldValue bean="${LOSAPInstance}"
                                                                                          field="onDuty"/></span>

            </dd>
        </g:if>

        <g:if test="${LOSAPInstance?.offDuty}">
            <dt class="fieldcontain">
                <span id="offDuty-label" class="property-label"><g:message code="LOSAP.offDuty.label"
                                                                           default="Off Duty"/></span>
            </dt>
            <dd>
                <span class="property-value" aria-labelledby="offDuty-label"><g:fieldValue bean="${LOSAPInstance}"
                                                                                           field="offDuty"/></span>

            </dd>
        </g:if>

    </dl>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${LOSAPInstance?.id}"/>
            <g:link class="btn btn-primary" action="edit" id="${LOSAPInstance?.id}"><g:message
                    code="default.button.edit.label"
                    default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-danger" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
