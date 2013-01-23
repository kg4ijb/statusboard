<%@ page import="com.statusboard.Rank" %>



<div class="fieldcontain ${hasErrors(bean: rankInstance, field: 'rank', 'error')} required">
    <label for="rank">
        <g:message code="rank.rank.label" default="Rank"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="rank" required="" value="${rankInstance?.rank}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: rankInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="rank.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${rankInstance?.description}"/>
</div>

