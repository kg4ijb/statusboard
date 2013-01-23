<%@ page import="com.statusboard.DutyShift" %>



<div class="fieldcontain ${hasErrors(bean: dutyShiftInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="dutyShift.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" maxlength="1" required="" value="${dutyShiftInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dutyShiftInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="dutyShift.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${dutyShiftInstance?.description}"/>
</div>

