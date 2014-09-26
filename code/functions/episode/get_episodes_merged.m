function [ episodes_merged ] = get_episodes_merged( xValues, yValues, xDiffAcceptable )
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
    episodes = get_episodes( yValues );
    [rowCount, colCount] = size(episodes);
    j=1;
    episodes_merged = [];
    for i=1:rowCount
        if i==1
            episodes_merged(j,1) = episodes(i,1);
            episodes_merged(j,2) = episodes(i,2);
            j=j+1;
            continue;
        end
        if (xValues(episodes(i,1)) - xValues(episodes_merged(j-1,2))) <= xDiffAcceptable
            episodes_merged(j-1,2) = episodes(i,2);
        else
            episodes_merged(j,1) = episodes(i,1);
            episodes_merged(j,2) = episodes(i,2);
            j=j+1;
        end
    end
end
