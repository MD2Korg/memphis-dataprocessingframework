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

ecgWDdurations=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\ecgdurationsWeekday.txt');
ripWDdurations=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\ripdurationsWeekDay.txt');
ripWEdurations=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\ripdurationsWeekend.txt');
ecgWEdurations=load('c:\dataProcessingFrameworkV2\data\memphis\report\goodEpisodes\ecgdurationsWeekend.txt');

nbins=150;

% [n1 xout1]=hist(ecgWDdurations,sqrt(length(ecgWDdurations)));
[n1 xout1]=hist(ecgWDdurations,nbins);
cumulativeSum1=cumsum(n1);
figure; hold on;
% plot(xout1,cumulativeSum1/length(ecgWDdurations))
plot(xout1,cumulativeSum1/length(ecgWDdurations),'-bo')

[n2 xout2]=hist(ecgWEdurations,nbins);
cumulativeSum2=cumsum(n2);
% plot(xout2,cumulativeSum2/length(ecgWEdurations),'r')
plot(xout2,cumulativeSum2/length(ecgWEdurations),'-rd')

[n3 xout3]=hist(ripWDdurations,nbins);
cumulativeSum3=cumsum(n3);
% plot(xout3,cumulativeSum3/length(ripWDdurations),'g')
plot(xout3,cumulativeSum3/length(ripWDdurations),'-g*')

[n4 xout4]=hist(ripWEdurations,nbins);
cumulativeSum4=cumsum(n4);
% plot(xout4,cumulativeSum4/length(ripWEdurations),'k')
plot(xout4,cumulativeSum4/length(ripWEdurations),'-kx')
