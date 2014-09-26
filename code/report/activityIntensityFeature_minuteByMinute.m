%find out the activity episodes from accelerometer based on the threshold
function activityIntensityFeature_minuteByMinute(G,pid,sid)
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

% participant=15;
% day=1;
% load(['c:\dataProcessingFrameworkV2\data\memphis\feature\field_' strcat('p',num2str(participant,'%02d')) '_' strcat('s',num2str(day,'%02d')) '_act10_feature.mat'])
% load(['c:\dataProcessingFrameworkV2\data\memphis\feature\field_' pid '_' sid '_act10_feature.mat'])
if ~exist(['c:\dataProcessingFramework\data\nida\feature\field_' pid '_' sid '_act10_feature.mat'],'file')
    return;
end
load(['c:\dataProcessingFramework\data\nida\feature\field_' pid '_' sid '_act10_feature.mat']);
% load(['c:\dataProcessingFramework\data\nida\feature\field_' pid '_' sid '_drug60_feature.mat'])

featureVal=[];
featureTs=[];
for i=1:length(F.window)
    if isfield(F.window(i).feature{4},'value')
        featureVal=[featureVal F.window(i).feature{4}.value{30}];
        featureTs=[featureTs F.window(i).starttimestamp];
    end;
end

%write to a file
fid=fopen('C:\DataProcessingFramework\data\nida\report\NIDA\activityIntensityFeature.csv','a');
WINDOW_LEN=60*1000;
for i=F.starttimestamp:WINDOW_LEN:F.endtimestamp-1
    value=-9999;
    ind=find(i<=featureTs & featureTs<i+WINDOW_LEN);
    if ~isempty(ind)
        value=median(featureVal(ind));
    end
    dateTime=convert_timestamp_time(G, i);
    [n day]=weekday(dateTime);

    line=[pid ',' day ',' num2str(i) ',' dateTime(1:10) ',' dateTime(12:end) ',' num2str(value)];
    fprintf(fid,'%s',line);
    fprintf(fid,'\n');
end;
fclose(fid);
