function v= visualization_Privacy_Study(G);
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

% for p=1:1  %Participant ID
%     for d=1:1  %Day
%         for s=1:4  % Sensor
%              startTime=['04/09/2014 02:58:25'; '04/09/2014 15:13:49'];
%              startMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,startTime)));
%              endTime=['04/09/2014 08:32:36';'04/09/2014 16:03:38'];
%              endMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,endTime)));
% privacy_study.pid{p}.day{d}.device{s}.carrying.startTime=startTime;
% privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime=startMatlabTime;
% privacy_study.pid{p}.day{d}.device{s}.carrying.endTime=endTime;
% privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime=endMatlabTime;
%
%              Sharing_startTime=['04/09/2014 02:58:25'; '04/09/2014 15:43:49'];
%              Sharing_startMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,Sharing_startTime)));
%              Sharing_endTime=['04/09/2014 07:32:36';'04/09/2014 16:03:38'];
%              Sharing_endMatlabTime=convert_timestamp_matlabtimestamp(G,(convert_time_timestamp(G,Sharing_endTime)));
% privacy_study.pid{p}.day{d}.device{s}.sharing.startTime=Sharing_startTime;
% privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime=Sharing_startMatlabTime;
% privacy_study.pid{p}.day{d}.device{s}.sharing.endTime=Sharing_endTime;
% privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime=Sharing_endMatlabTime;
%         end
%     end
% end
% % save('C:\DataProcessingFramework\data\visualization.mat','privacy_study');
load('C:\DataProcessingFramework\data\visualization.mat');

figure;hold on;
%% 1st Stage: Phone Carrying and Sharing
s=1;
for i=1:length(privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime)
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime(i)],[1000 1000],'b-',6);
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime(i)],[900 900],'r-',6);
end
annotation('textbox',...
    [0.008 0.793 0.110 0.073],'String',{'Carrying Phone'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
annotation('textbox',...
    [0.008 0.701 0.110 0.073],'String',{'Sharing Phone'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
%% 2nd Stage: Physiologycal signal
s=2;
for i=1:length(privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime)
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime(i)],[800 800],'k-',6);
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime(i)],[700 700],'m-',6);
end
annotation('textbox',...
    [0.008 0.616 0.110 0.073],'String',{'Phsiology'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
annotation('textbox',...
    [0.008 0.531 0.110 0.073],'String',{'Sharing Physiology'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
%% 3rd Stage: Activity
s=3;
for i=1:length(privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime)
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime(i)],[600 600],'g-',6);
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime(i)],[500 500],'c-',6);
end
annotation('textbox',...
    [0.008 0.422 0.110 0.073],'String',{'Activity'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
annotation('textbox',...
    [0.008 0.329 0.110 0.073],'String',{'Sharing Activity'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
%% 4th Stage: Audio device Carrying and Sharing
s=4;
for i=1:length(privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime)
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.carrying.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.carrying.endMatlabTime(i)],[400 400],'b-',6);
    plot_signal([privacy_study.pid{p}.day{d}.device{s}.sharing.startMatlabTime(i) privacy_study.pid{p}.day{d}.device{s}.sharing.endMatlabTime(i)],[300 300],'y-',6);
end
annotation('textbox',...
    [0.008 0.24 0.110 0.073],'String',{'Audio'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
annotation('textbox',...
    [0.008 0.148 0.110 0.073],'String',{'Sharing Audio'},'FontSize',14,'FontName','Arial','EdgeColor',[1 1 1],'Color',[0.84 0.16 0]);
%% Set figure property
ylim([200 1100]);
set(gca,'YTickLabel',[]);
box on;
set(gca,'xgrid','on');
set(gcf,'color','white');
end
