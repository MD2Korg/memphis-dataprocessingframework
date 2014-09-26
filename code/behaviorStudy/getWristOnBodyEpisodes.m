%It receives wrist accelerometer-X data, and computes phone carry episodes
%wristOnBodyEpisodes: [subjectID, day, starttime, endtime, 1=on-Body/0=off-body]

function [wristOnEpisodes wristOnBodyEpisodes wristOffBodyEpisodes wristOnDur wristOnBodyDur wristOffBodyDur]=getWristOnBodyEpisodes(G, subject, day, timestamp,sample)
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
wristOnBodyEpisodes=[];
wristOffBodyEpisodes=[];
wristOnDur=0;
wristOnBodyDur=0;
wristOffBodyDur=0;
windowSize=2*60000;  %2 minutes window
wristOnBodyVal=zeros(1,length(timestamp(1):windowSize:timestamp(end)));
wristOnBodyTimestamp=-1*ones(1,length(timestamp(1):windowSize:timestamp(end)));
i=1;
for t=timestamp(1):windowSize:timestamp(end)
    ind=find(timestamp>=t & timestamp<=t+windowSize);
    if std(sample(ind))>1.6  %threshold for wrist on body
        wristOnBodyVal(i)=1;
    end
    wristOnBodyTimestamp(i)=t;
    i=i+1;
end
figure;hold on;
  ylim([-2 2]);

wristOnEpisodes=getEpisodesFromTimestamps(timestamp,10);   %return phone on episodes from the timestamps
r=size(wristOnEpisodes,1);
for i=1:r
    wristOnDur=wristOnDur+(wristOnEpisodes(i,2)-wristOnEpisodes(i,1))/1000/60;
    plot_signal([convert_timestamp_matlabtimestamp(G,wristOnEpisodes(i,1)) convert_timestamp_matlabtimestamp(G,wristOnEpisodes(i,2))],[-0.5 -0.5 ],'k-',4);
end
wristOnEpisodes=[subject*ones(r,1) day*ones(r,1) wristOnEpisodes];

wristOnBody.value=[];
wristOnBody.starttime=[];
wristOnBody.endtime=[];

% episodes=getEpisodesFromTimestamps(wristOnBodyTimestamp,windowSize);
%merge for each episodes
now=0;
for p=1:size(wristOnEpisodes,1)             %find phone carry episodes under phone ON episodes.
    inde=find(wristOnBodyTimestamp>=wristOnEpisodes(p,3) & wristOnBodyTimestamp<=wristOnEpisodes(p,4));
    len=length(inde);
    for i=1:len
        if i==1 || wristOnBodyVal(inde(i)-1)~=wristOnBodyVal(inde(i))
            now=now+1;
            wristOnBody.starttime(now)=wristOnBodyTimestamp(inde(i));
            wristOnBody.value(now)=wristOnBodyVal(inde(i));
        end
        wristOnBody.endtime(now)=wristOnBodyTimestamp(inde(i))+windowSize;
    end
end

for i=1:length(wristOnBody.value)
    %plot each episodes
    if wristOnBody.value(i)==1
        plot_signal([convert_timestamp_matlabtimestamp(G,wristOnBody.starttime(i)) convert_timestamp_matlabtimestamp(G,wristOnBody.endtime(i))],[wristOnBody.value(i) wristOnBody.value(i)],'g-',4);
        wristOnBodyEpisodes=[wristOnBodyEpisodes;subject day wristOnBody.starttime(i) wristOnBody.endtime(i)];
        wristOnBodyDur=wristOnBodyDur+(wristOnBody.endtime(i)-wristOnBody.starttime(i))/1000/60;
    else
        plot_signal([convert_timestamp_matlabtimestamp(G,wristOnBody.starttime(i)) convert_timestamp_matlabtimestamp(G,wristOnBody.endtime(i))],[wristOnBody.value(i) wristOnBody.value(i)],'r-',4);
        wristOffBodyEpisodes=[wristOffBodyEpisodes;subject day wristOnBody.starttime(i) wristOnBody.endtime(i)];
        wristOffBodyDur=wristOffBodyDur+(wristOnBody.endtime(i)-wristOnBody.starttime(i))/1000/60;
    end
end
end
