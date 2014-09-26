function timestamp=convert_time_timestamp(G,time_str)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Copyright 2014 University of Memphis
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%%
timezone=G.TIME.TIMEZONE;
if G.TIME.DAYLIGHTSAVING==1
    if is_Daylight_Savings(time_str)==1
        timezone=timezone+1;
    end
end
unixstart = datenum([1970,1,1,0,0,0]);
matlabtime = datenum(time_str, G.TIME.FORMAT);
timestamp=(matlabtime-unixstart)*24*60*60*1000;
timestamp=timestamp-timezone*60*60*1000;
end
