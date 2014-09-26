% function [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent(pid,sid,sensor,timestamp,offset)
function [badData intermittentBad improperAttachment badQuAtStart goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_v4(participant,day,intermittantLooseEpisodes,goodEpisodes,activityEpisodes,activeInProtocol,timestamp,offset,badAtEnd,badAtStart,fullBad)
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
%usable for stress investigation, how much is lost due to activity, and how
%much data is bad due to intermittent loosening
%we check the data before the self-report. Offset is in minute. for
%example: offset = 5 means, we check selfreport to selfreport-5*60*1000
goodData=0;
activity=0;
usableForStress=0;
badData=0;
intermittentBad=0;
improperAttachment=0;
badQuAtStart=0;
fullBadQ=0;

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

endtime=timestamp-(offset-1)*60*1000;
starttime=timestamp-offset*60*1000;
inside=isInsideActivePeriod(starttime,endtime,activeInProtocol);
%if the minute goes outside of the active period, then should not be
%considered for the calculation, thus return -1
if inside==0
    goodData=-1;
    activity=-1;
    usableForStress=-1;
    badData=-1;
    intermittentBad=-1;
    return;
end

ind=find(goodEpisodes(:,1)==participant & goodEpisodes(:,2)==day);
goodDataOfTheDay=goodEpisodes(ind,:);

ind1=find(activityEpisodes(:,1)==participant & activityEpisodes(:,2)==day & activityEpisodes(:,5)==1);
activityOfTheDay=activityEpisodes(ind1,:);

ind2=find(intermittantLooseEpisodes(:,1)==participant & intermittantLooseEpisodes(:,2)==day);
intermittentOfTheDay=intermittantLooseEpisodes(ind2,:);

ind3=find(badAtEnd(:,1)==participant & badAtEnd(:,2)==day);
badAtEndOfTheDay=badAtEnd(ind3,:);

ind4=find(badAtStart(:,1)==participant & badAtStart(:,2)==day);
badAtStartOfTheDay=badAtStart(ind4,:);

ind5=find(fullBad(:,1)==participant & fullBad(:,2)==day);
fullBadOfTheDay=fullBad(ind5,:);

if day==-1
    ind=find(goodEpisodes(:,1)==participant);
    goodDataOfTheDay=goodEpisodes(ind,:);
    ind1=find(activityEpisodes(:,1)==participant & activityEpisodes(:,5)==1);
    activityOfTheDay=activityEpisodes(ind1,:);
    ind2=find(intermittantLooseEpisodes(:,1)==participant);
    intermittentOfTheDay=intermittantLooseEpisodes(ind2,:);
    ind3=find(badAtEnd(:,1)==participant);
    badAtEndOfTheDay=badAtEnd(ind3,:);
    ind4=find(badAtStart(:,1)==participant);
    badAtStartOfTheDay=badAtStart(ind4,:);
    ind5=find(fullBad(:,1)==participant);
    fullBadOfTheDay=fullBad(ind5,:);
end

if offset==11
    %compute best 2 out of 3 window
    usableData=[];
    for i=[1,2,3]
%         [goodData activity usableForStress intermittent]=getUsableStressDataBeforeTheEvent_voting(intermittentOfTheDay,goodDataOfTheDay,activityOfTheDay, timestamp,i);
          [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_voting(goodDataOfTheDay,activityOfTheDay, timestamp,i);
          usableData=[usableData;goodData activity usableForStress];
    end
    usableData=sortrows(usableData,3);
    goodData=sum(usableData(2:end,1))/120;
    activity=sum(usableData(2:end,2))/120;
    usableForStress=sum(usableData(2:end,3))/120;
%     intermittentBad=sum(usableData(2:end,4))/120;
    badData=1-goodData;
    return
end
if offset==12
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
%     intermittentBad=sum(usableData(3:end,4))/180;
    badData=1-goodData;
    return
end
%calculate activity duration
activity=getActivityDuration(activityOfTheDay,starttime,endtime);
%calculate good duration
goodData=getGoodDuration(goodDataOfTheDay,starttime,endtime);

intermittentBad=getIntermittentBad(intermittentOfTheDay,starttime,endtime);
badQuAtStart=badQualityAtStart(badAtStartOfTheDay,starttime,endtime);
badQuatEnd=badQualityAtEnd(badAtEndOfTheDay,starttime,endtime);
fullBadQ=fullEpisodeQuBad(fullBadOfTheDay,starttime,endtime);

if  activity<goodData
    usableForStress=goodData-activity;
end
usableForStress=usableForStress/60; %converting to percentage
goodData=goodData/60;
activity=activity/60;
badData=1-goodData;                 %everything is now in percentage
intermittentBad=(intermittentBad+badQuatEnd)/60;
improperAttachment=fullBadQ/60;
badQuAtStart=badQuAtStart/60;
end

function activity=getActivityDuration(activityOfTheDay,starttime,endtime)
    activity=0;
    activity=getDurOfOverlapWithEpisodesAndWindow(activityOfTheDay,starttime,endtime);
%     if activity==-1
%         activity=0;
%     end
end

function intermittent=getIntermittentBad(intermittentOfTheDay,starttime,endtime)
    intermittent=0;
    intermittent=getDurOfOverlapWithEpisodesAndWindow(intermittentOfTheDay,starttime,endtime);
end

function badQ=badQualityAtStart(badAtStartOfTheDay,starttime,endtime)
    badQ=0;
    badQ=getDurOfOverlapWithEpisodesAndWindow(badAtStartOfTheDay,starttime,endtime);
end

function badQ=badQualityAtEnd(badAtEndOfTheDay,starttime,endtime)
    badQ=0;
    badQ=getDurOfOverlapWithEpisodesAndWindow(badAtEndOfTheDay,starttime,endtime);
end

function badQ=fullEpisodeQuBad(fullBadOfTheDay,starttime,endtime)
    badQ=0;
    badQ=getDurOfOverlapWithEpisodesAndWindow(fullBadOfTheDay,starttime,endtime);
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
% function [goodData activity usableForStress intermittent]=getUsableStressDataBeforeTheEvent_voting(intermittentOfTheDay,goodEpisodes,activityEpisode, timestamp,offset)
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
function inside=isInsideActivePeriod(starttime,endtime,activeInProtocol)
    inside=0;
%     dur=getDurOfOverlapWithEpisodesAndWindow(activeInProtocol,starttime,endtime);

%     if dur>=60
%         inside=1;
%     end
    ind=find(activeInProtocol(:,3)<=starttime & endtime<=activeInProtocol(:,4));
    if length(ind)>0
        inside=1;
    end
end
