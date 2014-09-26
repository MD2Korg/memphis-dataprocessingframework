function [nBatteryDown nSensorOff batteryDownDur]=getBatteryDownReport(pid,sid)
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
participant=str2num(pid(2:end));day=str2num(sid(2:end));
nBatteryDown=0; nSensorOff=0;
batteryDownDur=[];
% phoneONepisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_phone.csv');
chestSensorONepisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_chest.csv');
ind=find(chestSensorONepisodes(:,1)==participant & chestSensorONepisodes(:,2)==day);
sensorONofTheDay=chestSensorONepisodes(ind,:);

[r c]=size(sensorONofTheDay);
load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\' strcat('p',num2str(participant,'%02d')) '_' strcat('s',num2str(day,'%02d')) '_frmtraw.mat'])
ind=1:5:length(R.sensor{10}.sample);
value=(R.sensor{10}.sample(ind)/4096)*3*2;

timestamp=R.sensor{10}.timestamp(ind);

nSensorOff=r-1;  %number of intermittent gap between two successive good episodes

for i=1:r-1
    endd=sensorONofTheDay(i,4);
    ind2=find(timestamp<=endd);
    if length(ind2)>0
        if value(ind2(end))<=3    %cut off for operation is 3 volt
            nBatteryDown=nBatteryDown+1;
            batteryDownDur=[batteryDownDur;participant day endd (sensorONofTheDay(i+1,3)-sensorONofTheDay(i,4))/1000/60];
        end
    end
end
end
