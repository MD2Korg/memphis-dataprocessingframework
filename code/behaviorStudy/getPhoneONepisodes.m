%get phone ON episodes
function [phoneOnEpisodes]=getPhoneONepisodes(pid1,sid1,D)
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

phoneDiffInd=find(diff(D.sensor{11}.timestamp)/1000/60>10); %'phone on' ensures data from phone accelerometer
phoneOnEpisodes=[];
% getPhoneONepisodes;

if isempty(phoneDiffInd)
    phoneOnEpisodes=[pid,sid,D.sensor{11}.timestamp(1),D.sensor{11}.timestamp(end)];
else
    for i=1:length(phoneDiffInd)
        if i==1
            phoneOnEpisodes=[phoneOnEpisodes;pid,sid,D.sensor{11}.timestamp(10),D.sensor{11}.timestamp(phoneDiffInd(i))];
        end
        if i==length(phoneDiffInd)
            phoneOnEpisodes=[phoneOnEpisodes;pid,sid,D.sensor{11}.timestamp(phoneDiffInd(i)+1),D.sensor{11}.timestamp(end)];
        end
        if i~=1 && i~=length(phoneDiffInd)
            phoneOnEpisodes=[phoneOnEpisodes;pid,sid,D.sensor{11}.timestamp(phoneDiffInd(i-1)+1),D.sensor{11}.timestamp(phoneDiffInd(i))];
        end
    end
end

% fid1=fopen(['c:\DataProcessingFrameworkV2\data\MEMphis\report\phoneONepisodes_' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '.csv'],'a');
% line=[];
% for i=1:size(phoneOnEpisodes,1)
% line=[num2str(phoneOnEpisodes(i,1)) ',' num2str(phoneOnEpisodes(i,2),'%02d') ',' num2str(phoneOnEpisodes(i,3)) ',' num2str(phoneOnEpisodes(i,4))];
% fprintf(fid1,'%s',line);
% fprintf(fid1,'\n');
% end;
% fclose(fid1);
end
