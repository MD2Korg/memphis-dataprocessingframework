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
%subjectwise active period
subWiseActivePeriod=[];
activePeriodEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_activePeriod_minusDropout.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(activePeriodEpisodes(:,1)==i);
    subWiseActivePeriod=[subWiseActivePeriod;i sum((activePeriodEpisodes(ind,4)-activePeriodEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

% overallMean=nanmean(subWiseActivePeriod(:,2));
overallSd=nanstd(subWiseActivePeriod(:,2));

subWisePhoneOff=[];
phoneOffEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_phone_off_under_activePeriod.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(phoneOffEpisodes(:,1)==i);
    subWisePhoneOff=[subWisePhoneOff;i sum((phoneOffEpisodes(ind,4)-phoneOffEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWisePhoneOff(:,2));

subWisePhoneOn=[];
phoneOnEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_phoneONfromActivePeriod.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(phoneOnEpisodes(:,1)==i);
    subWisePhoneOn=[subWisePhoneOn;i sum((phoneOnEpisodes(ind,4)-phoneOnEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWisePhoneOn(:,2));

%sensor on
subWiseSensorOn=[];
sensorOnEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_chest.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(sensorOnEpisodes(:,1)==i);
    subWiseSensorOn=[subWiseSensorOn;i sum((sensorOnEpisodes(ind,4)-sensorOnEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWiseSensorOn(:,2))

%wearing
subWiseWearing=[];
wearingEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_wearing_minusDropout.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(wearingEpisodes(:,1)==i);
    subWiseWearing=[subWiseWearing;i sum((wearingEpisodes(ind,4)-wearingEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWiseWearing(:,2))


subWiseIntermittentEcg=[];
intermBadEcgEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_intermittentBad_ecg_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(intermBadEcgEpisodes(:,1)==i);
    subWiseIntermittentEcg=[subWiseIntermittentEcg;i sum((intermBadEcgEpisodes(ind,4)-intermBadEcgEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWiseIntermittentEcg(:,2))

subWiseFullBadEcg=[];  %improper attachment
fullBadEcgEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_fullEpisodeBad_ecg_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(fullBadEcgEpisodes(:,1)==i);
    subWiseFullBadEcg=[subWiseFullBadEcg;i sum((fullBadEcgEpisodes(ind,4)-fullBadEcgEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseFullBadEcg(:,2))

subWiseBadAtStartEcg=[];  %delay attachment
badAtStartEcgEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_badAtStart_ecg_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(subWiseBadAtStartEcg(:,1)==i);
    subWiseBadAtStartEcg=[subWiseBadAtStartEcg;i sum((badAtStartEcgEpisodes(ind,4)-badAtStartEcgEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseBadAtStartEcg(:,2))

subWiseAcceptableEcg=[];
acceptableEcgEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_ecg_minusDropout.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(acceptableEcgEpisodes(:,1)==i);
    subWiseAcceptableEcg=[subWiseAcceptableEcg;i sum((acceptableEcgEpisodes(ind,4)-acceptableEcgEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseAcceptableEcg(:,2))


subWiseIntermittentRip=[];
intermBadRipEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_intermittentBad_rip_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(intermBadEcgEpisodes(:,1)==i);
    subWiseIntermittentRip=[subWiseIntermittentRip;i sum((intermBadRipEpisodes(ind,4)-intermBadRipEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end

overallSd=nanstd(subWiseIntermittentRip(:,2))

subWiseFullBadRip=[];  %improper attachment
fullBadRipEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_fullEpisodeBad_rip_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(fullBadEcgEpisodes(:,1)==i);
    subWiseFullBadRip=[subWiseFullBadRip;i sum((fullBadRipEpisodes(ind,4)-fullBadRipEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseFullBadRip(:,2))

subWiseBadAtStartRip=[];  %delay attachment
badAtStartRipEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_badAtStart_rip_nida.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(subWiseBadAtStartRip(:,1)==i);
    subWiseBadAtStartRip=[subWiseBadAtStartRip;i sum((badAtStartRipEpisodes(ind,4)-badAtStartRipEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseBadAtStartRip(:,2))

subWiseAcceptableRip=[];
acceptableRipEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_rip_minusDropout.csv');
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(acceptableRipEpisodes(:,1)==i);
    subWiseAcceptableRip=[subWiseAcceptableRip;i sum((acceptableRipEpisodes(ind,4)-acceptableRipEpisodes(ind,3))/1000/60/60)/length(ind)]; %per user per day
end
overallSd=nanstd(subWiseAcceptableRip(:,2))
