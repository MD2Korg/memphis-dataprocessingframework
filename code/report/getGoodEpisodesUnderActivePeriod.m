function episodes=getGoodEpisodesUnderActivePeriod(pid,sid,timestamps,activeSensorONepisodes,durationThreshold)
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
episodes=[];
if length(timestamps)==0
    return;
end
participant=str2num(pid(2:end));day=str2num(sid(2:end));
ind=find(activeSensorONepisodes(:,1)==participant);
sensorONepisodesOfTheParticipant=activeSensorONepisodes(ind,:);
timestamps_active=[];
for i=1:size(sensorONepisodesOfTheParticipant,1)
    ind2=find(timestamps>=sensorONepisodesOfTheParticipant(i,3) & timestamps<=sensorONepisodesOfTheParticipant(i,4));
    timestamps_active=[timestamps_active timestamps(ind2)];
end
episodes=getEpisodes(participant,day,timestamps_active,durationThreshold);
end
