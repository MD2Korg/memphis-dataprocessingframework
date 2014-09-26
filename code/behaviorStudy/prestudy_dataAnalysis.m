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

% phone=load('d:\conversationStudy\data\prestudy_survey_memphis\phonePrice.txt');
% phone_wrist=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_Price.txt');
% phone_wrist_chest=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_c_Price.txt');
% phone_wrist_chest_audio=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_c_a_Price.txt');
%
% [h,p,ci]=ttest([phone_wrist-phone]);  %significance level, alpha = 0.05
% [h,p,ci]=ttest([phone_wrist_chest-phone_wrist]);
% [h,p,ci]=ttest([phone_wrist_chest_audio-phone_wrist_chest]);
% figure;boxplot([phone phone_wrist phone_wrist_chest phone_wrist_chest_audio]/100);
% grid
%
% %----------For  non-decreasing participants
% phoneND=load('d:\conversationStudy\data\prestudy_survey_memphis\phonePrice_nonDecrease.txt');
% phone_wristND=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_Price_nonDecrease.txt');
% phone_wrist_chestND=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_c_Price_nonDecrease.txt');
% phone_wrist_chest_audioND=load('d:\conversationStudy\data\prestudy_survey_memphis\p_w_c_a_Price_nonDecrease.txt');
%
% [h,p,ci]=ttest([phone_wristND-phoneND]);  %significance level, alpha = 0.05
% [h,p,ci]=ttest([phone_wrist_chestND-phone_wristND]);
% [h,p,ci]=ttest([phone_wrist_chest_audioND-phone_wrist_chestND]);
% figure;boxplot([phoneND phone_wristND phone_wrist_chestND phone_wrist_chest_audioND]/100);
% grid
% % percentage change for non-decreasing participants
% mean(100*([phone_wrist_chest_audioND-phone_wrist_chestND]./phone_wrist_chest_audioND))
% mean(100*([phone_wrist_chestND-phone_wristND]./phone_wristND))
%------------------------------------------

%using master dataset from pre-study survey in Memphis
% masterData=csvread('D:\ConversationStudy\Data\prestudy_survey_memphis\memphis_survey_masterDataSet.csv',1,1);
masterData=csvread('D:\ConversationStudy\Data\prestudy_survey_memphis\memphis_survey_masterDataSet.csv',1,1);

%remove suspicious entries
ind=find(masterData(:,end)~=-1);
length(ind)
validData=masterData(ind,:);
% figure;boxplot(validData(:,1:4)/100,'label',{'P','P+W','P+W+C','All'});
% grid;
% title(['All together excluding suspicious values(' num2str(length(ind)) ')']);
% xlabel('All four conditions');
% ylabel('Compensation($)');
% set(gca,'XTIckLabel',{'P','P+W','P+W+C','P+W+C+A'});

%plot only non-decreasing entries
ind=find(masterData(:,end)==0);
nonDecreaseData=masterData(ind,:);
% figure;boxplot(nonDecreaseData(:,1:4)/100,'label',{'P','P+W','P+W+C','All'});
% grid;
% title(['Entries non decreasing values(' num2str(length(ind)) ')']);
% xlabel('All four conditions');
% ylabel('Compensation($)');

%plot data where there is at least one decrement
ind=find(masterData(:,end)==1);
decreasingData=masterData(ind,:);
% figure;boxplot(decreasingData(:,1:4)/100,'label',{'P','P+W','P+W+C','All'});
% grid;
% title(['Entries with at least one decrement(' num2str(length(ind)) ')']);
% xlabel('All four conditions');
% ylabel('Compensation($)');

% mean, median, stdev, 25th percentile, 75th percentile
meanVal1=mean(validData)';          %Overall: Group 4
stdVal1=std(validData)';          %Overall: Group 4
medianVal1=median(validData)';
prct25Val1=prctile(validData,25)';          %Overall: Group 4
prct75Val1=prctile(validData,75)';          %Overall: Group 4
iqrVal1=iqr(validData)';          %Overall: Group 4
stat_validData=[4*ones(4,1) meanVal1(1:4)/100 stdVal1(1:4)/100 prct25Val1(1:4)/100 medianVal1(1:4)/100 prct75Val1(1:4)/100 iqrVal1(1:4)/100];

meanVal2=mean(nonDecreaseData)';  %Group 1
stdVal2=std(nonDecreaseData)';  %Group 1
medianVal2=median(nonDecreaseData)';
prct25Val2=prctile(nonDecreaseData,25)';  %Group 1
prct75Val2=prctile(nonDecreaseData,75)';  %Group 1
iqrVal2=iqr(nonDecreaseData)';  %Group 1
stat_nonDecreaseData=[1*ones(4,1) meanVal2(1:4)/100 stdVal2(1:4)/100 prct25Val2(1:4)/100 medianVal2(1:4)/100 prct75Val2(1:4)/100 iqrVal2(1:4)/100];

meanVal3=mean(decreasingData)';   %Group 2
stdVal3=std(decreasingData)';   %Group 2
medianVal3=median(decreasingData)';
prct25Val3=prctile(decreasingData,25)';   %Group 2
prct75Val3=prctile(decreasingData,75)';   %Group 2
iqrVal3=iqr(decreasingData)';   %Group 2
stat_decreasingData=[2*ones(4,1) meanVal3(1:4)/100 stdVal3(1:4)/100 prct25Val3(1:4)/100 medianVal3(1:4)/100 prct75Val3(1:4)/100 iqrVal3(1:4)/100];

% combining all the statistics into one matrix
statistics=[stat_validData;stat_nonDecreaseData;stat_decreasingData];

filename = 'D:\ConversationStudy\Data\prestudy_survey_memphis\prestudy_statistics.csv';

fid = fopen(filename, 'w');
fprintf(fid, 'Group number, mean, stdev, prctile25, median, prctile75, Iqr\n');
fclose(fid);

dlmwrite(filename,statistics,'-append','delimiter',',');


%first do anova test

%t-test for mean comparison
[h1,p1]=ttest(validData(:,2)-validData(:,1));  %significance level, alpha = 0.05
[h2,p2]=ttest(validData(:,3)-validData(:,2));
[h3,p3]=ttest(validData(:,4)-validData(:,3));



%3D plot
% x=[1 2 3 4];
% y=[1 2 3 4 5 6 7 8];
% z=[120	120	240	245;3	3	5	5;
% 150	125	250	175;
% 150	300	350	350;
% 50	60	25	50;
% 100	300	300	300;
% 170	100	170	120;
% 148	300	700	450];
% figure
% surf(x,y,z)

%scatter plot
figure;plot(validData(:,1)/100,validData(:,2)/100,'go')
xlabel('Phone');
ylabel('phone+wrist');
figure;plot(validData(:,2)/100,validData(:,3)/100,'ro')
set(0,'DefaultTextFontname', 'Times New Roman');
set(gca,'fontsize',22)
% set(gca,'YLim',[0 0.65])
xlabel('phone+wrist','fontsize',28,'fontname','Times New roman')
ylabel('phone+wrist+chest','fontsize',28,'fontname','Times New roman')
set(gcf,'Color',[1 1 1]);
% xlabel('phone+wrist');
% ylabel('phone+wrist+chest');
figure;plot(validData(:,3)/100,validData(:,4)/100,'bo')
xlabel('phone+wrist+chest');
ylabel('phone+wrist+chest+audio');

% figure;hold on;plot(validData(:,1)/100,validData(:,2)/100,'go')
% plot(validData(:,1)/100,validData(:,3)/100,'r*')
% plot(validData(:,1)/100,validData(:,4)/100,'bd')

%linear regression test
X = [ones(size(validData,1),1) validData(:,1)/100];
y=validData(:,2)/100;
[b,bint,r,rint,stats]=regress(y,X)
figure;scatter(validData(:,1)/100,y,'filled')
set(0,'DefaultTextFontname', 'Times New Roman');
set(gca,'fontsize',22)
% set(gca,'YLim',[0 0.65])
xlabel('phone ($)','fontsize',28,'fontname','Times New roman')
ylabel('phone+wrist ($)','fontsize',28,'fontname','Times New roman')
set(gcf,'Color',[1 1 1]);
hold on;
x1fit = min(validData(:,1))/100:0.5:max(validData(:,1))/100;
YFIT = b(1) + b(2)*x1fit
plot(x1fit,YFIT,'r','linewidth',2)

%linear regression test
X = [ones(size(validData,1),1) validData(:,2)/100];
y=validData(:,3)/100;
[b,bint,r,rint,stats]=regress(y,X)
figure;scatter(validData(:,2)/100,y,'filled')
set(0,'DefaultTextFontname', 'Times New Roman');
set(gca,'fontsize',22)
% set(gca,'YLim',[0 0.65])
xlabel('phone+wrist ($)','fontsize',28,'fontname','Times New roman')
ylabel('phone+wrist+chest ($)','fontsize',28,'fontname','Times New roman')
set(gcf,'Color',[1 1 1]);
hold on;
x1fit = min(validData(:,2))/100:0.5:max(validData(:,2))/100;
YFIT = b(1) + b(2)*x1fit
plot(x1fit,YFIT,'r','linewidth',2)

%linear regression test
X = [ones(size(validData,1),1) validData(:,3)/100];
y=validData(:,4)/100;
[b,bint,r,rint,stats]=regress(y,X)
figure;scatter(validData(:,3)/100,y,'filled')
set(0,'DefaultTextFontname', 'Times New Roman');
set(gca,'fontsize',22)
% set(gca,'YLim',[0 0.65])
xlabel('phone+wrist+chest ($)','fontsize',28,'fontname','Times New roman')
ylabel('phone+wrist+chest+audio ($)','fontsize',28,'fontname','Times New roman')
set(gcf,'Color',[1 1 1]);
hold on;
x1fit = min(validData(:,3))/100:0.5:max(validData(:,3))/100;
YFIT = b(1) + b(2)*x1fit
plot(x1fit,YFIT,'r','linewidth',2)

%--------------For group 1

% X = [ones(size(nonDecreaseData,1),1) nonDecreaseData(:,1)/100];
% y=nonDecreaseData(:,2)/100;
% [b,bint,r,rint,stats]=regress(y,X)
% figure;scatter(nonDecreaseData(:,1)/100,y,'filled')
% xlabel('Phone');
% ylabel('phone+wrist');
% title('Group 1: NonDecreasing');
% hold on;
% x1fit = min(nonDecreaseData(:,1))/100:0.5:max(nonDecreaseData(:,1))/100;
% YFIT = b(1) + b(2)*x1fit
% plot(x1fit,YFIT,'r','linewidth',2)
%
% %linear regression test
% X = [ones(size(nonDecreaseData,1),1) nonDecreaseData(:,2)/100];
% y=nonDecreaseData(:,3)/100;
% [b,bint,r,rint,stats]=regress(y,X)
% figure;scatter(nonDecreaseData(:,2)/100,y,'filled')
% xlabel('phone+wrist');
% ylabel('phone+wrist+chest');
% title('NonDecreasing');
% hold on;
% x1fit = min(nonDecreaseData(:,2))/100:0.5:max(nonDecreaseData(:,2))/100;
% YFIT = b(1) + b(2)*x1fit
% plot(x1fit,YFIT,'r','linewidth',2)
%
% %linear regression test
% X = [ones(size(nonDecreaseData,1),1) nonDecreaseData(:,3)/100];
% y=nonDecreaseData(:,4)/100;
% [b,bint,r,rint,stats]=regress(y,X)
% figure;scatter(nonDecreaseData(:,3)/100,y,'filled')
% xlabel('phone+wrist+chest');
% ylabel('phone+wrist+chest+audio');
% title('Group 1: NonDecreasing');
% hold on;
% x1fit = min(nonDecreaseData(:,3))/100:0.5:max(nonDecreaseData(:,3))/100;
% YFIT = b(1) + b(2)*x1fit
% plot(x1fit,YFIT,'r','linewidth',2)
