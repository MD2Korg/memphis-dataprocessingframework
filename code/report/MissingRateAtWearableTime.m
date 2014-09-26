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

t=find(R.sensor(SENSOR.R_RIPID).timestamp);
time=R.sensor(SENSOR.R_RIPID).timestamp(t);

diffT=diff(time);

indMissing=find(diffT>=5000);

missingMinutes=0;
avilableMinutes=0;
%calculate how many minutes are missing
%how many missing samples coinside with not wearing the sensor
%discard those missing minutes from the total count

%at first count how many minutes are missing

for i=indMissing
    missing=(time(i+1)-time(i))/60000;
    if missing<30
        missingMinutes=missingMinutes+missing;
        for j=1:length(R.dataquality_mark)
            goodStr=char(R.dataquality_mark.good(j));
            kg=strfind(goodStr,'=');
            if R.dataquality_mark(j)>=time(i) && R.dataquality_mark(j)<=time(i+1) && str2double(goodStr(kg+1:end))==0 %if band off is inside the missing minute, we discard that missing
                missingMinutes=missingMinutes-1;
            end
        end
    end
end;
