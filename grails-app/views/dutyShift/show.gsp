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

<%@ page import="com.statusboard.DutyShift" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'dutyShift.label', default: 'DutyShift')}"/>
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

<div id="show-dutyShift" class="content scaffold-show" role="main">
    <h3><g:message code="default.show.label" args="[entityName]"/></h3>
    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <dl class="dl-horizontal property-list dutyShift">

        <g:if test="${dutyShiftInstance?.name}">
            <dt class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="dutyShift.name.label"
                                                                        default="Name"/></span>
            </dt>
            <dd>
                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dutyShiftInstance}"
                                                                                        field="name"/></span>

            </dd>
        </g:if>

        <g:if test="${dutyShiftInstance?.description}">
            <dt class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="dutyShift.description.label"
                                                                               default="Description"/></span>
            </dt>
            <dd>
                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${dutyShiftInstance}" field="description"/></span>

            </dd>
        </g:if>

    </dl>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${dutyShiftInstance?.id}"/>
            <g:link class="btn btn-primary" action="edit" id="${dutyShiftInstance?.id}"><g:message
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
