function [intermittentOffBatteryDown batteryDownAtEnd]=getBatteryDownFromPhoneOnVsChestOnEpisodes(phoneONepisodes,chestONepisodes)
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

    [r c]=size(phoneONepisodes);
%     batteryDownAtStart=[];
%     fullEpisodeBatteryDown=[];
    intermittentOffBatteryDown=[];
%     negativeDays=[];
    batteryDownAtEnd=[];

    for i=1:r
        i
        participant=phoneONepisodes(i,1);
        day=phoneONepisodes(i,2);

        load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\' strcat('p',num2str(participant,'%02d')) '_' strcat('s',num2str(day,'%02d')) '_frmtraw.mat'])

        % find good episodes under this phoneONepisodes
        ind=find(chestONepisodes(:,1)==participant & chestONepisodes(:,2)==day);
        chestEpisodesOnThatDay=chestONepisodes(ind,:);
        startTime=phoneONepisodes(i,3);
        endTime=phoneONepisodes(i,4);
        ind2=find(chestEpisodesOnThatDay(:,3)>=startTime & chestEpisodesOnThatDay(:,4)<=endTime);
        if length(ind2)==0
%             fullEpisodeBatteryDown=[fullEpisodeBatteryDown;[i (phoneONepisodes(i,4)-phoneONepisodes(i,3))/1000/60]];
            continue;
        end

%         stDiff=(chestEpisodesOnThatDay(ind2(1),3)-phoneONepisodes(i,3))/1000/60;
%         if stDiff>=0
%             batteryDownAtStart=[batteryDownAtStart;[i participant day stDiff]];
%          else
%              negativeDays=[negativeDays;[i participant day stDiff]];
%         end
        if length(ind2)>1
            for g=1:length(ind2)-1
                if getBatteryLevel(R,chestEpisodesOnThatDay(ind2(g),4))<=3
                    timeDiff=(chestEpisodesOnThatDay(ind2(g+1),3)- chestEpisodesOnThatDay(ind2(g),4))/1000/60;
                    intermittentOffBatteryDown=[intermittentOffBatteryDown;[participant day timeDiff]];
                end
            end
        end
        %bad at the end
        if getBatteryLevel(R,chestEpisodesOnThatDay(ind2(end),4))<=3
            batteryDownAtEnd=[batteryDownAtEnd;[i participant day (phoneONepisodes(i,4)-chestEpisodesOnThatDay(ind2(end),4))/1000/60]];
        end
    end
end
function batteryLevel=getBatteryLevel(R,levelAtTimestamp)
    batteryLevel=1000;     %big value as default. If the battery is down, the value will be lower
    ind=1:5:length(R.sensor{10}.sample);
    value=(R.sensor{10}.sample(ind)/4096)*3*2;
    timestamp=R.sensor{10}.timestamp(ind);
    ind2=find(timestamp<=levelAtTimestamp);
    if length(ind2)>0
       batteryLevel=value(ind2(end));
       return;
    end
end
