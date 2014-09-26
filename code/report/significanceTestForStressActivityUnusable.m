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
%% test of mean difference between overall and other minute - paired test, wilcoxon rank sum test

%% Smoking
%Activity

activityOverallForTest=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(minuteWiseActivity(:,1)==i);
    activityOverallForTest=[activityOverallForTest;i mean(minuteWiseActivity(ind,end))];
end

activityMeanB4Smoking=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(activityStatusB4SmokingReport(:,1)==i);
    data=activityStatusB4SmokingReport(ind,3:end);
    meanActivity=[];
    for j=3:12
        temp=data(:,j);
        ind2=find(temp>=0);
        meanActivity=[meanActivity mean(temp(ind2))];
    end
    activityMeanB4Smoking=[activityMeanB4Smoking;i meanActivity];
end

x=activityOverallForTest(1:end-1,2);
y=activityMeanB4Smoking(1:end-1,2);  %ignoring P44, because of NaN value
[p h stat]=ranksum(x,y);

%usable data
usableOverallForTest=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(minuteWiseUsableStress(:,1)==i);
    usableOverallForTest=[usableOverallForTest;i mean(minuteWiseUsableStress(ind,end))];
end

usableDataMeanB4Smoking=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(stressStatusB4SmokingReport(:,1)==i);
    data=stressStatusB4SmokingReport(ind,3:end);
    meanUsable=[];
    for j=3:12
        temp=data(:,j);
        ind2=find(temp>=0);
        meanUsable=[meanUsable mean(temp(ind2))];
    end
    usableDataMeanB4Smoking=[usableDataMeanB4Smoking;i meanUsable];
end

x=usableOverallForTest(1:end-1,2);
y=usableDataMeanB4Smoking(1:end-1,2);  %ignoring P44, because of NaN value
[p h stat]=ranksum(x,y)

y=usableDataMeanB4Smoking(1:end-1,3);
[p h stat]=ranksum(x,y)

y=usableDataMeanB4Smoking(1:end-1,end);
[p h stat]=ranksum(x,y)   %test between overall vs best3/5


%% drinking

%Activity
activityOverallForTest=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(minuteWiseActivity(:,1)==i);
    activityOverallForTest=[activityOverallForTest;i mean(minuteWiseActivity(ind,end))];
end

activityMeanB4Drinking=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(activityStatusB4DrinkingReport(:,1)==i);
    data=activityStatusB4DrinkingReport(ind,3:end);
    meanActivity=[];
    for j=3:12
        temp=data(:,j);
        ind2=find(temp>=0);
        meanActivity=[meanActivity mean(temp(ind2))];
    end
    activityMeanB4Drinking=[activityMeanB4Drinking;i meanActivity];
end

ind3=find(~isnan(activityMeanB4Drinking(:,2)));

x=activityOverallForTest(ind3,2);
y=activityMeanB4Drinking(ind3,2);
[p h stat]=ranksum(x,y)

%usable data
usableOverallForTest=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(minuteWiseUsableStress(:,1)==i);
    usableOverallForTest=[usableOverallForTest;i mean(minuteWiseUsableStress(ind,end))];
end

usableDataMeanB4Drinking=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(stressStatusB4DrinkingReport(:,1)==i);
    data=stressStatusB4DrinkingReport(ind,3:end);
    meanUsable=[];
    for j=3:12
        temp=data(:,j);
        ind2=find(temp>=0);
        meanUsable=[meanUsable mean(temp(ind2))];
    end
    usableDataMeanB4Drinking=[usableDataMeanB4Drinking;i meanUsable];
end

ind3=find(~isnan(activityMeanB4Drinking(:,2)));

x=usableOverallForTest(ind3,2);
y=usableDataMeanB4Drinking(ind3,2);
[p h stat]=ranksum(x,y)

%unusable data
goodDataOverallForTest=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(minuteWiseGood(:,1)==i);
    goodDataOverallForTest=[goodDataOverallForTest;i mean(minuteWiseGood(ind,end))];
end

goodDataMeanB4Drinking=[];
for i=[12,13,14,15,16,18,19,20,21,25,27,28,29,32,33,34,35,36,37,39,40,41,42,43,44]
    ind=find(goodDataB4DrinkingReport(:,1)==i);
    data=goodDataB4DrinkingReport(ind,3:end);
    meanGood=[];
    for j=3:12
        temp=data(:,j);
        ind2=find(temp>=0);
        meanGood=[meanGood mean(temp(ind2))];
    end
    goodDataMeanB4Drinking=[goodDataMeanB4Drinking;i meanGood];
end

ind3=find(~isnan(goodDataMeanB4Drinking(:,2)));

x=goodDataOverallForTest(ind3,2);
y=goodDataMeanB4Drinking(ind3,2);
[p h stat]=ranksum(x,y)
