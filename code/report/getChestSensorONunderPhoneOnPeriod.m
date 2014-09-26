function [chestOnEpisodes]=getChestSensorONunderPhoneOnPeriod(pid,sid,R)
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
chestOnEpisodes=[];
if length(R.sensor{1}.timestamp)==0
    return;
end
phoneEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_phoneFromActivePeriod.csv');
ind=find(phoneEpisodes(:,1)==participant);
phoneEpisodesOfTheSubject=phoneEpisodes(ind,:);
chestTimestamps=[];
for i=1:size(phoneEpisodesOfTheSubject,1)
    ind2=find(R.sensor{1}.timestamp>=phoneEpisodesOfTheSubject(i,3) & R.sensor{1}.timestamp<=phoneEpisodesOfTheSubject(i,4));
    chestTimestamps=[chestTimestamps R.sensor{1}.timestamp(ind2)];
end
chestOnEpisodes=getEpisodes(participant,day,chestTimestamps,10);
end
