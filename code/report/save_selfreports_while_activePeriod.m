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
%it saves selfreport timestamps while they are active in the the protocol.
%Input of insideActivePeriod matrix is calculated by
%smoking_selfreport_status.m script

fid=fopen('C:\DataProcessingFramework\data\nida\report\selfreports\smokingReportWhileActivePeriod.csv','w');
ind=find(insideActivePeriod(:,end)==1);
for i=1:length(ind)
    line=[num2str(insideActivePeriod(i,1)) ',' num2str(insideActivePeriod(i,2)) ',' num2str(num2str(insideActivePeriod(i,3)))];
    fprintf(fid,'%s\n',line);
end
fclose(fid);
