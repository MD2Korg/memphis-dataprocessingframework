function [phoneOFFepisodes]=getPhoneOFFepisodes(pid,sid,ativieEpisodes,phonONepisodes)
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
phoneOFFepisodes=[];
participant=str2num(pid(2:end));day=str2num(sid(2:end));
ind=find(ativieEpisodes(:,1)==participant & ativieEpisodes(:,2)==day);
activePeriodOfTheDay=ativieEpisodes(ind,:);

ind1=find(phonONepisodes(:,1)==participant & phonONepisodes(:,2)==day);
phoneONepisodesOfTheDay=phonONepisodes(ind1,:);
[r c]=size(activePeriodOfTheDay);
if r<1
        return;
end

[r1 c1]=size(phoneONepisodesOfTheDay);
for j=1:r
    %find phone off episodes under active episodes
    ind=find(phoneONepisodesOfTheDay(:,3)>=activePeriodOfTheDay(j,3) & phoneONepisodesOfTheDay(:,4)<=activePeriodOfTheDay(j,4));
    for i=1:length(ind)
        if i==1
            phoneOFFepisodes=[participant day activePeriodOfTheDay(j,3) phoneONepisodesOfTheDay(ind(i),3)];
        end

        if length(ind)>1 && i>1
            phoneOFFepisodes=[phoneOFFepisodes; participant day phoneONepisodesOfTheDay(ind(i-1),4) phoneONepisodesOfTheDay(ind(i),3)];
        end

        if i==length(ind)
            phoneOFFepisodes=[phoneOFFepisodes; participant day phoneONepisodesOfTheDay(ind(i),4) activePeriodOfTheDay(j,4)];
            break;
        end
    end
end



end
