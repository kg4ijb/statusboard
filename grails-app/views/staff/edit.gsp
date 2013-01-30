<%@ page import="com.statusboard.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
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

    <div id="edit-staff" class="content scaffold-edit" role="main">
        <h3><g:message code="default.edit.label" args="[entityName]"/></h3>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${staffInstance}">
            <div class="alert alert-error">
                <ul class="errors" role="alert">
                    <g:eachError bean="${staffInstance}" var="error">
                        <li>
                            <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"
                            </g:if>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
        <g:form class="form-horizontal" method="post">
            <g:hiddenField name="id" value="${staffInstance?.id}"/>
            <g:hiddenField name="version" value="${staffInstance?.version}"/>
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <fieldset class="buttons">
                <g:actionSubmit class="btn btn-primary" action="update"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                formnovalidate=""
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
