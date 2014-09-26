function unique_files=finduniquefiles(filelist)
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
noFile=size(filelist,2);
if noFile == 0
    unique_files = {};
    return
end

unique_files{1}=filelist{1};
uno=1;
for i=2:noFile
    flag=0;
    [t1, curname, curext] = fileparts(filelist{i});
    for j=1:i-1
        [t1, prevname, prevext] = fileparts(filelist{j});
        if strcmp(prevname,curname)==1 && strcmp(curext,prevext)==1
            flag=1;
            break
        end
    end
    if flag==0
        uno=uno+1;
        unique_files{uno}=filelist{i};
    end
end
unique_files=sort(unique_files);
end
