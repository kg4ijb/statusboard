<%@ page import="com.statusboard.Staff" %>



<div class="control-group  fieldcontain ${hasErrors(bean: staffInstance, field: 'username', 'error')} required">
    <label class="control-label" for="username">
        <g:message code="staff.username.label" default="Username"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:textField name="username" required="" value="${staffInstance?.username}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'password', 'error')} required">
    <label class="control-label" for="password">
        <g:message code="staff.password.label" default="Password"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:passwordField name="password" required="" value="${staffInstance?.password}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'lastName', 'error')} required">
    <label class="control-label" for="lastName">
        <g:message code="staff.lastName.label" default="Last Name"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:textField name="lastName" required="" value="${staffInstance?.lastName}"/>
    </div>
</div>

<div class="control-group  fieldcontain ${hasErrors(bean: staffInstance, field: 'firstName', 'error')} required">
    <label class="control-label" for="firstName">
        <g:message code="staff.firstName.label" default="First Name"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:textField name="firstName" required="" value="${staffInstance?.firstName}"/>
    </div>

</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'fdid', 'error')} required">
    <label class="control-label" for="fdid">
        <g:message code="staff.fdid.label" default="FDID"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:textField name="fdid" maxlength="4" required="" value="${staffInstance?.fdid}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'email', 'error')} required">
    <label class="control-label" for="email">
        <g:message code="staff.email.label" default="email"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:textField name="email" maxlength="64" required="" value="${staffInstance?.email}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'isCarDriver', 'error')} ">
    <label class="control-label" for="isCarDriver">
        <g:message code="staff.isCarDriver.label" default="Is Car Driver"/>
    </label>

    <div class="controls">
        <g:checkBox name="isCarDriver" value="${staffInstance?.isCarDriver}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'isEngineDriver', 'error')} ">
    <label class="control-label" for="isEngineDriver">
        <g:message code="staff.isEngineDriver.label" default="Is Engine Driver"/>
    </label>

    <div class="controls">
        <g:checkBox name="isEngineDriver" value="${staffInstance?.isEngineDriver}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'isTruckDriver', 'error')} ">
    <label class="control-label" for="isTruckDriver">
        <g:message code="staff.isTruckDriver.label" default="Is Truck Driver"/>

    </label>

    <div class="controls">
        <g:checkBox name="isTruckDriver" value="${staffInstance?.isTruckDriver}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'accountExpired', 'error')} ">
    <label class="control-label" for="accountExpired">
        <g:message code="staff.accountExpired.label" default="Account Expired"/>

    </label>

    <div class="controls">
        <g:checkBox name="accountExpired" value="${staffInstance?.accountExpired}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'accountLocked', 'error')} ">
    <label class="control-label" for="accountLocked">
        <g:message code="staff.accountLocked.label" default="Account Locked"/>

    </label>

    <div class="controls">
        <g:checkBox name="accountLocked" value="${staffInstance?.accountLocked}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'dutyShift', 'error')} required">
    <label class="control-label" for="dutyShift">
        <g:message code="staff.dutyShift.label" default="Duty Shift"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="dutyShift" name="dutyShift.id" from="${com.statusboard.DutyShift.listOrderByDescription()}"
                  optionKey="id" required="" value="${staffInstance?.dutyShift?.id}" class="many-to-one"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'emsLevel', 'error')} required">
    <label class="control-label" for="emsLevel">
        <g:message code="staff.emsLevel.label" default="EMS Level"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:select id="emsLevel" name="emsLevel.id" from="${com.statusboard.EmsLevel.listOrderByDescription()}"
                  optionKey="id" required="" value="${staffInstance?.emsLevel?.id}" class="many-to-one"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'enabled', 'error')} ">
    <label class="control-label" for="enabled">
        <g:message code="staff.enabled.label" default="Enabled"/>

    </label>

    <div class="controls">
        <g:checkBox name="enabled" value="${staffInstance?.enabled}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'passwordExpired', 'error')} ">
    <label class="control-label" for="passwordExpired">
        <g:message code="staff.passwordExpired.label" default="Password Expired"/>

    </label>

    <div class="controls">
        <g:checkBox name="passwordExpired" value="${staffInstance?.passwordExpired}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'rank', 'error')} required">
    <label class="control-label" for="rank">
        <g:message code="staff.rank.label" default="Rank"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:select id="rank" name="rank.id" from="${com.statusboard.Rank.listOrderByDescription()}" optionKey="id"
                  required="" value="${staffInstance?.rank?.id}" class="many-to-one"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: staffInstance, field: 'authorities', 'error')} required">
    <label class="control-label" for="authorities">
        <g:message code="staff.authorities.label" default="Authorities"/>
        <span style="color: #8b0000">*</span>
    </label>

    <div class="controls">
        <g:select id="authorities" name="authorities.id" from="${com.statusboard.Role.listOrderByAuthority().authority}"
                  optionkey="id" required="" value="${staffInstance?.getAuthorities()?.authority}"/>
    </div>
</div>
