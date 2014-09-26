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

%sort subject in terms of acceptable/wearing ratio
subjectWiseValue=[];
for i=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,20,21,23,24]
    ind=find(acceptableVsWearingWeekly(:,1)==i);
    subjectWiseValue=[subjectWiseValue;i sum(acceptableVsWearingWeekly(ind,2))];
end
sortedVal=sortrows(subjectWiseValue,2);
%after sorting, we visually seen that P11, P23 has lower ratio, discard
%them for next step of learning effect analysis. They were not good learner

week1=[];
week2=[];
week3=[];
week4=[];
for i=[1,2,3,4,6,7,8,9,10,12,16,17,20,21]
    ind=find(acceptableVsWearingWeekly(:,1)==i);
    week1=[week1;acceptableVsWearingWeekly(ind(1),2)];
    week2=[week2;acceptableVsWearingWeekly(ind(2),2)];
    week3=[week3;acceptableVsWearingWeekly(ind(3),2)];
    week4=[week4;acceptableVsWearingWeekly(ind(4),2)];
end

figure;bar([mean(week1) mean(week2) mean(week3) mean(week4)]);
hold on;
errorbar([0.789 0.843 0.852 0.869],[std(week1) std(week2) std(week3) std(week4)],'r.','LineWidth',2);
errorbar([mean(week1) mean(week2) mean(week3) mean(week4)],[std(week1) std(week2) std(week3) std(week4)],'r.','LineWidth',2);
