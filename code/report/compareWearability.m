function [startTimeDiff timeB2inSuccessiveEpisodes]=compareWearability(wearingTimes,goodEpisodes)
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
    [r c]=size(goodEpisodes);
    startTimeDiff=[];
    timeB2inSuccessiveEpisodes=[];
    dayTemp=0;
    personTemp=0; %initializing person
    prevEndtime=0;
    for i=1:r
        participant=goodEpisodes(i,1);
        day=goodEpisodes(i,2);
        %if the participant and day is same
        wearing=find(wearingTimes(:,1)== participant & wearingTimes(:,2)==day);
        %find which wearing episode contains the current good episodes
        for w=1:length(wearing)
            if goodEpisodes(i,3)>=wearingTimes(wearing(w),3) & goodEpisodes(i,4)<=wearingTimes(wearing(w),4)
                break;
            end
        end
        if w==length(wearing)
            if ~(wearingTimes(wearing(w),3)<=goodEpisodes(i,3) & wearingTimes(wearing(w),4)>=goodEpisodes(i,4))
                %disp(['error: ' num2str(i) ': ' num2str(participant) ': ' num2str(day)])
                continue;
            end
        end
       if participant==personTemp
            if day==dayTemp
                timeDiff=(goodEpisodes(i,3)- prevEndtime)/1000/60;
                timeB2inSuccessiveEpisodes=[timeB2inSuccessiveEpisodes;[participant day timeDiff]];
                prevEndtime=goodEpisodes(i,4);
            else
                timeDiff=(goodEpisodes(i,3)-wearingTimes(wearing(w),3))/1000/60;
                startTimeDiff=[startTimeDiff;[participant day timeDiff]];
                prevEndtime=0;
                dayTemp=day;
            end
        else
            timeDiff=(goodEpisodes(i,3)-wearingTimes(wearing(w),3))/1000/60;
            startTimeDiff=[startTimeDiff;[participant day timeDiff]];
            prevEndtime=goodEpisodes(i,4);
            dayTemp=day;
            personTemp=participant;
       end
    end
end
