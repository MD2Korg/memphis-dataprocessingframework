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

for p=1:1  %Participant ID
    for d=1:1  %Day
        for s=1:4  % Sensor
            startTime=['04/09/2014 02:58:25'; '04/09/2014 15:13:49'];
            startMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,startTime)));
            endTime=['04/09/2014 08:32:36';'04/09/2014 16:03:38'];
            endMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,endTime)));
            privacy_study.pid{p}.day{d}.device{s}.carrying.startTime=startTime;
            privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime=startMatlabTime;
            privacy_study.pid{p}.day{d}.device{s}.carrying.endTime=endTime;
            privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime=endMatlabTime;

            Sharing_startTime=['04/09/2014 02:58:25'; '04/09/2014 15:43:49'];
            Sharing_startMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,Sharing_startTime)));
            Sharing_endTime=['04/09/2014 07:32:36';'04/09/2014 16:03:38'];
            Sharing_endMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,Sharing_endTime)));
            privacy_study.pid{p}.day{d}.device{s}.sharing.startTime=Sharing_startTime;
            privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime=Sharing_startMatlabTime;
            privacy_study.pid{p}.day{d}.device{s}.sharing.endTime=Sharing_endTime;
            privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime=Sharing_endMatlabTime;
        end
    end
end
save('C:\DataProcessingFramework\data\visualization.mat','privacy_study');
