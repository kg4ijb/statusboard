<%@ page import="com.statusboard.ApparatusStatus" %>



<div class="fieldcontain ${hasErrors(bean: apparatusStatusInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="apparatusStatus.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${apparatusStatusInstance?.name}"/>
</div>

