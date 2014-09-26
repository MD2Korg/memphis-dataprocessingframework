function [OFFepisodes]=get_hierarchical_OFFepisodes(pid,sid,higherHierarchicalEpisodes,lowerHierarchicalEpisodes)
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

%one example use of the function: it gives the episodes of phone off under active period, if we set
%higherHierarchicalEpisodes=episodes_activePeriod and
%lowerHierarchicalEpisodes=episodes_phoneONunderActivePeriod

OFFepisodes=[];
participant=str2num(pid(2:end));day=str2num(sid(2:end));
ind=find(higherHierarchicalEpisodes(:,1)==participant & higherHierarchicalEpisodes(:,2)==day);
higher_day=higherHierarchicalEpisodes(ind,:);

ind1=find(lowerHierarchicalEpisodes(:,1)==participant & lowerHierarchicalEpisodes(:,2)==day);
lower_day=lowerHierarchicalEpisodes(ind1,:);
[r c]=size(higher_day);
if r<1
    return;
end

[r1 c1]=size(lower_day);
for j=1:r
    %find phone off episodes under active episodes
    ind=find(lower_day(:,3)>=higher_day(j,3) & lower_day(:,4)<=higher_day(j,4));
    for i=1:length(ind)
        if i==1
            OFFepisodes=[participant day higher_day(j,3) lower_day(ind(i),3)];
        end

        if length(ind)>1 && i>1
            OFFepisodes=[OFFepisodes; participant day lower_day(ind(i-1),4) lower_day(ind(i),3)];
        end

        if i==length(ind)
            OFFepisodes=[OFFepisodes; participant day lower_day(ind(i),4) higher_day(j,4)];
            break;
        end
    end
end
end
