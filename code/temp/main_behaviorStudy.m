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
%% Data Processing Framework
% Overview: starting point of the framework.
clear all
%% Basic Configureation files
%
G=config();
G=config_run_behaviorStudy(G);
% G=config_run_conversation(G);

PS_LIST=G.PS_LIST;

% phoneOnEpisodes=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_phoneFromActivePeriod.csv');
% sensorOnEpisodes=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_chestOnUnderPhoneON.csv');
% wearing=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_wearing_all_active_period.csv');
% ecgEpisodes=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_ecg_all_active.csv');

pno=size(PS_LIST);
for p=1:pno
    pid=char(PS_LIST{p,1})
    slist=PS_LIST{p,2};

    for s=slist
        sid=char(s)
        %        figure;plot_frmtraw(G,pid,sid,'formattedraw',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_AMBID]);
        %        plot_selfreport(G,pid,sid,'formattedraw',[1,2]);
        %        plot_labstudymark(G,pid,sid,'formattedraw');
        %        disp('abc');
%         main_rawinfo(G,pid,'raw');
              	main_formattedraw(G,pid,sid,'raw','formattedraw');
        %         main_formatteddata(G,pid,sid,'formattedraw','formatteddata');
        %        figure;plot_frmtdata(G,pid,sid,'formatteddata',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]);

        %         main_basicfeature(G,pid,sid,'formatteddata','basicfeature');
        %           main_window(G,pid,sid,'basicfeature','window',G.MODEL.ACT10);
        %         main_feature(G,pid,sid,'window','feature',G.MODEL.ACT10);
        %         disp('hi');
        %            feature2test_main(G,pid,sid,'feature','activitymodel',G.MODEL.ACT10);
        %           runWekaOnFieldData(pid,sid);
        %             [pid1 sid1 flag]=checkWindowFileCorruption(pid,sid);
        %             windowCheck=[windowCheck;pid1 sid1 flag];
        %             [pid1 sid1 nx ny nz]=checkWindowFileCorruption(pid,sid);
        %             windowCheck=[windowCheck;pid1 sid1 nx ny nz];

        %{
		main_basicfeature(G,pid,sid,'formatteddata','basicfeature');
%        figure;plot_basicfeature(G,pid,sid,'basicfeature',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]);

        main_window(G,pid,sid,'basicfeature','window');
        main_feature(G,pid,sid,'window','feature');

        list_feature=[G.FEATURE.R_ECG.VRVL,G.FEATURE.R_ECG.LFHF,...
                G.FEATURE.R_ECG.HRP1,G.FEATURE.R_ECG.HRP2,...
                G.FEATURE.R_ECG.HRP3,G.FEATURE.R_ECG.RRMN,...
                G.FEATURE.R_ECG.RRMD,G.FEATURE.R_ECG.RRQD,...
                G.FEATURE.R_ECG.RR80,G.FEATURE.R_ECG.RR20,...
                G.FEATURE.R_ECG.RRCT];
        report_feature(G,pid,sid,'feature','report',G.FEATURE.R_ECGID,list_feature);
%        main_model(G,pid,sid,'feature','model');
        %}
     end;
end;
% writeEpisodes(wearingEpisodes,'wearing');
% writeEpisodes(goodRipEpisodesWD,'rip_WD');
% writeEpisodes(goodRipEpisodesWE,'rip_WE');
% writeEpisodes(goodEcgEpisodesWD,'ecg_WD');
% writeEpisodes(goodEcgEpisodesWE,'ecg_WE');
disp('done');
