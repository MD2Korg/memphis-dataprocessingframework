function writeEpisodes(episodes,sensor)
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
fid1=fopen(['c:\DataProcessingFrameworkV2\data\MEMphis\report\goodEpisodes\episodes_' sensor '.csv'],'a');
line=[];
for i=1:size(episodes,1)
    line=[num2str(episodes(i,1)) ',' num2str(episodes(i,2),'%02d') ',' num2str(episodes(i,3)) ',' num2str(episodes(i,4))];
    fprintf(fid1,'%s',line);
    fprintf(fid1,'\n');
end;
fclose(fid1);
