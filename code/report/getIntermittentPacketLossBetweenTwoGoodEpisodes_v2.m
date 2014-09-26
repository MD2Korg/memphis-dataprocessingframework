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

%this script calculates packet loss from through wireless channel when
%the sensor is not wirelessly disconnected from the phone

%for each bad/intermittent episodes, if there is no data in the whole
%episode, and the episode is not due to the wireless disconnection, then
%this loss is characterized as packet loss through the wireless channel

%this version also return the episodes too
function [burstPacketLossDur_rip packetLossEpisodes_rip burstPacketLossDur_ecg packetLossEpisodes_ecg]=getIntermittentPacketLossBetweenTwoGoodEpisodes_v2(pid,sid)
packetLossEpisodes_rip=[];
packetLossEpisodes_ecg=[];

%save the packet loss episodes into a file for both ecg and rip
% fp1=fopen('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_packetLoss_ecg.csv','a');
% fp2=fopen('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_packetLoss_rip.csv','a');

burstPacketLossDur_rip=[];
burstPacketLossDur_ecg=[];
participant=str2num(pid(2:end));day=str2num(sid(2:end));

rip_episodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_rip_minusDropout.csv');
ecg_episodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_ecg_minusDropout.csv');
wearingEpisodes=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\episodes_wearing_minusDropout.csv');
load(['C:\DataProcessingFramework\data\nida\formattedraw\' strcat('p',num2str(participant,'%02d')) '_' strcat('s',num2str(day,'%02d')) '_frmtraw.mat'])
% connDisconnMatrix=load('c:\dataProcessingFrameworkV2\data\memphis\report\disconnConnTimestampsAll.mat');
connDisconnMatrix=load('C:\DataProcessingFramework\data\nida\report\goodEpisodes\Episodes45participants\wirelessDisconnConnTimestamps.csv');

% connDisconnMatrix.connDisconnAll

indw=find(wearingEpisodes(:,1)==participant & wearingEpisodes(:,2)==day);
wearingOfTheDay=wearingEpisodes(indw,:);

ind=find(rip_episodes(:,1)==participant & rip_episodes(:,2)==day);
ripEpisodesOfTheDay=rip_episodes(ind,:);
ind2=find(ecg_episodes(:,1)==participant & ecg_episodes(:,2)==day);
ecgEpidosdesOfTheDay=ecg_episodes(ind2,:);

% indd=find(connDisconnMatrix.connDisconnAll(:,1)==participant & connDisconnMatrix.connDisconnAll(:,2)==day);
% disconnOfTheDay=connDisconnMatrix.connDisconnAll(indd,3);  %take all wireless disconnection timestamps

indd=find(connDisconnMatrix(:,1)==participant & connDisconnMatrix(:,2)==day);
disconnOfTheDay=connDisconnMatrix(indd,3);  %take all wireless disconnection timestamps

[r1 c1]=size(wearingOfTheDay);
for i=1:r1
    startTime=wearingOfTheDay(i,3)-3000;
    endTime=wearingOfTheDay(i,4)+3000;

    %for rip
    ind3=find(ripEpisodesOfTheDay(:,3)>startTime & ripEpisodesOfTheDay(:,4)<=endTime);
    for j=1:length(ind3)-1
        value=isWirelessDisconn(disconnOfTheDay,ripEpisodesOfTheDay(ind3(j),4));   %check whether the wireless disconnection is in a close vicinity of the bad start
        if value==1
            continue;
        end
        nSamples=length(find(R.sensor{1}.timestamp>=ripEpisodesOfTheDay(ind3(j),4) & R.sensor{1}.timestamp<=ripEpisodesOfTheDay(ind3(j+1),3)));
        badDur=(ripEpisodesOfTheDay(ind3(j+1),3)-ripEpisodesOfTheDay(ind3(j),4))/1000;
        expectedSamples=badDur*21.33;
        if abs(expectedSamples-nSamples)/expectedSamples> 0.9    %90% of the samples are missing on that bad episodes, then this bad is due to packet loss
            burstPacketLossDur_rip=[burstPacketLossDur_rip; participant day ripEpisodesOfTheDay(ind3(j),4) badDur];
            packetLossEpisodes_rip=[packetLossEpisodes_rip;participant day ripEpisodesOfTheDay(ind3(j),4) ripEpisodesOfTheDay(ind3(j+1),3)];
        end
    end
    %for ecg
    ind4=find(ecgEpidosdesOfTheDay(:,3)>startTime & ecgEpidosdesOfTheDay(:,4)<=endTime);
    for j=1:length(ind4)-1
        value=isWirelessDisconn(disconnOfTheDay,ecgEpidosdesOfTheDay(ind4(j),4));   %chech whether the wireless disconnection is in a close vicinity of the bad start
        if value==1
            continue;
        end
        nSamples=length(find(R.sensor{2}.timestamp>=ecgEpidosdesOfTheDay(ind4(j),4) & R.sensor{2}.timestamp<=ecgEpidosdesOfTheDay(ind4(j+1),3)));
        badDur=(ecgEpidosdesOfTheDay(ind4(j+1),3)-ecgEpidosdesOfTheDay(ind4(j),4))/1000;
        expectedSamples=badDur*64;
        if abs(expectedSamples-nSamples)/expectedSamples> 0.9    %90% of the samples are missing on that bad episodes, then this bad is due to packet loss
            burstPacketLossDur_ecg=[burstPacketLossDur_ecg; participant day ecgEpidosdesOfTheDay(ind4(j),4) badDur];
            packetLossEpisodes_ecg=[packetLossEpisodes_ecg; participant day ecgEpidosdesOfTheDay(ind4(j),4) ecgEpidosdesOfTheDay(ind4(j+1),3)];
        end
    end
end
end

function [value]=isWirelessDisconn(disconnOfTheDay,timestamp)
value=0;

ind=find(disconnOfTheDay>timestamp);
if length(ind)>0
    timeDiff=(disconnOfTheDay(ind(1))-timestamp)/1000;  %difference is in seconds
    if timeDiff<=1    %within close vicinity of the wireless disconnection
        value=1;
        return
    end
end
ind1=find(disconnOfTheDay<timestamp);
if length(ind1)>0
    timeDiff=(timestamp-disconnOfTheDay(ind1(end)))/1000;  %difference is in seconds
    if timeDiff<=1    %within close vicinity of the wireless disconnection
        value=1;
        return
    end
end
end
