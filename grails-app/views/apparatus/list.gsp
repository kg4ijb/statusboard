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
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="nav" role="navigation">
        <ul class="nav nav-pills">
            <li><g:link class="create" action="create"><i class="icon-pencil"></i> <g:message code="default.new.label"
                                                                                              args="[entityName]"/></g:link>
            </li>
        </ul>
    </div>

    <div id="list-apparatus" class="content scaffold-list" role="main">
        <h3><g:message code="default.list.label" args="[entityName]"/></h3>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>

                <g:sortableColumn property="name" title="${message(code: 'apparatus.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'apparatus.description.label', default: 'Description')}"/>

                <g:sortableColumn property="isALS"
                                  title="${message(code: 'apparatus.isALS.label', default: 'Is ALS')}"/>

                <g:sortableColumn property="isRescue"
                                  title="${message(code: 'apparatus.isRescue.label', default: 'Is Rescue')}"/>

                <g:sortableColumn property="numSeats"
                                  title="${message(code: 'apparatus.numSeats.label', default: 'Seats')}"/>

                <g:sortableColumn property="status"
                                  title="${message(code: 'appartus.status.label', default: 'Status')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${apparatusInstanceList}" status="i" var="apparatusInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${apparatusInstance.id}">${fieldValue(bean: apparatusInstance, field: "name")}</g:link></td>

                    <td>${fieldValue(bean: apparatusInstance, field: "description")}</td>

                    <td><g:formatBoolean boolean="${apparatusInstance.isALS}" true="Yes" false="No"/></td>

                    <td><g:formatBoolean boolean="${apparatusInstance.isRescue}" true="Yes" false="No"/></td>

                    <td>${fieldValue(bean: apparatusInstance, field: "numSeats")}</td>

                    <td>${fieldValue(bean: apparatusInstance, field: 'status')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination pagination-right">
            <g:paginate total="${apparatusInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
