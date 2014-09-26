% function [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent(pid,sid,sensor,timestamp,offset)
function [badData goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_v2(participant,day,goodEpisodes,activityEpisodes,timestamp,offset)
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

%returns duration of good data, duration of activity, and how much data is
%usable for stress investigation.
%we check the data before the self-report. Offset is in minute. for
%example: offset = 5 means, we check selfreport to selfreport-5*60*1000
goodData=0;
activity=0;
usableForStress=0;
badData=0;
% load(['c:\dataProcessingFrameworkV2\data\memphis\formatteddata\' pid '_' sid '_frmtdata.mat']);

% goodEpisodes=[];
% activityEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\activityEpisodes\activityEpisodes_matrix.csv');
% activityEpisodes=load('c:\dataProcessingFramework\data\nida\report\ActivityEpisodes\activityEpisodes_v2.csv');

% if strcmpi(sensor,'rip')
%     goodEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_rip_all_active.csv');
%     goodEpisodes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_rip_minusDropout.csv');
% end
% if strcmpi(sensor,'ecg')
%     goodEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_ecg_all_active.csv');
%       goodEpisodes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_ecg_minusDropout.csv');
% end
% participant=str2num(pid(2:end));
% day=str2num(sid(2:end));
ind=find(goodEpisodes(:,1)==participant & goodEpisodes(:,2)==day);
goodDataOfTheDay=goodEpisodes(ind,:);

ind1=find(activityEpisodes(:,1)==participant & activityEpisodes(:,2)==day & activityEpisodes(:,5)==1);
activityOfTheDay=activityEpisodes(ind1,:);

endtime=timestamp-(offset-1)*60*1000;
starttime=timestamp-offset*60*1000;

if offset==6
    %compute best 2 out of 3 window
    usableData=[];
    for i=[1,2,3]
        [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_voting(goodDataOfTheDay,activityOfTheDay, timestamp,i);
        usableData=[usableData;goodData activity usableForStress];
    end
    usableData=sortrows(usableData,3);
    goodData=sum(usableData(2:end,1))/120;
    activity=sum(usableData(2:end,2))/120;
    usableForStress=sum(usableData(2:end,3))/120;
    badData=1-goodData;
    return
end
if offset==7
    %compute best 3 out of 5 window (each window = 60 seconds)
    usableData=[];
    for i=[1,2,3,4,5]
        [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_voting(goodDataOfTheDay,activityOfTheDay, timestamp,i);
        usableData=[usableData;goodData activity usableForStress];
    end
    usableData=sortrows(usableData,3);
    goodData=sum(usableData(3:end,1))/180;
    activity=sum(usableData(3:end,2))/180;
    usableForStress=sum(usableData(3:end,3))/180;
    badData=1-goodData;
    return
end
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
