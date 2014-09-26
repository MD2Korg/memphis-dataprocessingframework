function [minuteWiseBad minuteWiseGood minuteWiseActivity minuteWiseUsableStress]=overallMinuteByMinuteStressData(phoneOnEpisodes,goodEpisodes,activityEpisodes)
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

[r c]=size(phoneOnEpisodes);
  minuteWiseUsableStress=[];
    minuteWiseGood=[];
    minuteWiseActivity=[];
    minuteWiseBad=[];
for i=1:r
    participant=phoneOnEpisodes(i,1);
    day=phoneOnEpisodes(i,2);

    ind=find(activityEpisodes(:,1)==participant & activityEpisodes(:,2)==day & activityEpisodes(:,5)==1);
    activityOfTheDay=activityEpisodes(ind,:);

    ind2=find(goodEpisodes(:,1)==participant & goodEpisodes(:,2)==day);
    goodDataOfTheDay=goodEpisodes(ind2,:);


    for t=phoneOnEpisodes(i,3):60000:phoneOnEpisodes(i,4)-1
        starttime=t;
        endtime=t+60000;

        goodData=0;
        activity=0;
        usableForStress=0;
        badData=0;

        %calculate activity duration
        activity=getActivityDuration(activityOfTheDay,starttime,endtime);
        %calculate good duration
        goodData=getGoodDuration(goodDataOfTheDay,starttime,endtime);

        if  activity<goodData
            usableForStress=goodData-activity;
        end
        usableForStress=usableForStress/60; %converting to percentage
        goodData=goodData/60;
        activity=activity/60;
        badData=1-goodData;                 %everything is now in percentage

        minuteWiseUsableStress=[minuteWiseUsableStress; participant day usableForStress];
        minuteWiseGood=[minuteWiseGood; participant day goodData];
        minuteWiseActivity=[minuteWiseActivity; participant day activity];
        minuteWiseBad=[minuteWiseBad; participant day badData];
    end
end
end

function activity=getActivityDuration(activityOfTheDay,starttime,endtime)
    activity=0;
    activity=getDurOfOverlapWithEpisodesAndWindow(activityOfTheDay,starttime,endtime);
%     if activity==-1
%         activity=0;
%     end
end

function goodData=getGoodDuration(goodDataOfTheDay,starttime,endtime)
    goodData=getDurOfOverlapWithEpisodesAndWindow(goodDataOfTheDay,starttime,endtime);
end
function dur=getDurOfOverlapWithEpisodesAndWindow(episodes,starttime,endtime)
%return the total duration from episodes that overlaps with
%the time window [starttime endtime]

    dur=0;
    %case 1: the whole duration (endtime-starttime) is under a good episode
    ind2=find(episodes(:,3)<=starttime & episodes(:,4)>=endtime);
    if ~isempty(ind2)
        dur=(endtime-starttime)/1000;                              %duration in seconds
        return;
    end

    %case 2: good episodes between start and end time
    ind2=find(episodes(:,3)>=starttime & episodes(:,4)<=endtime);
    if ~isempty(ind2)
        dur=dur+sum(episodes(ind2,4)-episodes(ind2,3))/1000;
    end

    %case 3: start time is inside a good episode
    ind2=find(episodes(:,3)<=starttime & episodes(:,4)>=starttime);
    if ~isempty(ind2)
        dur=dur+sum(episodes(ind2,4)-starttime)/1000;
    end

    %case 4: end time is inside a good episode
    ind2=find(episodes(:,3)<=endtime & episodes(:,4)>=endtime);
    if ~isempty(ind2)
        dur=dur+sum(endtime-episodes(ind2,3))/1000;
    end
end
function [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_voting(goodEpisodes,activityEpisode, timestamp,offset)
    goodData=0;
    activity=0;
    usableForStress=0;
    endtime=timestamp-(offset-1)*60*1000;
    starttime=timestamp-offset*60*1000;
    %calculate activity duration
    activity=getActivityDuration(activityEpisode,starttime,endtime);
    %calculate good duration
    goodData=getGoodDuration(goodEpisodes,starttime,endtime);

    if  activity<goodData
        usableForStress=goodData-activity;
    end
end
