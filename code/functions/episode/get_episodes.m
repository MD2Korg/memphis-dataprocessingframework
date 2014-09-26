function [ episodes ] = get_episodes( values )
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

    episodes = zeros(0,2);
    episodeIndex = 1;
    startIndex=-1;
    for i=1:numel(values)
        if values(i)==1
            if startIndex == -1
                startIndex = i;
            end
            if i == numel(values)
                episodes(episodeIndex,:) = [startIndex, i];
                episodeIndex = episodeIndex+1;
                startIndex = -1;
            end
        else
            if startIndex ~= -1
                if values(i)==0 || i==numel(values)
                    episodes(episodeIndex,:) = [startIndex, i-1];
                    episodeIndex = episodeIndex+1;
                    startIndex = -1;
                end
            end
        end
    end

end
