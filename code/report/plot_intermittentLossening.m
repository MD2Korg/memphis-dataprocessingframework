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

intermittent_ecg=load('c:\dataProcessingFramework\data\nida\report\goodEpisodes\episodes45participants\episodes_intermittentBad_ecg_nida.csv');
ind=find((intermittent_ecg(:,4)-intermittent_ecg(:,3))/1000/60<60);  %only consider the intermittent loosening that are less than one hour. More than one hour is very infrequent
intermittent_loosening=intermittent_ecg(ind,:);
[r c]=size(intermittent_loosening);
hourlyFreq=zeros(24,1);
hourlyDur=zeros(24,1);
hourlyDurArray=[];
dayCountTrack=[0 0 0];  %[participant day hour]
dayCount=zeros(24,1);
for i=1:r
    i
    timestamp=intermittent_loosening(i,3);
    p=intermittent_loosening(i,1);
    d=intermittent_loosening(i,2);
    timestampM = convert_timestamp_matlabtimestamp(G, timestamp);
    dateVec = datevec(timestampM);
    elapsedSecond = dateVec(4)*60*60 + dateVec(5)*60 + dateVec(6);
    hr=ceil(elapsedSecond/3600);
    hourlyFreq(hr)=hourlyFreq(hr)+1;
    dur=(intermittent_loosening(i,4)-intermittent_loosening(i,3))/1000/60;
    hourlyDur(hr)=hourlyDur(hr)+dur;
    %     hourlyDurArray.participant(p).day(d).hour(hr)=[hourlyDurArray.participant(p).day(d).hour(hr) dur];
    %     hourlyDurArray(hr).hour=[hourlyDurArray(hr).hour dur];
    %save [participant day hour] once to an array to
    ind=find(dayCountTrack(:,1)==p & dayCountTrack(:,2)==d & dayCountTrack(:,3)== hr);
    if isempty(ind)
        dayCount(hr)=dayCount(hr)+1;
        dayCountTrack=[dayCountTrack; p d hr];
    end
end

% figure;plot(hourlyFreq,'*')

relativeFreq=hourlyFreq./dayCount;

% length(relativeFreq)
% figure;plot(relativeFreq)
figure;plot(relativeFreq,'*')
lsline
% figure;plot(relativeFreq(5:18),'*')
% lsline
figure;plot(relativeFreq,'*')
hold on;
avgDur=hourlyDur./hourlyFreq;

plot(avgDur,'r-+')
avgDur=60*avgDur;

figure;plot(relativeFreq,'*')
hold on;
plot(avgDur,'r-+')
set(gca,'XTick',1:24)
grid
corr(relativeFreq)
hourOfDay=1:24;

% [r,p] = corrcoef(relativeFreq)
[r,p] = corrcoef(relativeFreq,hourOfDay)
figure;plot(relativeFreq,'*')
set(gca,'XTick',1:24)
grid
hourOfDay=4:21;
[r,p] = corrcoef(relativeFreq(4:21),hourOfDay)
[r,p] = corr(relativeFreq(4:21),hourOfDay)
corr(relativeFreq(4:21),hourOfDay)
[r,p] = corrcoef(hourOfDay,relativeFreq(4:21))
[r,p] = corr(hourOfDay,relativeFreq(4:21))
length(hourOfDay)
length(relativeFreq(4:21))
size(relativeFreq(4:21))
size(hourOfDay)
[r,p] = corr(hourOfDay',relativeFreq(4:21))
hourOfDay=1:24;
[r,p] = corr(hourOfDay',relativeFreq)
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),avgDur(i),'r','filled');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),10*avgDur(i),'r','filled');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),10*avgDur(i),'r');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),avgDur(i)*avgDur(i),'r');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),100*avgDur(i),'r');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),50*avgDur(i),'r');
end
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
lsline
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
hold on;
line([4,20],[relativeFreq(4),relativeFreq(20)],'size',3)
line([4,20],[relativeFreq(4),relativeFreq(20)],'linewidth',3)
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
set(gca,'XTick',1:24)
hold on;
line([4,21],[relativeFreq(4)+1,relativeFreq(21)],'linewidth',3)
text(14,14,'r=0.80,p<0.001','BackgroundColor',[.7 .9 .7])
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
set(gca,'XTick',1:24)
hold on;
line([4,21],[relativeFreq(4)+1,relativeFreq(21)],'linewidth',3)
text(14,14,'r=0.80,p<0.001','BackgroundColor',[.7 .9 .7],'fontSize',16,'edgeColor','blue')
figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
set(gca,'XTick',1:24)
hold on;
line([4,21],[relativeFreq(4)+1,relativeFreq(21)],'linewidth',3)
text(14,16,'r = 0.80, p < 0.001','BackgroundColor',[.7 .9 .7],'fontSize',20,'edgeColor','blue')

figure;
hold on
for i=1:24
    scatter(hourOfDay(i),relativeFreq(i),25*avgDur(i),'r');
end
set(gca,'XTick',1:24)
hold on;
line([4,21],[relativeFreq(4)+1,relativeFreq(21)],'linewidth',3)
text(13,15,'r = 0.80, p < 0.001','BackgroundColor',[.7 .9 .7],'fontSize',20,'edgeColor','blue')
xlabel('Hour of Day')
ylabel('Intermittent Loosening Frequency')
ylabel('Intermittent Loosening Frequency (ECG)')
