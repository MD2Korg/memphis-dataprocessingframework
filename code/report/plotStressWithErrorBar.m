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

%calculate meanStressProb, and overallMean, and standard deviation using
%stress_level_before_[drug/smoke/craving]_[nida/memphis].m

figure;hold on;
h=bar([meanStressProb(21:30) overallMean],'LineWidth',3);
hp = findobj(h,'type','patch');
hatchfill(hp);
set(gca,'fontsize',14)
set(gca,'YLim',[0 0.65])
xlabel('Stress Level Before Drinking (Student)','fontsize',26)
ylabel('Probability of Stess','fontsize',26)
set(gca,'XTick',1:11)
set(gca,'XTickLabel',{'10th', '9th', '8th', '7th', '6th','5th','4th','3rd','2nd','1st','overall'})
errorbar([meanStressProb(21:30) overallMean],[nanSd(21:30) overallSd],'r.','LineWidth',3)
box
