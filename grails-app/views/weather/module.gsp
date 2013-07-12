<%@ page import="groovy.xml.XmlUtil" %>
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

${data}
%{--
<div>
    <span class="jumbo">Weather in ${data['display_location']['city']}</span>
    <div>
        ${data['temperature_string']}, Feels Like: ${data['feelslike_f']}<br>
        Current Conditions ${data['weather']} <br>
        Wind ${data['wind_string']} <br>
        ${data['precip_1hr_string']} ${data['precip_today_string']}
    </div>

</div>
--}%
