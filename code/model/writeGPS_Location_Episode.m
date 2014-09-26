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
plot(D.sensor{11}.timestamp,ones(length(D.sensor{11}.timestamp),1),'.')
hold on
plot(D.sensor{4}.timestamp,2*ones(length(D.sensor{4}.timestamp),1),'g.')
plot(D.sensor{14}.timestamp,1.5*ones(length(D.sensor{14}.timestamp),1),'r.')
speedInd=find(D.sensor{17}.sample>2.53);
plot(D.sensor{14}.timestamp(speedInd),1.5*ones(length(D.sensor{14}.timestamp(speedInd)),1),'k.')
legend('Phone Acc','Chest Acc','GPS','commute')
[r c]=size(stayPoint);
for i=1:r
    plot([stayPoint(i,3) stayPoint(i,4)],[1.6 1.6],'m');
end

home1=[2 3 4 5];
lats=[];
longs=[];
for i=1:home1
    lats=[lats;stayPoint(home1(i),1)];
    longs=[longs;stayPoint(home1(i),2)];
end
sp=[mean(lats) mean(longs) stayPoint(home1(1),3) stayPoint(home1(end),4)];

writeLocationEpisodes(pid, sid, stayPoint,[], 'home')
writeLocationEpisodes(pid, sid, stayPoint,[], 'univ')
writeLocationEpisodes(pid, sid, stayPoint,[5], 'store')
writeLocationEpisodes(pid, sid, stayPoint,[2], 'restaurant')
writeLocationEpisodes(pid, sid, stayPoint,[3 4 6 7], 'work')
writeLocationEpisodes(pid, sid, stayPoint,[], 'outside')
writeLocationEpisodes(pid, sid, stayPoint,[1 8], 'other')


home=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\homeEpisode.csv',1,0);
work=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\workEpisode.csv',1,0);
univ=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\univEpisode.csv',1,0);
store=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\storeEpisode.csv',1,0);
restaurant=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\restaurantEpisode.csv',1,0);
clusterNo=size(stayPoint,1);
clutsers=1:clusterNo;
ind1=find(home(:,1)==participant && home(:,2)==day);
homeInd=home(ind1,5);
ind2=find(work(:,1)==participant && work(:,2)==day);
workInd=work(ind2,5);
ind3=find(univ(:,1)==participant && univ(:,2)==day);
univInd=univ(ind3,5);
ind4=find(store(:,1)==participant && store(:,2)==day);
storeInd=store(ind4,5);
ind5=find(restaurant(:,1)==participant && restaurant(:,2)==day);
restaurantInd=restaurant(ind5,5);
nonOthers=[homeInd' workInd' univInd' storeInd' restaurantInd'];
others=setDiff(clusters,nonOthers);
writeLocationEpisodes(pid, sid, stayPoint,others, 'other');
