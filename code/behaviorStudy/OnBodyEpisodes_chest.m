function [wearingEpisodes]=getWearingByMergingGoodEpisodes(pid,sid,D)
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
    ecgGoodEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_ecg.csv');
    ripGoodEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_rip.csv');
    ripInd=find(ripGoodEpisodes(:,1)==str2num(pid(2:end)) & ripGoodEpisodes(:,2)==str2num(sid(2:end)));
    ecgInd=find(ecgGoodEpisodes(:,1)==str2num(pid(2:end)) & ecgGoodEpisodes(:,2)==str2num(sid(2:end)));
    wearingEpisodes=[];
    allTimestamps=[];
    for i=1:length(ripInd)
        indrT=find(D.sensor{1}.timestamp>=ripGoodEpisodes(ripInd(i),3) & D.sensor{1}.timestamp<=ripGoodEpisodes(ripInd(i),4));
        allTimestamps=[allTimestamps D.sensor{1}.timestamp(indrT)];
    end
    for i=1:length(ecgInd)
        indeT=find(D.sensor{2}.timestamp>=ecgGoodEpisodes(ecgInd(i),3) & D.sensor{2}.timestamp<=ecgGoodEpisodes(ecgInd(i),4));
        allTimestamps=[allTimestamps D.sensor{2}.timestamp(indeT)];
    end
    allTimestamps=unique(allTimestamps);
    allTimestamps=sort(allTimestamps);
    wearingEpisodes=getGoodEpisodes(pid,sid,allTimestamps,10);  %each wearing epsidoes are assumed to be apart by 10 minutes
end
