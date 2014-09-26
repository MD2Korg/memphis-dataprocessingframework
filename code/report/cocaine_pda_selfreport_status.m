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

PS_LIST=G.PS_LIST;

activePeriodEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_activePeriod_minusDropout.csv');

wearingTimes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_wearing_minusDropout.csv');
goodEcg=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_ecg_minusDropout.csv');

cocaineUseReport=csvread('c:\dataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\cocaine_use_pda_timing.csv',1,0);

insideActivePeriod=[];
whileWearingSensor=[];
whileGoodData=[];

[r c]=size(cocaineUseReport);

for i=1:r
    participant=cocaineUseReport(i,1);
    timestamp=convert_timestamp_time(G,cocaineUseReport(i,2));

    ind1=find(activePeriodEpisodes(:,1)==participant);
    activeOfTheSubject=activePeriodEpisodes(ind1,:);

    ind2=find(wearingTimes(:,1)==participant);
    wearingOfTheSubject=wearingTimes(ind2,:);

    ind3=find(goodEcg(:,1)==participant);
    goodEcgOfTheSubject=goodEcg(ind3,:);

    ind=find(activeOfTheSubject(:,3)>=timestamp & activeOfTheSubject(:,4)<=timestamp);
    if ~isempty(ind)
        insideActivePeriod=[insideActivePeriod; participant timestamp 1];
    else
        insideActivePeriod=[insideActivePeriod; participant timestamp 0];
    end

    ind=find(wearingOfTheSubject(:,3)>=timestamp & wearingOfTheSubject(:,4)<=timestamp);
    if ~isempty(ind)
        whileWearingSensor=[whileWearingSensor; participant timestamp 1];
    else
        whileWearingSensor=[whileWearingSensor; participant timestamp 0];
    end

    ind=find(goodEcgOfTheSubject(:,3)>=timestamp & goodEcgOfTheSubject(:,4)<=timestamp);
    if ~isempty(ind)
        whileGoodData=[whileGoodData; participant timestamp 1];
    else
        whileGoodData=[whileGoodData; participant timestamp 0];
    end
end
