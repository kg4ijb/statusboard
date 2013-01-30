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



<div class="control-group fieldcontain ${hasErrors(bean: rankInstance, field: 'rank', 'error')} required">
    <label class="control-label" for="rank">
        <g:message code="rank.rank.label" default="Rank"/>
        <span style="color: red;" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="rank" required="" value="${rankInstance?.rank}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: rankInstance, field: 'description', 'error')} required">
    <label class="control-label" for="description">
        <g:message code="rank.description.label" default="Description"/>
        <span style="color: red;" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="description" required="" value="${rankInstance?.description}"/>
    </div>
</div>

