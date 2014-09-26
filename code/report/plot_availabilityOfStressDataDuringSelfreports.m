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

load('C:\DataProcessingFrameworkV2\data\memphis\report\UbiCompData\stressStatusB4SmkReportWhileGood.mat');
load('C:\DataProcessingFrameworkV2\data\memphis\report\UbiCompData\stressStatusB4DrugReport_nida.mat');
load('C:\DataProcessingFrameworkV2\data\memphis\report\UbiCompData\stressStatusB4CravReport_nida.mat');
load('C:\DataProcessingFrameworkV2\data\memphis\report\UbiCompData\stressStatusB4DrnkReportWhileGood.mat');

figure;hold on;
drnk=fliplr(stressStatusB4DrnkReport(:,3:end));
plot(mean(drnk),'-o','linewidth',2)
crav=fliplr(stressStatusB4CravReport(:,3:end));
plot(mean(crav),'r-*','linewidth',2)
drug=fliplr(stressStatusB4DrugReport(:,3:end));
plot(mean(drug),'g-+','linewidth',2)
smk=fliplr(stressStatusB4SmkReport(:,3:end));
plot(mean(smk),'k-d','linewidth',2)

hold on
axis([0 8 0.4 1])
set(gca,'XTickLabel',{'0','60 min', '50 min', '40 min', '30 min', '20 min', '10 min', '5 min'})
legend('Drinking Selfreport','Craving Selfreport','Drug Selfreport','Smoking Selfreport')
legend('Orientation','horizontal');
set(gca,'fontsize',14);
xlabel('Availability of stress data before the selfreport')
ylabel('% of available stress data')
grid
title('Stress Data Availability Around Selfreports (While Good Data)');
