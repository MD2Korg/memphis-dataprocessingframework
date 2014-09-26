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

% cravingEvent=load('C:\DataProcessingFramework\data\nida\report\selfreports\cravingReportWhileActivePeriod.csv');
% stressEvent=load('C:\DataProcessingFramework\data\nida\report\selfreports\stress_report_timestamps_nida_whileActiveInProtocol.csv');
% drugEvent=load('C:\DataProcessingFramework\data\nida\report\selfreports\drug_PDAreport_timestamps_nida_whileActiveInProtocol.csv');
smokingEvent=load('C:\DataProcessingFramework\data\nida\report\selfreports\smokingReportWhileActivePeriod.csv');
activityEpisodes=load('c:\dataProcessingFramework\data\nida\report\ActivityEpisodes\activityEpisodes_all.csv');
% goodEpisodes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_rip_minusDropout.csv');
goodEpisodes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_ecg_minusDropout.csv');
intermittantLooseEpisodes=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_intermittentBad_ecg_nida.csv');
badAtEnd=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_badAtEnd_ecg_nida.csv');
badAtStart=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_badAtStart_ecg_nida.csv');
fullBad=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_fullEpisodeBad_ecg_nida.csv');

activeInProtocol=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_activePeriod_minusDropout.csv');

data=smokingEvent;

% stressStatusB4CravReport=[];
% activityStatusB4CravReport=[];
% goodDataB4CravReport=[];
% intermittentB4CravReport=[];

% stressStatusB4StressReport=[];
% activityStatusB4StressReport=[];
% goodDataB4StressReport=[];
% intermittentB4StressReport=[];
% improperAttacB4StressReport=[];
% dealyInAttachmentB4StressReport=[];
% otherIssuesB4StressReport=[];


stressStatusB4SmokingReport=[];
activityStatusB4SmokingReport=[];
goodDataB4SmokingReport=[];
intermittentB4SmokingReport=[];
improperAttacB4SmokingReport=[];
dealyInAttachmentB4SmokingReport=[];
otherIssuesB4SmokingReport=[];

% stressStatusB4DrugReport=[];
% activityStatusB4DrugReport=[];
% goodDataB4DrugReport=[];
% intermittentB4DrugReport=[];


[r c]=size(data);
for i=1:r
    i
    usableDataForStress=[];
    activityData=[];
    goodQuality=[];
    intermittent=[];
    improper=[];
    badQstart=[];
    others=[];
    p=data(i,1); %participant
    d=data(i,2); %day
%     d=-1;  %for stress reports we do not have day information
    for t=[1 2 3 4 5 6 7 8 9 10 11 12]
%     for t=[1 2 3 4 5 6 7]
%         [badData goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_v2(p,d,goodEpisodes,activityEpisodes,data(i,end),t);
%         [badData intermittentBad goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_v3(p,d,intermittantLooseEpisodes,goodEpisodes,activityEpisodes,activeInProtocol,data(i,end),t);
        [badData intermittentBad improperAttachment badQuAtStart goodData activity usableForStress]=getUsableStressDataBeforeTheEvent_v4(p,d,intermittantLooseEpisodes,goodEpisodes,activityEpisodes,activeInProtocol,data(i,end),t,badAtEnd,badAtStart,fullBad);

        usableDataForStress=[usableDataForStress usableForStress];   %usable data before stress in %
        activityData=[activityData activity];
        goodQuality=[goodQuality goodData];
        intermittent=[intermittent intermittentBad];
        improper=[improper improperAttachment];
        badQstart=[badQstart badQuAtStart];
        others=[others 1-goodQuality-intermittent-improper-badQstart];
    end
%     stressStatusB4DrugReport=[stressStatusB4DrugReport; p d usableDataForStress];
%     activityStatusB4DrugReport=[activityStatusB4DrugReport; p d activityData];
%     goodDataB4DrugReport=[goodDataB4DrugReport; p d goodQuality];
%     intermittentB4DrugReport=[intermittentB4DrugReport;p d intermittent];

%       stressStatusB4StressReport=[stressStatusB4StressReport; p d usableDataForStress];
%       activityStatusB4StressReport=[activityStatusB4StressReport; p d activityData];
%       goodDataB4StressReport=[goodDataB4StressReport; p d goodQuality];
%       intermittentB4StressReport=[intermittentB4StressReport;p d intermittent];
%       improperAttacB4StressReport=[improperAttacB4StressReport;p d improper];
%       dealyInAttachmentB4StressReport=[dealyInAttachmentB4StressReport;p d badQstart];
%       otherIssuesB4StressReport=[otherIssuesB4StressReport;p d others];

    stressStatusB4SmokingReport=[stressStatusB4SmokingReport; p d usableDataForStress];
    activityStatusB4SmokingReport=[activityStatusB4SmokingReport; p d activityData];
    goodDataB4SmokingReport=[goodDataB4SmokingReport; p d goodQuality];
    intermittentB4SmokingReport=[intermittentB4SmokingReport;p d intermittent];
      improperAttacB4SmokingReport=[improperAttacB4SmokingReport;p d improper];
      dealyInAttachmentB4SmokingReport=[dealyInAttachmentB4SmokingReport;p d badQstart];
      otherIssuesB4SmokingReport=[otherIssuesB4SmokingReport;p d others];

%     stressStatusB4CravReport=[stressStatusB4CravReport; p d usableDataForStress];
%     activityStatusB4CravReport=[activityStatusB4CravReport; p d activityData];
%     goodDataB4CravReport=[goodDataB4CravReport; p d goodQuality];
%     intermittentB4CravReport=[intermittentB4CravReport;p d intermittent];
end
