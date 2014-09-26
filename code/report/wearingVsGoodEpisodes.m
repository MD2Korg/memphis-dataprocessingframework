%calculates loss at the start, intermittant loss, and entire episode lost
function [startTimeDiff entireEpisodeBad timeB2inSuccessiveEpisodes totalGoodDur]=wearingVsGoodEpisodes(wearingTimes,goodEpisodes)
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
    [r c]=size(wearingTimes);
    startTimeDiff=[];
    entireEpisodeBad=[];
    timeB2inSuccessiveEpisodes=[];
    dayTemp=0;
    personTemp=0; %initializing person
    prevEndtime=0;
    negativeDays=[];
    totalGoodDur=0;
    wearingDur=0;
    totalTimeToFix=0;
%     sanity=[];

    for i=1:r
        participant=wearingTimes(i,1);
        day=wearingTimes(i,2);

        %for sanity check
%         wearingDur=(wearingTimes(i,4)-wearingTimes(i,3))/1000/60;

        % find good episodes under this wearingTimes
        ind=find(goodEpisodes(:,1)==participant & goodEpisodes(:,2)==day);
        goodEpisodesOnThatDay=goodEpisodes(ind,:);
        startTime=wearingTimes(i,3)-30*1000;
        endTime=wearingTimes(i,4)+30*1000;
        ind2=find(goodEpisodesOnThatDay(:,3)>=startTime & goodEpisodesOnThatDay(:,4)<=endTime);
        if length(ind2)==0
            entireEpisodeBad=[entireEpisodeBad;[i (wearingTimes(i,4)-wearingTimes(i,3))/1000/60]];
            continue;
        end
        for m=1:length(ind2)
            totalGoodDur=totalGoodDur+(goodEpisodesOnThatDay(ind2(m),4)-goodEpisodesOnThatDay(ind2(m),3))/1000/60;
        end
        stDiff=(goodEpisodesOnThatDay(ind2(1),3)-wearingTimes(i,3))/1000/60;
        if stDiff>=0
            startTimeDiff=[startTimeDiff;[i participant day stDiff]];
         else
             negativeDays=[negativeDays;[i participant day stDiff]];
        end
        if length(ind2)>1
            for g=1:length(ind2)-1
                timeDiff=(goodEpisodesOnThatDay(ind2(g+1),3)- goodEpisodesOnThatDay(ind2(g),4))/1000/60;
%                 totalTimeToFix=totalTimeToFix+timeDiff;
                timeB2inSuccessiveEpisodes=[timeB2inSuccessiveEpisodes;[participant day timeDiff]];
            end
        end
%         difference=abs((stDiff+totalTimeToFix+totalGoodDur)-wearingDur);
%         if difference>0
%             sanity=[sanity;[i participant day difference]];
%         end
%         totalTimeToFix=0;
%         wearingDur=0;
    end
end
