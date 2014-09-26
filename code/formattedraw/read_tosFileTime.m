function tosFileTime=read_tosFileTime(G,indir,starttimestamp,endtimestamp)
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
tosFileTime=[];
filelist=findfiles(indir,G.FILE.TOS_NAME);
filelist=finduniquefiles(filelist); % Same file can be multiple times. Only take unique ones
noFile=size(filelist,2);
fileTime=[];
for i=1:noFile
    fileTime=[fileTime;str2num(filelist{i}(end-12:end))];
end
ind=find(fileTime>=starttimestamp & fileTime<=endtimestamp);
if length(ind)>0
    tosFileTime=fileTime(ind);
end
end
