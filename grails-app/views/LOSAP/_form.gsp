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



<%@ page import="com.statusboard.LOSAP" %>

<div class="control-group fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'staff', 'error')} required">
    <label class="control-label" for="staff">
        <g:message code="LOSAP.staff.label" default="Staff"/>
        <span style="color: red;" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="staff" name="staff.id" from="${com.statusboard.Staff.list()}" optionKey="id" required=""
                  value="${LOSAPInstance?.staff?.id}" class="many-to-one"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'onDuty', 'error')} required">
    <label class="control-label" for="onDuty">
        <g:message code="LOSAP.onDuty.label" default="On Duty"/>
        <span style="color: red;" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <joda:dateTimePicker name="onDuty" value="${LOSAPInstance?.onDuty}"></joda:dateTimePicker>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: LOSAPInstance, field: 'offDuty', 'error')} ">
    <label class="control-label" for="offDuty">
        <g:message code="LOSAP.offDuty.label" default="Off Duty"/>

    </label>

    <div class="controls">
        <joda:dateTimePicker name="offDuty" value="${LOSAPInstance?.offDuty}" default="none"
                             noSelection="['': '']"></joda:dateTimePicker>
    </div>
</div>

