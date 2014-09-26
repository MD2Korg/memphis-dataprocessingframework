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

%% Input of this script come from two scripts: (1)
%(1) getStressDataStatusBeforeSelfreport.m &
%(2) overallMinuteByMinuteStressData.m
%Plot the status as separate bar graphs for smoking, craving, drug, and
%stress self reports.

%% smoking
meanStress=[];meanActivity=[];meanGood=[]; meanInterm=[];
for i=3:14
    stress=stressStatusB4SmokingReport(:,i);
    ind1=find(stress>=0);
    meanStress=[meanStress mean(stress(ind1))];

    activity=activityStatusB4SmokingReport(:,i);
    ind2=find(activity>=0);
    meanActivity=[meanActivity mean(activity(ind2))];

    good=goodDataB4SmokingReport(:,i);
    ind3=find(good>=0);
    meanGood=[meanGood mean(good(ind3))];

    inter=intermittentB4SmokingReport(:,i);
    ind4=find(inter>=0);
    meanInterm=[meanInterm mean(inter(ind4))];
end

%reverse the order of preceeding minutes, for plot
%current format: [1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,best2/3,best3/5]
%new format: [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,best2/3,best3/5]
meanStressRev=[];
r=10;
for i=1:length(meanStress)-2
    meanStressRev=[meanStressRev meanStress(r)];
    r=r-1;
end
meanStressRev=[meanStressRev 0 meanStress(11) meanStress(12)];  %inserting zero to make space for the self-report diagram

meanActivityRev=[];
r=10;
for i=1:length(meanActivity)-2
    meanActivityRev=[meanActivityRev meanActivity(r)];
    r=r-1;
end
meanActivityRev=[meanActivityRev 0 meanActivity(11) meanActivity(12)];  %inserting zero to make space for the self-report diagram

meanBadRev=[];
r=10;
for i=1:length(meanGood)-2
    meanBadRev=[meanBadRev 1-meanGood(r)];
    r=r-1;
end
meanBadRev=[meanBadRev 0 1-meanGood(11) 1-meanGood(12)];  %inserting zero to make space for the self-report diagram

dataSmk=[meanStressRev;meanActivityRev;meanBadRev]';
dataSmkWithOverall=[dataSmk;mean(minuteWiseUsableStress(:,3:end)) mean(minuteWiseActivity(:,3:end)) 1-mean(minuteWiseGood(:,3:end))];
colormap(gray)
figure;hold on;bar(dataSmkWithOverall);
grid
set(gca,'fontsize',14)
xlabel('Minutes preceeding smoking report (Drug Users)','fontsize',28)
ylabel('Fraction of minute','fontsize',28)
set(gca,'XTickLabel',{'-10', '-9', '-8', '-7', '-6','-5','-4','-3','-2','-1','0','Best2/3', 'Best3/5','Overall'})
set(gca,'XTick',1:14);
legend('Available for Stress','Activity','Unavailable')
legend('Orientation','horizontal')
set(gca,'YLim',[0 1]);
plot([11 11],[0 0.8],'r--','LineWidth',6);
text(11.1, 0.1  , 'Smoking Report','FontSize',28,'Rotation',90);
colormap(gray)

% subjectwise standard deviation calculation
stressSmkStdSubjectWise=[];
actSmkStdSubjectWise=[];
badSmkStdSubjectWise=[];
for i=[1,2,3,4,5,6,7,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,33,34,35,36,38,39,40,41,42,43,44]
    ind=find(stressStatusB4SmokingReport(:,1)==i);
    tempStr=stressStatusB4SmokingReport(ind,3:end);
    tempAct=activityStatusB4SmokingReport(ind,3:end);
    tempGood=goodDataB4SmokingReport(ind,3:end);
    strss=-1*ones(1,12);
    act=-1*ones(1,12);
    bad=-1*ones(1,12);
    for j=1:12
        dataStr=tempStr(:,j);
        ind2=find(dataStr>=0);
        strss(j)=mean(dataStr(ind2));

        dataAct=tempAct(:,j);
        ind3=find(dataAct>=0);
        act(j)=mean(dataAct(ind3));

        dataGood=tempGood(:,j);
        ind4=find(dataGood>=0);
        bad(j)=1-mean(dataGood(ind3));
    end
    stressSmkStdSubjectWise=[stressSmkStdSubjectWise; i strss];
    actSmkStdSubjectWise=[actSmkStdSubjectWise; i act];
    badSmkStdSubjectWise=[badSmkStdSubjectWise; i bad];
end
nanSdSmkStrs=nanstd(stressSmkStdSubjectWise(:,2:end));
nanSdSmkAct=nanstd(actSmkStdSubjectWise(:,2:end));
nanSdSmkBad=nanstd(badSmkStdSubjectWise(:,2:end));

dataSmkStd=[nanSdSmkStrs;nanSdSmkAct;nanSdSmkBad]';
%% craving
meanStress=[];meanActivity=[];meanGood=[]; meanInterm=[];
for i=3:14
    stress=stressStatusB4CravReport(:,i);
    ind1=find(stress>=0);
    meanStress=[meanStress mean(stress(ind1))];

    activity=activityStatusB4CravReport(:,i);
    ind2=find(activity>=0);
    meanActivity=[meanActivity mean(activity(ind2))];

    good=goodDataB4CravReport(:,i);
    ind3=find(good>=0);
    meanGood=[meanGood mean(good(ind3))];

    inter=intermittentB4CravReport(:,i);
    ind4=find(inter>=0);
    meanInterm=[meanInterm mean(inter(ind4))];
end

dataCrav=[meanStress;meanActivity;1-meanGood]';
dataCravWithOverall=[dataCrav;mean(minuteWiseUsableStress(:,3:end)) mean(minuteWiseActivity(:,3:end)) 1-mean(minuteWiseGood(:,3:end))];
colormap(gray)
figure;hold on;bar(dataCravWithOverall);
% plot([11 11],[0 0.8],'Color','r--','LineWidth',3);
% text(11.1, 0.1  , 'Drug Report', 'Color', 'r','FontSize',18,'Rotation',90);
plot([11 11],[0 0.8],'LineWidth',3);
text(11.1, 0.1  , 'Drug Report','FontSize',18,'Rotation',90);
grid
set(gca,'fontsize',14)
xlabel('Minute before the selfreport')
ylabel('Status of data')
set(gca,'XTickLabel',{'1st', '2nd', '3rd', '4th', '5th','6th','7th','8th','9th','10th' 'best2/3', 'best3/5','overall'})
title('Craving Selfreport (NIDA)')
legend('Available for Stress','Activity','Unusable')
legend('Orientation','horizontal')
set(gca,'YLim',[0 1]);

%% drug report
meanStress=[];meanActivity=[];meanGood=[]; meanInterm=[];
for i=3:14
    stress=stressStatusB4DrugReport(:,i);
    ind1=find(stress>=0);
    meanStress=[meanStress mean(stress(ind1))];

    activity=activityStatusB4DrugReport(:,i);
    ind2=find(activity>=0);
    meanActivity=[meanActivity mean(activity(ind2))];

    good=goodDataB4DrugReport(:,i);
    ind3=find(good>=0);
    meanGood=[meanGood mean(good(ind3))];

    inter=intermittentB4DrugReport(:,i);
    ind4=find(inter>=0);
    meanInterm=[meanInterm mean(inter(ind4))];
end
%reverse the order of preceeding minutes, for plot
%current format: [1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,best2/3,best3/5]
%new format: [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,best2/3,best3/5]
meanStressRev=[];
r=10;
for i=1:length(meanStress)-2
    meanStressRev=[meanStressRev meanStress(r)];
    r=r-1;
end
meanStressRev=[meanStressRev 0 meanStress(11) meanStress(12)];  %inserting zero to make space for the self-report diagram

meanActivityRev=[];
r=10;
for i=1:length(meanActivity)-2
    meanActivityRev=[meanActivityRev meanActivity(r)];
    r=r-1;
end
meanActivityRev=[meanActivityRev 0 meanActivity(11) meanActivity(12)];  %inserting zero to make space for the self-report diagram

meanBadRev=[];
r=10;
for i=1:length(meanGood)-2
    meanBadRev=[meanBadRev 1-meanGood(r)];
    r=r-1;
end
meanBadRev=[meanBadRev 0 1-meanGood(11) 1-meanGood(12)];  %inserting zero to make space for the self-report diagram

dataDrug=[meanStressRev;meanActivityRev;meanBadRev]';
dataDrugWithOverall=[dataDrug;mean(minuteWiseUsableStress(:,3:end)) mean(minuteWiseActivity(:,3:end)) 1-mean(minuteWiseGood(:,3:end))];
colormap(gray)
figure;hold on;bar(dataDrugWithOverall);

grid
set(gca,'fontsize',14)
xlabel('Minutes preceeding drug report (Drug Users)','fontsize',28)
ylabel('Fraction of minute','fontsize',28)
set(gca,'XTickLabel',{'-10', '-9', '-8', '-7', '-6','-5','-4','-3','-2','-1','0','Best2/3', 'Best3/5','Overall'})
set(gca,'XTick',1:14);
% title('Drug Selfreport (NIDA)')
legend('Available for Stress','Activity','Unavailable')
legend('Orientation','horizontal')
set(gca,'YLim',[0 1]);
plot([11 11],[0 0.8],'r--','LineWidth',6);
text(11.1, 0.1  , 'Drug Report','FontSize',28,'Rotation',90);
colormap(gray)

%% stress
meanStress=[];meanActivity=[];meanGood=[]; meanInterm=[];
for i=3:14
    stress=stressStatusB4StressReport(:,i);
    ind1=find(stress>=0);
    meanStress=[meanStress mean(stress(ind1))];

    activity=activityStatusB4StressReport(:,i);
    ind2=find(activity>=0);
    meanActivity=[meanActivity mean(activity(ind2))];

    good=goodDataB4DrugReport(:,i);
    ind3=find(good>=0);
    meanGood=[meanGood mean(good(ind3))];

    inter=intermittentB4StressReport(:,i);
    ind4=find(inter>=0);
    meanInterm=[meanInterm mean(inter(ind4))];
end

%reverse the order of preceeding minutes, for plot
%current format: [1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,best2/3,best3/5]
%new format: [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,best2/3,best3/5]
meanStressRev=[];
r=10;
for i=1:length(meanStress)-2
    meanStressRev=[meanStressRev meanStress(r)];
    r=r-1;
end
meanStressRev=[meanStressRev 0 meanStress(11) meanStress(12)];  %inserting zero to make space for the self-report diagram

meanActivityRev=[];
r=10;
for i=1:length(meanActivity)-2
    meanActivityRev=[meanActivityRev meanActivity(r)];
    r=r-1;
end
meanActivityRev=[meanActivityRev 0 meanActivity(11) meanActivity(12)];  %inserting zero to make space for the self-report diagram

meanBadRev=[];
r=10;
for i=1:length(meanGood)-2
    meanBadRev=[meanBadRev 1-meanGood(r)];
    r=r-1;
end
meanBadRev=[meanBadRev 0 1-meanGood(11) 1-meanGood(12)];  %inserting zero to make space for the self-report diagram

dataStress=[meanStressRev;meanActivityRev;meanBadRev]';
dataStressWithOverall=[dataStress;mean(minuteWiseUsableStress(:,3:end)) mean(minuteWiseActivity(:,3:end)) 1-mean(minuteWiseGood(:,3:end))];
colormap(gray)
figure;hold on;bar(dataStressWithOverall);
grid
set(gca,'fontsize',14)
xlabel('Minutes preceeding stress report (Drug Users)','fontsize',28)
ylabel('Fraction of minute','fontsize',28)
set(gca,'XTickLabel',{'-10', '-9', '-8', '-7', '-6','-5','-4','-3','-2','-1','0','Best2/3', 'Best3/5','Overall'})
set(gca,'XTick',1:14);
legend('Available for Stress','Activity','Unavailable')
legend('Orientation','horizontal')
set(gca,'YLim',[0 1]);
plot([11 11],[0 0.8],'r--','LineWidth',6);
text(11.1, 0.1  , 'Stress Report','FontSize',28,'Rotation',90);
colormap(gray)

%% craving
meanStress=[];meanActivity=[];meanGood=[]; meanInterm=[];
for i=3:14
    stress=stressStatusB4CravingReport(:,i);
    ind1=find(stress>=0);
    meanStress=[meanStress mean(stress(ind1))];

    activity=activityStatusB4CravingReport(:,i);
    ind2=find(activity>=0);
    meanActivity=[meanActivity mean(activity(ind2))];

    good=goodDataB4DrugReport(:,i);
    ind3=find(good>=0);
    meanGood=[meanGood mean(good(ind3))];

    inter=intermittentB4CravingReport(:,i);
    ind4=find(inter>=0);
    meanInterm=[meanInterm mean(inter(ind4))];
end

%reverse the order of preceeding minutes, for plot
%current format: [1st,2nd,3rd,4th,5th,6th,7th,8th,9th,10th,best2/3,best3/5]
%new format: [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,best2/3,best3/5]
meanStressRev=[];
r=10;
for i=1:length(meanStress)-2
    meanStressRev=[meanStressRev meanStress(r)];
    r=r-1;
end
meanStressRev=[meanStressRev 0 meanStress(11) meanStress(12)];  %inserting zero to make space for the self-report diagram

meanActivityRev=[];
r=10;
for i=1:length(meanActivity)-2
    meanActivityRev=[meanActivityRev meanActivity(r)];
    r=r-1;
end
meanActivityRev=[meanActivityRev 0 meanActivity(11) meanActivity(12)];  %inserting zero to make space for the self-report diagram

meanBadRev=[];
r=10;
for i=1:length(meanGood)-2
    meanBadRev=[meanBadRev 1-meanGood(r)];
    r=r-1;
end
meanBadRev=[meanBadRev 0 1-meanGood(11) 1-meanGood(12)];  %inserting zero to make space for the self-report diagram

dataCrav=[meanStressRev;meanActivityRev;meanBadRev]';
dataCravWithOverall=[dataCrav;mean(minuteWiseUsableStress(:,3:end)) mean(minuteWiseActivity(:,3:end)) 1-mean(minuteWiseGood(:,3:end))];
colormap(gray)
figure;hold on;bar(dataCravWithOverall);
grid
set(gca,'fontsize',14)
xlabel('Minutes preceeding craving report (Drug Users)','fontsize',28)
ylabel('Fraction of minute','fontsize',28)
set(gca,'XTickLabel',{'-10', '-9', '-8', '-7', '-6','-5','-4','-3','-2','-1','0','Best2/3', 'Best3/5','Overall'})
set(gca,'XTick',1:14);
legend('Available for Stress','Activity','Unavailable')
legend('Orientation','horizontal')
set(gca,'YLim',[0 1]);
plot([11 11],[0 0.8],'r--','LineWidth',6);
text(11.1, 0.1  , 'Craving Report','FontSize',28,'Rotation',90);
colormap(gray)
