%calculated duration between two wearing episodes except sleeping
function [participant day WearingDuration NotWearingDuration]=getNotWearingDuration(G,pid,sid)
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
participant=str2num(pid(2:end));
day=str2num(sid(2:end));
wearingTimes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_wearing.csv');
load(['c:\dataProcessingFrameworkV2\data\memphis\formatteddata\' pid '_' sid '_frmtdata.mat']);
WearingDuration=0;
NotWearingDuration=0; %not wearing between first and last wearing


wearing=find(wearingTimes(:,1)== participant & wearingTimes(:,2)==day);
if length(wearing)>0
    for i=1:length(wearing)
         WearingDuration=WearingDuration+(wearingTimes(wearing(i),4)-wearingTimes(wearing(i),3))/1000/60;
    end
%     NotWearingDuration=(wearingTimes(wearing(end),4)-wearingTimes(wearing(1),3))/1000/60-WearingDuration;
end

%take the first difference of good data.
%sort the first difference in discending order
%if the highest one is before the 5 am, it means it is at night
%discard that difference
% timeDiff=diff(D.sensor{1}.timestamp/1000/60);
% sortedDiff=sort(timeDiff,'descend');
% ind=find(timeDiff==sortedDiff(1));
% discardDiff=0;
% if isSleeping(G,D.sensor{1}.timestamp(ind))==1
%     discardDiff=sortedDiff(1);
% end
if length(wearing)>1
    for g=1:length(wearing)-1
        if isSleeping(G,wearingTimes(wearing(g),3))==1
            continue;
        end
        timeDiff=(wearingTimes(wearing(g+1),3)- wearingTimes(wearing(g),4))/1000/60;
        NotWearingDuration=NotWearingDuration+timeDiff;
%         timeB2inSuccessiveEpisodes=[timeB2inSuccessiveEpisodes;[participant day timeDiff]];
    end
end
% NotWearingDuration=NotWearingDuration-discardDiff;
end
function [isSleep]=isSleeping(G,timestamp)
    isSleep=0;
    time=convert_timestamp_time(G,timestamp);
    if str2num(time(12:13))<5
        isSleep=1;
        return;
    end
end
