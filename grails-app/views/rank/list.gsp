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
    <h3><g:message code="default.list.label" args="[entityName]"/></h3>
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
