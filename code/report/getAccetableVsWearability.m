function [acceptable wearing accptWearingRatio]=getAccetableVsWearability(participant,day,wearingTimes,goodData)
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

accptWearingRatio=-1;
acceptable=0;
wearing=0;
ind=find(wearingTimes(:,1)==participant & wearingTimes(:,2)==day);
if isempty(ind)
    return
end
wearinOfTheDay=wearingTimes(ind,:);
ind2=find(goodData(:,1)==participant & goodData(:,2)==day);
goodDataOfTheDay=goodData(ind2,:);
acceptable=sum(goodDataOfTheDay(:,4)-goodDataOfTheDay(:,3))/1000/60; %minutes
wearing=sum(wearinOfTheDay(:,4)-wearinOfTheDay(:,3))/1000/60;
accptWearingRatio=acceptable/wearing;
end

%% test whether there is any effect of learning and waning
%{
data=acceptableVsWearingWeekly(:,2);
week1=data(1:4:end);
week2=data(2:4:end);
week3=data(3:4:end);
week4=data(4:4:end);
figure;hist(week1)
[h,p,ci,stats] = ttest2(week1,week2,0.05,'left')
[h,p,ci,stats] = ttest2(week2,week3,0.05,'left')
[h,p,ci,stats] = ttest2(week3,week4,0.05,'left')
wearData=wearingWeekly(:,2);
week1Wear1=wearData(1:4:end);
week1Wear2=wearData(2:4:end);
week1Wear3=wearData(3:4:end);
week1Wear4=wearData(4:4:end);
[h,p,ci,stats] = ttest2(week1Wear1,week1Wear2,0.05,'left')
[h,p,ci,stats] = ttest2(week1Wear2,week1Wear3,0.05,'left')
[h,p,ci,stats] = ttest2(week1Wear3,week1Wear4,0.05,'left')
[h,p,ci,stats] = ttest2(week1Wear3,week1Wear4)
accptData=acceptableWeekly(:,2);
week1Accpt1=accptData(1:4:end);
week1Accpt2=accptData(2:4:end);
week1Accpt3=accptData(3:4:end);
week1Accpt4=accptData(4:4:end);
[h,p,ci,stats] = ttest2(week1Accpt1,week1Accpt2,0.05,'left')
[h,p,ci,stats] = ttest2(week1Accpt2,week1Accpt3,0.05,'left')
[h,p,ci,stats] = ttest2(week1Accpt3,week1Accpt4,0.05,'left')
%}
