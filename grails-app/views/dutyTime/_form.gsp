<%@ page import="com.statusboard.DutyTime" %>



<div class="fieldcontain ${hasErrors(bean: dutyTimeInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="dutyTime.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${dutyTimeInstance?.name}"/>
</div>

