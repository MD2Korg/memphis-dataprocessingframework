function episodes=getEpisodesFromTimestamps(timestamps,durationThreshold)
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
episodes=[];
if isempty(timestamps)
    return;
end
goodDiffInd=find(diff(timestamps)/1000/60>durationThreshold);
if isempty(goodDiffInd)
    episodes=[timestamps(1),timestamps(end)];
else
    for i=1:length(goodDiffInd)
        if i==1
            episodes=[episodes;[timestamps(1),timestamps(goodDiffInd(i))]];
        end
        if i==length(goodDiffInd)
            if length(goodDiffInd)~=1
                episodes=[episodes;[timestamps(goodDiffInd(i-1)+1),timestamps(goodDiffInd(i))]];
            end
            episodes=[episodes;[timestamps(goodDiffInd(i)+1),timestamps(end)]];
        end
        if i~=1 && i~=length(goodDiffInd)
            episodes=[episodes;[timestamps(goodDiffInd(i-1)+1),timestamps(goodDiffInd(i))]];
        end
    end
end
