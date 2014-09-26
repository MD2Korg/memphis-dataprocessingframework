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
badAtStartNida=load('C:\DataProcessingFramework\data\UbiComp\Data\compareNidaMemphisLoss\episodes_badAtStart_ecg_nida.csv');  %delay in attachment
badAtStartMemphis=load('C:\DataProcessingFramework\data\UbiComp\Data\compareNidaMemphisLoss\episodes_badAtStart_ecg.csv');

wearingMemphis=load('C:\DataProcessingFramework\data\UbiComp\Data\compareNidaMemphisLoss\episodes_wearing_all_active_period.csv');
wearingNida=load('C:\DataProcessingFramework\data\UbiComp\Data\compareNidaMemphisLoss\episodes_wearing_minusDropout.csv');

%we compare intermittent loosening / wearing ratio for each individual

subjectwiseMemphis=[];
for i=[12,13,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,30,31,32,33,34,35,36,37,39,40,41,42,43,44]
    ind1=find(wearingMemphis(:,1)==i);
    wearing_i=sum(wearingMemphis(ind1,4)-wearingMemphis(ind1,3))/1000/60/60;
    ind2=find(badAtStartMemphis(:,1)==i);
    intermittent_i=sum(badAtStartMemphis(ind2,4)-badAtStartMemphis(ind2,3))/1000/60/60;
    subjectWiseRatio=intermittent_i/wearing_i;
    subjectwiseMemphis=[subjectwiseMemphis;i subjectWiseRatio];
end

subjectwiseNida=[];
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind1=find(wearingNida(:,1)==i);
    wearing_i=sum(wearingNida(ind1,4)-wearingNida(ind1,3))/1000/60/60;
    ind2=find(badAtStartNida(:,1)==i);
    intermittent_i=sum(badAtStartNida(ind2,4)-badAtStartNida(ind2,3))/1000/60/60;
    subjectWiseRatio=intermittent_i/wearing_i;
    subjectwiseNida=[subjectwiseNida;i subjectWiseRatio];
end
