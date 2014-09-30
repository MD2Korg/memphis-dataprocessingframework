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
G=config_run_memphis(G);

PS_LIST=G.PS_LIST;

% load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\phoneONepisode.mat');
% phoneOnDaily=[];
%report_selfreport_all(G,'formattedraw','report',PS_LIST,G.SELFREPORT.SMKID);
%report_formattedraw_short(G,'formattedraw','report',PS_LIST);
%return;



% goodEcgEpisodesWD=[];
% goodEcgEpisodesWE=[];
% goodRipEpisodesWE=[];
% goodRipEpisodesWD=[];
% timeOfDayRipWE=[];
% timeOfDayRipWD=[];
%
% timeOfDayEcgWE=[];
% timeOfDayEcgWD=[];
%
% wearingEpisodes=[];
%
% wearingNotWearing=[];
%
% wearingHome=[];
% ecgAtHome=[];
% ripAtHome=[];
%
% wearingWork=[];
% ecgAtWork=[];
% ripAtWork=[];
%
% wearingResta=[];
% ecgAtResta=[];
% ripAtResta=[];
%
% wearingStore=[];
% ecgAtStore=[];
% ripAtStore=[];
%
% wearingOther=[];
% ecgAtOther=[];
% ripAtOther=[];
%
% wearingNotWearingAtSelfReport=[];
%
% missingRate=[];
%
% activityBeforeBadRipEpisode=[];
% activityBeforeBadEcgEpisode=[];
%
% nonContiguousActivityRip=[];
% nonContiguousActivityEcg=[];
%
% contiguousActivityRip=[];
% contiguousActivityEcg=[];
%
% badEpisodeDurationRip=[];
% badEpisodeDurationEcg=[];
%
% connDisconnMatrix=load('c:\dataProcessingFrameworkV2\data\memphis\report\disconnConnTimestampsAll.mat');
% wirelessDisconDaily=[];
% disconnPhysicalSeparationCount=[];

% ripEpisodes=[];
% ecgEpisodes=[];
% wearingEpisodes=[];
%
% activeEpisodes_all=[];
%
% activePeriodEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_activePeriod_all.csv');
% phoneEpisodes=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_phoneFromActivePeriod.csv');
% phoneEpisodesFromActivePeriod=[];

%
% windowCheck=[];

% jerk_duration_rip=[];
% jerk_duration_ecg=[];

% [badEpisodesRip badEpisodesEcg]=getBadEpisodes_fromWearingAndGoodEpisodes();

% phoneEpisodes=[];
% pidsid=[];
% chestONepisodes=[];
% phoneONoffDuration=[];
% batteryDownReport=[];
% batteryDownCounts=[];

% packetLossEcg=[];
% packetLossRip=[];

% wearingEpisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_wearing_all.csv');
% activeSensorONepisodes=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_chestOnUnderPhoneON.csv');
% chestOnEpisode=load('C:\DataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_chestOnUnderPhoneON.csv');
% phoneOnDaily=[];
% chestOnDaily=[];

% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\packetLossEcg.mat');
% packetLossEcgDaily=[];

% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\jerk_duration_ecg.mat');
% jerkEcgDaily=[];

% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\badAtEndEcg.mat');
% badAtEndEcgDaily=[];
% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\intermittantBadEcg.mat');
% intermittantBadEcgDaily=[];

% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\badAtStartEcg.mat');
% badAtStartEcgDaily=[];
% load('c:\dataProcessingFrameworkV2\data\memphis\report\statisticalTest\fullEpisodeBadEcg.mat');
% fullEpisodeBadEcgDaily=[];

% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\badAtEndEcgDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\intermittantBadEcgDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\packetLossEcgDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\wirelessDisconDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\jerkEcgDaily.mat');
% lossDueToTechnology=[];
%
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\sensorTurnedOffDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\badAtStartEcgDaily.mat');
% load('C:\DataProcessingFrameworkV2\data\memphis\report\StatisticalTest\fullEpisodeBadEcgDaily.mat');
% lossDueToAdherence=[];
%
% ecgGood=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_ecg_all_active.csv');
% ripGood=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\episodes_rip_all_active.csv');
%
% ecgGoodDaily=[];
% ripGoodDaily=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%% For UbiComp 2014 processing %%%%%%%%%%%%%%%%%%
% phoneOffDur=[];
% phoneTime=[];

% phoneOFFepisodes=[];

stressStatusB4SmkReport=[];
% stressStatusB4DrnkReport5=[];
% stressStatusB4DrnkReport10=[];
% stressStatusB4DrnkReport60=[];
% stressStatusB4DrnkReport=[];

pno=size(PS_LIST);
for p=1:pno
    pid=char(PS_LIST{p,1})
%               pid='p12'
    slist=PS_LIST{p,2};

%     phoneTime=[];

    for s=slist
        sid=char(s)
%         sid='s05';
%         phoneOFFepisodes=[phoneOFFepisodes; getPhoneOFFepisodes(pid,sid,activePeriodEpisodes,phoneEpisodes)];
%                           sid='s08'
        %        figure;plot_frmtraw(G,pid,sid,'formattedraw',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_AMBID]);
        %        plot_selfreport(G,pid,sid,'formattedraw',[1,2]);
        %        plot_labstudymark(G,pid,sid,'formattedraw');
        %        disp('abc');
        %main_rawinfo(G,pid,'raw');
        %       	main_formattedraw(G,pid,sid,'raw','formattedraw');
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
        %         getWearingEpisodes(pid,sid);
        %         indir=[G.DIR.DATA G.DIR.SEP 'formatteddata'];
        %         infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
        %         load([indir G.DIR.SEP infile]);
        % %         load(['c:\dataProcessingFrameworkV2\data\memphis\formatteddata\p' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '_frmtdata.mat']);
        %         [N,S]=weekday(convert_timestamp_matlabtimestamp(G,D.sensor{1}.timestamp(1)));
        %         if N==1 || N==7
        %             ripWEepisodes=getGoodEpisodes(pid,sid,D.sensor{1}.timestamp,1);
        %             timeOfDayRipWE=[timeOfDayRipWE;getTimeOfDayWiseDuration(G,double(ripWEepisodes(:,3)),double(ripWEepisodes(:,4)))];
        %             goodRipEpisodesWE=[goodRipEpisodesWE;ripWEepisodes];
        %
        %             ecgWEepisodes=getGoodEpisodes(pid,sid,D.sensor{2}.timestamp,1);
        %             timeOfDayEcgWE=[timeOfDayEcgWE;getTimeOfDayWiseDuration(G,double(ecgWEepisodes(:,3)),double(ecgWEepisodes(:,4)))];
        %             goodEcgEpisodesWE=[goodEcgEpisodesWE;ecgWEepisodes];
        %         else
        %             ecgWDepisodes=getGoodEpisodes(pid,sid,D.sensor{2}.timestamp,1);
        %             timeOfDayEcgWD=[timeOfDayEcgWD;getTimeOfDayWiseDuration(G,double(ecgWDepisodes(:,3)),double(ecgWDepisodes(:,4)))];
        %             goodEcgEpisodesWD=[goodEcgEpisodesWD;ecgWDepisodes];
        %
        %             ripWDepisodes=getGoodEpisodes(pid,sid,D.sensor{1}.timestamp,1);
        %             timeOfDayRipWD=[timeOfDayRipWD;getTimeOfDayWiseDuration(G,double(ripWDepisodes(:,3)),double(ripWDepisodes(:,4)))];
        %             goodRipEpisodesWD=[goodRipEpisodesWD;ripWDepisodes];
        %         end
        %           ripEpisodes=[ripEpisodes;getGoodEpisodesUnderActivePeriod(pid,sid,D.sensor{1}.timestamp,activeSensorONepisodes,1)];
        %             ecgEpisodes=[ecgEpisodes;getGoodEpisodesUnderActivePeriod(pid,sid,D.sensor{2}.timestamp,activeSensorONepisodes,1)];
        %         wearingEpisodes=[wearingEpisodes;getWearingByMergingGoodEpisodes(pid,sid,D)];
        %           activityFeatureMerge(pid,sid);
        %           [participant day Wearing NotWearing]=getNotWearingDuration(G,pid,sid);
        %           wearingDuration=wearingDuration+Wearing;
        %           notWearingDuration=notWearingDuration+NotWearing;
        %           wearingNotWearing=[wearingNotWearing;[participant day Wearing NotWearing]];

        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtLocation(pid,sid,'home');
        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtHome(pid,sid);
        %             wearingHome=[wearingHome;wearingEpisodes];
        %             ecgAtHome=[ecgAtHome;ecgEpisodes];
        %             ripAtHome=[ripAtHome;ripEpisodes];

        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtLocation(pid,sid,'work');
        %             wearingWork=[wearingWork;wearingEpisodes];
        %             ecgAtWork=[ecgAtWork;ecgEpisodes];
        %             ripAtWork=[ripAtWork;ripEpisodes];

        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtLocation(pid,sid,'restaurant');
        %             wearingResta=[wearingResta;wearingEpisodes];
        %             ecgAtResta=[ecgAtResta;ecgEpisodes];
        %             ripAtResta=[ripAtResta;ripEpisodes];
        %
        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtLocation(pid,sid,'store');
        %             wearingStore=[wearingStore;wearingEpisodes];
        %             ecgAtStore=[ecgAtStore;ecgEpisodes];
        %             ripAtStore=[ripAtStore;ripEpisodes];
        %
        %             [wearingEpisodes ecgEpisodes ripEpisodes]=wearingAtLocation(pid,sid,'other');
        %             wearingOther=[wearingOther;wearingEpisodes];
        %             ecgAtOther=[ecgAtOther;ecgEpisodes];
        %             ripAtOther=[ripAtOther;ripEpisodes];

        %              wearingAtSelfReport=wearingNotWearingGoodBadAtSelfReports(pid,sid);
        %              wearingNotWearingAtSelfReport=[wearingNotWearingAtSelfReport;[str2num(pid(2:end)) str2num(sid(2:end)) wearingAtSelfReport]];
        %               [ripMissingRate ecgMissingRate]=getMissingRateFromFormattedRaw(pid,sid);
        %               [ripMissingRate ecgMissingRate]=getMissingRateFromFormatteddata2(pid,sid)
        %               missingRate=[missingRate; str2num(pid(2:end)) str2num(sid(2:end)) ripMissingRate ecgMissingRate];

        %activity
        %                 indir=[G.DIR.DATA G.DIR.SEP 'formatteddata'];
        %                 infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
        %                 load([indir G.DIR.SEP infile]);
        %                 load(['c:\dataProcessingFrameworkV2\data\memphis\formatteddata\p' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '_frmtdata.mat']);
        %                 [nonContigRip contigRip badRipEpisodeDur nonContigEcg contigEcg badEcgEpisodeDur]=getActivityBeforeBadEpisodes_v2(pid,sid);

        %                 activityBeforeBadEpisode.participant(str2num(pid(2:end))).day(str2num(sid(2:end))).sensor(1).nonContiguous=nonContigRip;
        %                 activityBeforeBadEpisode.participant(str2num(pid(2:end))).day(str2num(sid(2:end))).sensor(1).contiguous=contigRip;
        %                 activityBeforeBadEpisode.participant(str2num(pid(2:end))).day(str2num(sid(2:end))).sensor(2).nonContiguous=nonContigEcg;
        %                 activityBeforeBadEpisode.participant(str2num(pid(2:end))).day(str2num(sid(2:end))).sensor(2).contiguous=contigEcg;
        %                 nonContiguousActivityRip=[nonContiguousActivityRip nonContigRip.duration];
        %                 nonContiguousActivityEcg=[nonContiguousActivityEcg nonContigEcg.duration];
        %                 contiguousActivityRip=[contiguousActivityRip contigRip.duration];
        %                 contiguousActivityEcg=[contiguousActivityEcg contigEcg.duration];
        %                 badEpisodeDurationRip=[badEpisodeDurationRip badRipEpisodeDur.duration];
        %                 badEpisodeDurationEcg=[badEpisodeDurationEcg badEcgEpisodeDur.duration];

        %                         [phys_sepa_count totalDisconnCount phys_sepa_duration]=disconnDueToPhysicalSeparationOfPhone_body(pid,sid,connDisconnMatrix.connDisconnAll);
        %                         disconnPhysicalSeparationCount=[disconnPhysicalSeparationCount;str2num(pid(2:end)) str2num(sid(2:end)) phys_sepa_count totalDisconnCount phys_sepa_duration];
        %
        %calculate effect of jerks due to activity
        %                         [jerks_rip jerks_ecg]=getJerksDueToPhysicalMovement(pid,sid);
        %                         jerk_duration_rip=[jerk_duration_rip;jerks_rip];
        %                         jerk_duration_ecg=[jerk_duration_ecg;jerks_ecg];

        %'phone on' episodes
        %                 if isfield(D.sensor{11},'timestamp')
        %                     episodes=getEpisodes(str2num(pid(2:end)),str2num(sid(2:end)),D.sensor{11}.timestamp,1);
        %                     phoneEpisodes=[phoneEpisodes;episodes];
        %                 else
        %                     pidsid=[pidsid;str2num(pid(2:end)) str2num(sid(2:end))];  %track which person days do not have the field timestamp
        %                 end

        %phone on duration
        %                 indir=[G.DIR.DATA G.DIR.SEP 'formattedraw'];
        %                 infile=[pid '_' sid '_' G.FILE.FRMTRAW_MATNAME];
        %                 load([indir G.DIR.SEP infile]);

        %                 [phoneONepisodes]=getPhoneONepisodesByMergingPhoneAndChestSensorData(pid,sid,R,activePeriodEpisodes);
        %                 phoneEpisodesFromActivePeriod=[phoneEpisodesFromActivePeriod; phoneONepisodes];
        %                 'chest sensor on' episodes
        %                 indir=[G.DIR.DATA G.DIR.SEP 'formattedraw'];
        %                 infile=[pid '_' sid '_' G.FILE.FRMTRAW_MATNAME];
        %                 load([indir G.DIR.SEP infile]);
        %                 if isfield(R.sensor{1},'timestamp')
        % %                     episodes=getEpisodes(str2num(pid(2:end)),str2num(sid(2:end)),R.sensor{1}.timestamp,1);
        %                     [episodes]=getChestSensorONunderPhoneOnPeriod(pid,sid,R);
        %                     chestONepisodes=[chestONepisodes;episodes];
        %                 else
        %                     pidsid=[pidsid;str2num(pid(2:end)) str2num(sid(2:end))];  %track which person days do not have the field timestamp
        %                 end

        %get phone on , and phone off duration
        %                 [participant day phoneOnDuration phoneOffDuration]=getPhoneOffDuration(G,pid,sid);
        %                 phoneONoffDuration=[phoneONoffDuration;participant day phoneOnDuration phoneOffDuration];
        %                   [phoneONepisodes]=getPhoneONepisodesByMergingPhoneAndChestSensorData(pid,sid,R);
        %                   phoneEpisodes=[phoneEpisodes;phoneONepisodes];

        %                         [nBatteryDown nSensorOff batteryDownDur]=getBatteryDownReport(pid,sid);
        %                         batteryDownReport=[batteryDownReport; batteryDownDur];
        %                         batteryDownCounts=[batteryDownCounts;str2num(pid(2:end)) str2num(sid(2:end)) nBatteryDown nSensorOff];

        %                           [burstPacketLossDur_rip burstPacketLossDur_ecg]=getIntermittentPacketLossBetweenTwoGoodEpisodes(pid,sid);
        %                           packetLossEcg=[packetLossEcg;burstPacketLossDur_ecg];
        %                           packetLossRip=[packetLossRip;burstPacketLossDur_rip];

        %                    get active and inactive episodes
        %                    [activeEpisodes]=getActiveInactiveEpisodesFromWearing(G,pid,sid,wearingEpisodes);
        %                    [activeEpisodes]=getActiveInactiveEpisodesFromWearing_v2(pid,sid,wearingEpisodes);
        %                    activeEpisodes_all=[activeEpisodes_all;activeEpisodes];

        %calculate variance for daily phone on duration
        subject=str2num(pid(2:end));day=str2num(sid(2:end));
%         ind=find(phoneEpisodes(:,1)==subject & phoneEpisodes(:,2)==day);
%         if ~isempty(ind)
%             phoneOnDaily=[phoneOnDaily;subject day sum((phoneEpisodes(ind,4)-phoneEpisodes(ind,3)))/1000/60/60];
%         end
%
%         ind=find(chestOnEpisode(:,1)==subject & chestOnEpisode(:,2)==day);
%         if ~isempty(ind)
%             chestOnDaily=[chestOnDaily;subject day sum((chestOnEpisode(ind,4)-chestOnEpisode(ind,3)))/1000/60/60];
%         end


        %calculate ecg packet loss per day per user
        %         ind=find(packetLossEcg(:,1)==subject & packetLossEcg(:,2)==day);
        %         if ~isempty(ind)
        %             packetLossEcgDaily=[packetLossEcgDaily; subject day sum(packetLossEcg(ind,4))/60/60];
        %         end

        %         ind=find(jerk_duration_ecg(:,1)==subject & jerk_duration_ecg(:,2)==day);
        %         if ~isempty(ind)
        %             jerkEcgDaily=[jerkEcgDaily; subject day sum(jerk_duration_ecg(ind,4))/60/60];
        %         end

        %                 ind=find(connDisconnMatrix.connDisconnAll(:,1)==subject & connDisconnMatrix.connDisconnAll(:,2)==day);
        %                 if ~isempty(ind)
        %                     wirelessDisconDaily=[wirelessDisconDaily;subject day sum((connDisconnMatrix.connDisconnAll(ind,4)-connDisconnMatrix.connDisconnAll(ind,3)))/1000/60/60];
        %                 end
%                 ind=find(badAtEndEcg(:,2)==subject & badAtEndEcg(:,3)==day);
%                 if ~isempty(ind)
%                     badAtEndEcgDaily=[badAtEndEcgDaily;subject day sum(badAtEndEcg(ind,4))/60];
%                 end
        %         ind=find(intermittantBadEcg(:,1)==subject & intermittantBadEcg(:,2)==day);
        %         if ~isempty(ind)
        %             intermittantBadEcgDaily=[intermittantBadEcgDaily;subject day sum(intermittantBadEcg(ind,3))/60];
        %         end

%                 ind=find(badAtStartEcg(:,2)==subject & badAtStartEcg(:,3)==day);
%                 if ~isempty(ind)
%                     badAtStartEcgDaily=[badAtStartEcgDaily;subject day sum(badAtStartEcg(ind,4))/60];
%                 end
%                 ind=find(fullEpisodeBadEcg(:,2)==subject & fullEpisodeBadEcg(:,3)==day);
%                 if ~isempty(ind)
%                     fullEpisodeBadEcgDaily=[fullEpisodeBadEcgDaily;subject day sum(fullEpisodeBadEcg(ind,4))/60];
%                 end

        %combine loss due to technological factors and adherence factors
%         technologicalLossDur=0;
%         ind1=find(badAtEndEcgDaily(:,1)==subject & badAtEndEcgDaily(:,2)==day);
%         ind2=find(intermittantBadEcgDaily(:,1)==subject & intermittantBadEcgDaily(:,2)==day);
%         ind3=find(packetLossEcgDaily(:,1)==subject & packetLossEcgDaily(:,2)==day);
%         ind4=find(wirelessDisconDaily(:,1)==subject & wirelessDisconDaily(:,2)==day);
%         ind5=find(jerkEcgDaily(:,1)==subject & jerkEcgDaily(:,2)==day);
%         if ~isempty(ind1)
%             technologicalLossDur=technologicalLossDur+badAtEndEcgDaily(ind1,3);
%         end
%         if ~isempty(ind2)
%             technologicalLossDur=technologicalLossDur+intermittantBadEcgDaily(ind2,3);
%         end
%         if ~isempty(ind3)
%             technologicalLossDur=technologicalLossDur+packetLossEcgDaily(ind3,3);
%         end
%         if ~isempty(ind4)
%             technologicalLossDur=technologicalLossDur+wirelessDisconDaily(ind4,3);
%         end
%          if ~isempty(ind5)
%             technologicalLossDur=technologicalLossDur+jerkEcgDaily(ind5,3);
%          end
%         lossDueToTechnology=[lossDueToTechnology;subject day technologicalLossDur];
%
%         adherenceLossDur=0;
%         ind11=find(sensorTurnedOffDaily(:,1)==subject & sensorTurnedOffDaily(:,2)==day);
%         ind12=find(badAtStartEcgDaily(:,1)==subject & badAtStartEcgDaily(:,2)==day);
%         ind13=find(fullEpisodeBadEcgDaily(:,1)==subject & fullEpisodeBadEcgDaily(:,2)==day);
%
%         if ~isempty(ind11)
%             adherenceLossDur=adherenceLossDur+badAtEndEcgDaily(ind11,3);
%         end
%         if ~isempty(ind12)
%             adherenceLossDur=adherenceLossDur+badAtStartEcgDaily(ind12,3);
%         end
%         if ~isempty(ind13)
%             adherenceLossDur=adherenceLossDur+fullEpisodeBadEcgDaily(ind13,3);
%         end
%         lossDueToAdherence=[lossDueToAdherence;subject day adherenceLossDur];
%
%         ind=find(ecgGood(:,1)==subject & ecgGood(:,2)==day);
%         if ~isempty(ind)
%             ecgGoodDaily=[ecgGoodDaily;subject day sum((ecgGood(ind,4)-ecgGood(ind,3)))/1000/60/60];
%         end
%
%         ind=find(ripGood(:,1)==subject & ripGood(:,2)==day);
%         if ~isempty(ind)
%             ripGoodDaily=[ripGoodDaily;subject day sum((ripGood(ind,4)-ripGood(ind,3)))/1000/60/60];
%         end

%%%%%%%%%%%Processing For UbiComp 2014%%%%%%%%%%%
%         load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\p' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '_frmtraw.mat']);
%         load(['c:\dataProcessingFrameworkV2\data\memphis\formattedraw\' pid '_' sid '_frmtraw.mat']);
%         if isfield(R.sensor{11},'timestamp')
%             if size(R.sensor{11}.timestamp,1)>1
%                 times = R.sensor{11}.timestamp';
%                 phoneTime=[phoneTime times(1:2000:end)];
%             else
%                 phoneTime=[phoneTime R.sensor{11}.timestamp(1:2000:end)];
%             end
%         end

          %status of stress availability before self report
          selfreportId=2;  %smoking report
          load(['c:\dataProcessingFrameworkV2\data\memphis\formatteddata\' pid '_' sid '_frmtdata.mat']);
          if isfield(D,'selfreport') && isfield(D.selfreport{selfreportId},'timestamp') && length(D.selfreport{selfreportId}.timestamp)>=1
              for i=1:length(D.selfreport{selfreportId}.timestamp)
                  usableDataForStress=[];
                  for t=[5 10 20 30 40 50 60]
                    [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent(pid,sid,'ecg',D.selfreport{selfreportId}.timestamp(i),t);
                    usableDataForStress=[usableDataForStress usableForStress/t];  % usable data before stress in %
                  end
                  stressStatusB4SmkReport=[stressStatusB4SmkReport;usableDataForStress];
%                   stressStatusB4DrnkReport5=[stressStatusB4DrnkReport5; subject day usableForStress];
%                   [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent(pid,sid,'ecg',D.selfreport{selfreportId}.timestamp(i),10);
%                   stressStatusB4DrnkReport10=[stressStatusB4DrnkReport10; subject day usableForStress];
%                   [goodData activity usableForStress]=getUsableStressDataBeforeTheEvent(pid,sid,'ecg',D.selfreport{selfreportId}.timestamp(i),60);
%                   stressStatusB4DrnkReport60=[stressStatusB4DrnkReport60; subject day usableForStress];
%                     set(gca,'XTickLabel',{'5 min before', '10 min before', '20 min before', '30 min before', '40 min before', '50 min before', '60 min before'})
%                   xlabel('Availability of stress data before the selfreport')
%                   ylabel('% of available stress data')
%                   title('Stress Before Smoking Selfreport')
%                   ylim([0 1])

              end
          end
    end;
%     d=diff(phoneTime)/1000/60;
%     %ind=find(d>1);
%     %first see the distribution, then figure out whether it is at home, and
%     %at night, therefore it might be due to sleeping, discard them
%     ind=find(d>1 & d<12*60);
%     phoneOffDur=[phoneOffDur d(ind)];
end;
% writeEpisodes(wearingEpisodes,'wearing');
% writeEpisodes(goodRipEpisodesWD,'rip_WD');
% writeEpisodes(goodRipEpisodesWE,'rip_WE');
% writeEpisodes(goodEcgEpisodesWD,'ecg_WD');
% writeEpisodes(goodEcgEpisodesWE,'ecg_WE');

%draw histogram
% [n1 xout1]=hist(nonContiguousActivityEcg,100);
% cumulativeSum1=cumsum(n1);
% plot(xout1,cumulativeSum1/length(nonContiguousActivityEcg))
% hold on;
% [n2 xout2]=hist(nonContiguousActivityRip,100);
% cumulativeSum2=cumsum(n2);
% plot(xout2,cumulativeSum2/length(nonContiguousActivityRip),'g')

%subject wise technology and adherence loss per week, for paired test

% technologyDataPerSubject=[];
% adherenceDataPerSubject=[];
% for i=12:44
%     ind=find(lossDueToTechnology(:,1)==i);
%     if ~isempty(ind)
%         technologyDataPerSubject=[technologyDataPerSubject; i sum(lossDueToTechnology(ind,3))/7];
%     end
%
%     ind1=find(lossDueToAdherence(:,1)==i);
%     if ~isempty(ind1)
%         adherenceDataPerSubject=[adherenceDataPerSubject;i sum(lossDueToAdherence(ind1,3))/7];
%     end
% end


disp('done');
