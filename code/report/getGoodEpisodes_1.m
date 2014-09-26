function goodEpisodes=getGoodEpisodes_1(pid,sid,timestamps,durationThreshold)
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
goodEpisodes=[];
if isempty(timestamps)
    return;
end
goodDiffInd=find(diff(timestamps)/1000/60>durationThreshold);
if isempty(goodDiffInd)
    goodEpisodes=[str2num(pid(2:end)),str2num(sid(2:end)),int64(timestamps(1)),int64(timestamps(end))];
else
    for i=1:length(goodDiffInd)
        if i==1
            goodEpisodes=[goodEpisodes;str2num(pid(2:end)),str2num(sid(2:end)),int64(timestamps(1)),int64(timestamps(goodDiffInd(i)))];
        end
        if i==length(goodDiffInd)
            if length(goodDiffInd)~=1
                goodEpisodes=[goodEpisodes;str2num(pid(2:end)),str2num(sid(2:end)),int64(timestamps(goodDiffInd(i-1)+1)),int64(timestamps(goodDiffInd(i)))];
            end
            goodEpisodes=[goodEpisodes;str2num(pid(2:end)),str2num(sid(2:end)),int64(timestamps(goodDiffInd(i)+1)),int64(timestamps(end))];
        end
        if i~=1 && i~=length(goodDiffInd)
            goodEpisodes=[goodEpisodes;str2num(pid(2:end)),str2num(sid(2:end)),int64(timestamps(goodDiffInd(i-1)+1)),int64(timestamps(goodDiffInd(i)))];
        end
    end
end

%fid1=fopen(['c:\DataProcessingFrameworkV2\data\MEMphis\report\goodEpisodes\goodEpisodes_' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '.csv'],'a');
% fid1=fopen('c:\DataProcessingFrameworkV2\data\MEMphis\report\goodEpisodes\goodEpisodes.csv','a');
% line=[];
% for i=1:size(goodEpisodes,1)
%     line=[num2str(goodEpisodes(i,1)) ',' num2str(goodEpisodes(i,2),'%02d') ',' num2str(goodEpisodes(i,3)) ',' num2str(goodEpisodes(i,4))];
%     fprintf(fid1,'%s',line);
%     fprintf(fid1,'\n');
% end;
% fclose(fid1);
