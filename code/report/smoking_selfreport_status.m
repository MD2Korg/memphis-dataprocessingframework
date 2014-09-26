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
G=config();
G=config_run_nida(G);

% PS_LIST=G.PS_LIST;

activePeriodEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_activePeriod_minusDropout.csv');
phoneEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_phoneONfromActivePeriod.csv');
wearingTimes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_wearing_minusDropout.csv');
goodEcg=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_ecg_minusDropout.csv');

% [subject reporttime]=textread('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\cocaine_use_pda_timing.csv','%d %s','delimiter',',');
% [subject reporttime]=textread('C:\DataProcessingFramework\data\nida\report\NIDA_SmokingSelfreport.csv','%d %u','delimiter',',');
% s=csvread('C:\DataProcessingFramework\data\nida\report\selfreports\NIDA_SmokingSelfreport.csv');
s=csvread('C:\DataProcessingFramework\data\nida\report\selfreports\NIDA_CravingSelfreport.csv');

subject=s(:,1);
reporttime=s(:,3);
day=s(:,2);

insideActivePeriod=[];
whilePhoneON=[];
whileWearingSensor=[];
whileGoodData=[];


for i=1:length(subject)
    participant=subject(i);
    d=day(i);
%     time=reporttime(i)
%     timestamp=convert_time_timestamp(G,cell2mat(time));
    timestamp=reporttime(i);

    ind1=find(activePeriodEpisodes(:,1)==participant);
    activeOfTheSubject=activePeriodEpisodes(ind1,:);

    ind2=find(wearingTimes(:,1)==participant);
    wearingOfTheSubject=wearingTimes(ind2,:);

    ind3=find(goodEcg(:,1)==participant);
    goodEcgOfTheSubject=goodEcg(ind3,:);

    ind4=find(phoneEpisodes(:,1)==participant);
    phoneONOfTheSubject=phoneEpisodes(ind4,:);

    ind=find(activeOfTheSubject(:,3)<=timestamp & activeOfTheSubject(:,4)>=timestamp);
    if ~isempty(ind)
        insideActivePeriod=[insideActivePeriod; participant d timestamp 1];
    else
        insideActivePeriod=[insideActivePeriod; participant d timestamp 0];
    end

    ind=find(phoneONOfTheSubject(:,3)<=timestamp & phoneONOfTheSubject(:,4)>=timestamp);
    if ~isempty(ind)
        whilePhoneON=[whilePhoneON; participant d timestamp 1];
    else
        whilePhoneON=[whilePhoneON; participant d timestamp 0];
    end

    ind=find(wearingOfTheSubject(:,3)<=timestamp & wearingOfTheSubject(:,4)>=timestamp);
    if ~isempty(ind)
        whileWearingSensor=[whileWearingSensor; participant d timestamp 1];
    else
        whileWearingSensor=[whileWearingSensor; participant d timestamp 0];
    end

    ind=find(goodEcgOfTheSubject(:,3)<=timestamp & goodEcgOfTheSubject(:,4)>=timestamp);
    if ~isempty(ind)
        whileGoodData=[whileGoodData; participant d timestamp 1];
    else
        whileGoodData=[whileGoodData; participant d timestamp 0];
    end
end
