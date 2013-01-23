<%@ page import="com.statusboard.Staff" %>



<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="staff.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${staffInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="staff.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="password" required="" value="${staffInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="staff.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${staffInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="staff.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${staffInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'fdid', 'error')} required">
    <label for="fdid">
        <g:message code="staff.fdid.label" default="Fdid"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="fdid" maxlength="4" required="" value="${staffInstance?.fdid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'isCarDriver', 'error')} ">
    <label for="isCarDriver">
        <g:message code="staff.isCarDriver.label" default="Is Car Driver"/>

    </label>
    <g:checkBox name="isCarDriver" value="${staffInstance?.isCarDriver}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'isEngineDriver', 'error')} ">
    <label for="isEngineDriver">
        <g:message code="staff.isEngineDriver.label" default="Is Engine Driver"/>

    </label>
    <g:checkBox name="isEngineDriver" value="${staffInstance?.isEngineDriver}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'isTruckDriver', 'error')} ">
    <label for="isTruckDriver">
        <g:message code="staff.isTruckDriver.label" default="Is Truck Driver"/>

    </label>
    <g:checkBox name="isTruckDriver" value="${staffInstance?.isTruckDriver}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
        <g:message code="staff.accountExpired.label" default="Account Expired"/>

    </label>
    <g:checkBox name="accountExpired" value="${staffInstance?.accountExpired}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
        <g:message code="staff.accountLocked.label" default="Account Locked"/>

    </label>
    <g:checkBox name="accountLocked" value="${staffInstance?.accountLocked}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'dutyShift', 'error')} required">
    <label for="dutyShift">
        <g:message code="staff.dutyShift.label" default="Duty Shift"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="dutyShift" name="dutyShift.id" from="${com.statusboard.DutyShift.listOrderByDescription()}"
              optionKey="id" required="" value="${staffInstance?.dutyShift?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'emsLevel', 'error')} required">
    <label for="emsLevel">
        <g:message code="staff.emsLevel.label" default="Ems Level"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="emsLevel" name="emsLevel.id" from="${com.statusboard.EmsLevel.listOrderByDescription()}"
              optionKey="id" required="" value="${staffInstance?.emsLevel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="staff.enabled.label" default="Enabled"/>

    </label>
    <g:checkBox name="enabled" value="${staffInstance?.enabled}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
        <g:message code="staff.passwordExpired.label" default="Password Expired"/>

    </label>
    <g:checkBox name="passwordExpired" value="${staffInstance?.passwordExpired}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'rank', 'error')} required">
    <label for="rank">
        <g:message code="staff.rank.label" default="Rank"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="rank" name="rank.id" from="${com.statusboard.Rank.listOrderByDescription()}" optionKey="id"
              required="" value="${staffInstance?.rank?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'authorities', 'error')} required">
    <label for="authorities">
        <g:message code="staff.authorities.label" default="Authorities"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="authorities" name="authorities.id" from="${com.statusboard.Role.listOrderByAuthority().authority}"
              optionkey="id" required="" value="${staffInstance?.getAuthorities()?.authority}"/>
</div>
