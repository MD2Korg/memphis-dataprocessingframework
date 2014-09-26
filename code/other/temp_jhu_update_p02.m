function temp_jhu_update_p02()
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
files=dir('C:\DataProcessingFramework\data\JHU\formatteddata\p02*');
for i=1:length(files)
    load(['C:\DataProcessingFramework\data\JHU\formatteddata\' files(i).name]);
    newsid=sprintf('s%02d',i)
    oldsid=D.METADATA.SID

    D.METADATA.SID=newsid;
    D.NAME=strrep(D.NAME,oldsid,newsid);
    newfilename=strrep(files(i).name,oldsid,newsid);
    save(['C:\DataProcessingFramework\data\JHU\formatteddata\' newfilename],'D');
    delete(['C:\DataProcessingFramework\data\JHU\formatteddata\' files(i).name]);
end
end
