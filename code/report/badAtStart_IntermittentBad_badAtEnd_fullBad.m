%calculates loss at the start and end, intermittant loss, and entire episode lost
%find how much is for the wireless loss, how much is for the degradation
function [badAtStart fullEpisodeBad intermittantBad badAtEnd totalGoodDur]=badAtStart_IntermittentBad_badAtEnd_fullBad(wearingTimes,goodEpisodes,sensor)
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
    if sensor==1
        disp('RIP');
    end
    if sensor==2
        disp('ECG');
    end

    [r c]=size(wearingTimes);
    badAtStart=[];
    fullEpisodeBad=[];
    intermittantBad=[];
    negativeDays=[];
    badAtEnd=[];
    totalGoodDur=0;

    for i=1:r
        i
        participant=wearingTimes(i,1);
        day=wearingTimes(i,2);

%         load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\' strcat('p',num2str(participant,'%02d')) '_' strcat('s',num2str(day,'%02d')) '_frmtraw.mat'])

        % find good episodes under this wearingTimes
        ind=find(goodEpisodes(:,1)==participant & goodEpisodes(:,2)==day);
        goodEpisodesOnThatDay=goodEpisodes(ind,:);
        startTime=wearingTimes(i,3)-30*1000;
        endTime=wearingTimes(i,4)+30*1000;
        ind2=find(goodEpisodesOnThatDay(:,3)>=startTime & goodEpisodesOnThatDay(:,4)<=endTime);
        if length(ind2)==0
            fullEpisodeBad=[fullEpisodeBad;[participant day wearingTimes(i,3) wearingTimes(i,4)]];
            continue;
        end
        stDiff=(goodEpisodesOnThatDay(ind2(1),3)-wearingTimes(i,3))/1000/60;
        if stDiff>=0
            badAtStart=[badAtStart;[participant day wearingTimes(i,3) goodEpisodesOnThatDay(ind2(1),3)]];
        end
        if length(ind2)>1
            for g=1:length(ind2)-1
                intermittantBad=[intermittantBad;[participant day goodEpisodesOnThatDay(ind2(g),4) goodEpisodesOnThatDay(ind2(g+1),3)]];
            end
        end
        %bad at the end
        badAtEnd=[badAtEnd;[participant day goodEpisodesOnThatDay(ind2(end),4) wearingTimes(i,4)]];
    end
end

% Input: epsodes_wearing = wearingTimes
% 		episodes_ecg=ecgGoodEpisodes
%
% 		columns of each matrix are described below
% 		badAtStart : index of the wearing episode, participant#, day#, total loss at the beginning, loss at the beginning due to wireless loss
% 		fullEpisodeBad : index of the wearing episode, total full episode bad duration, out of bad data how much is for wireless loss
% 		intermittantBad : participant#, day#, total intermittant bad, out of total how much is for the wireless loss
% 		badAtEnd : index of the wearing episode, participant#, day#, total loss at the end, loss at the end due to wireless loss
% 		totalGoodDur: total duration from the ecg good episodes
