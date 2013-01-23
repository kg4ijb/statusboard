<%@ page import="com.statusboard.LOSAP" %>



<div class="fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'staff', 'error')} required">
    <label for="staff">
        <g:message code="LOSAP.staff.label" default="Staff"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="staff" name="staff.id" from="${com.statusboard.Staff.list()}" optionKey="id" required=""
              value="${LOSAPInstance?.staff?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'onDuty', 'error')} required">
    <label for="onDuty">
        <g:message code="LOSAP.onDuty.label" default="On Duty"/>
        <span class="required-indicator">*</span>
    </label>
    <joda:dateTimePicker name="onDuty" value="${LOSAPInstance?.onDuty}"></joda:dateTimePicker>
</div>

<div class="fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'offDuty', 'error')} ">
    <label for="offDuty">
        <g:message code="LOSAP.offDuty.label" default="Off Duty"/>

    </label>
    <joda:dateTimePicker name="offDuty" value="${LOSAPInstance?.offDuty}" default="none"
                         noSelection="['': '']"></joda:dateTimePicker>
</div>

