function str=convert_timestamp_time(G,curtime)
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

dnOffset = datenum('01-Jan-1970');
tstamp=curtime/1000.0;
timezone=G.TIME.TIMEZONE;
dnNow = tstamp/(24*60*60) + dnOffset +timezone/24.0;
str=datestr(dnNow,G.TIME.FORMAT);
len=length(curtime);
for i=1:len
		if G.TIME.DAYLIGHTSAVING==1
			if is_Daylight_Savings(str(i,:))==1
				timezone=G.TIME.TIMEZONE+1;
				dnNow(i) = tstamp(i)/(24*60*60) + dnOffset +timezone/24.0;
				str(i,:)=datestr(dnNow(i),G.TIME.FORMAT);
			end
		end

end
end
