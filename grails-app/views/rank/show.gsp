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
        <h3><g:message code="default.show.label" args="[entityName]"/></h3>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
        <dl class="dl-horizontal property-list rank">

            <g:if test="${rankInstance?.rank}">
                <dt class="fieldcontain">
                    <span id="rank-label" class="property-label"><g:message code="rank.rank.label"
                                                                            default="Rank"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="rank-label"><g:fieldValue bean="${rankInstance}"
                                                                                            field="rank"/></span>

                </dd>
            </g:if>

            <g:if test="${rankInstance?.description}">
                <dt class="fieldcontain">
                    <span id="description-label" class="property-label"><g:message code="rank.description.label"
                                                                                   default="Description"/>:</span>
                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                            bean="${rankInstance}"
                            field="description"/></span>

                </dd>
            </g:if>

        </dl>
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
