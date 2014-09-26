function [disconnCount duration]=getDisconnCountPerEpisodes(pid,sid)
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
load(['E:\dataProcessingFramework\data\memphis\formattedraw\' pid '_' sid '_frmtraw.mat']);
n=length(R.METADATA.tosFileTime);
participant=str2num(pid(2:end));
day=str2num(sid(2:end));
% wearingTimes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes_wearing.csv');

disconnCount=0;
duration=0;

ind=find(wearingTimes(:,1)==participant & wearingTimes(:,2)==day);
wearingOnThatDay=wearingTimes(ind,:);
[r c]=size(wearingOnThatDay);

for i=1:r

end
end
