function [ripMissingRate ecgMissingRate]=getMissingRateFromFormattedRaw(pid,sid)
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
    load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\' pid '_' sid '_frmtraw.mat'])
    ripMissingRate=-1;ecgMissingRate=-1;
    ripSamples=0;ripDuration=0;   %duration in seconds
    ecgSamples=0;ecgDuration=0;
    ripTimestamps=R.sensor{1}.timestamp;
    episodes=getEpisodes(str2num(pid(2:end)),str2num(sid(2:end)),ripTimestamps,1);
    if ~isempty(episodes)
        [r c]=size(episodes);
        for i=1:r
            ind=find(ripTimestamps>=episodes(i,3) & ripTimestamps<=episodes(i,4));
            ripSamples=ripSamples+length(ind);
            ripDuration=ripDuration+(episodes(i,4)-episodes(i,3))/1000;
        end
    end
    ecgTimestamps=R.sensor{2}.timestamp;
    episodes=getEpisodes(str2num(pid(2:end)),str2num(sid(2:end)),ecgTimestamps,1);
    if ~isempty(episodes)
        [r c]=size(episodes);
        for i=1:r
            ind=find(ecgTimestamps>=episodes(i,3) & ecgTimestamps<=episodes(i,4));
            ecgSamples=ecgSamples+length(ind);
            ecgDuration=ecgDuration+(episodes(i,4)-episodes(i,3))/1000;
        end
    end
    expectedEcgSamples=ecgDuration*64;
    expectedRipSamples=ripDuration*21.33;
    ripMissingRate=100*(expectedRipSamples-ripSamples)/expectedRipSamples;
    ecgMissingRate=100*(expectedEcgSamples-ecgSamples)/expectedEcgSamples;
end
