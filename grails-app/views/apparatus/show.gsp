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

<%@ page import="com.statusboard.Apparatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'apparatus.label', default: 'Apparatus')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <g:javascript>
        $(document).ready(function (e) {
            // Check if there's a message
            if ($('.alert').length) {
                // If mouse is clicked, moved or a key is pressed
                $(document).one('click mousemove keypress', function (e) {
                    // Fade the message away after 500 ms
                    $('.alert').animate({ opacity: 1.0 }, 500).fadeOut();
                });
            }
        });
    </g:javascript>

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
        <h3><g:message code="default.show.label" args="[entityName]"/></h3>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
        <dl class="dl-horizontal staff">

            <g:if test="${apparatusInstance?.name}">
                <dt class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="apparatus.name.label"
                                                                            default="Name"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${apparatusInstance}"
                                                                                            field="name"/></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.description}">
                <dt class="fieldcontain">
                    <span id="description-label" class="property-label"><g:message code="apparatus.description.label"
                                                                                   default="Description"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                            bean="${apparatusInstance}" field="description"/></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.isALS}">
                <dt class="fieldcontain">
                    <span id="isALS-label" class="property-label"><g:message code="apparatus.isALS.label"
                                                                             default="Has ALS Package"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="isALS-label"><g:formatBoolean
                            boolean="${apparatusInstance?.isALS}" true="Yes" false="No"/></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.isRescue}">
                <dt class="fieldcontain">
                    <span id="isRescue-label" class="property-label"><g:message code="apparatus.isRescue.label"
                                                                                default="Has Rescue Package"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="isRescue-label"><g:formatBoolean
                            boolean="${apparatusInstance?.isRescue}" true="Yes" false="No"/></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.numSeats}">
                <dt class="fieldcontain">
                    <span id="numSeats-label" class="property-label"><g:message code="apparatus.numSeats.label"
                                                                                default="Num Seats"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="numSeats-label"><g:fieldValue
                            bean="${apparatusInstance}" field="numSeats"/></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.note}">
                <dt class="fieldcontain">
                    <span id="note-label" class="property-label"><g:message code="apparatus.note.label"
                                                                            default="Note"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="note-label"><g:link controller="note" action="show"
                                                                                      id="${apparatusInstance?.note?.id}">${apparatusInstance?.note?.encodeAsHTML()}</g:link></span>

                </dd>
            </g:if>

            <g:if test="${apparatusInstance?.status}">
                <dt class="fieldcontain">
                    <span id="status-label" class="property-label"><g:message code="apparatus.status.label"
                                                                              default="Status"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="status-label"><g:link controller="apparatusStatus"
                                                                                        action="show"
                                                                                        id="${apparatusInstance?.status?.id}">${apparatusInstance?.status?.encodeAsHTML()}</g:link></span>

                </dd>
            </g:if>

        </dl>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${apparatusInstance?.id}"/>
                <g:link type="button" class="btn btn-primary" action="edit" id="${apparatusInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
