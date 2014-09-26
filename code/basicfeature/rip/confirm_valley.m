function valley_index=confirm_valley(peak_ind,valley_ind,UI,DI,sample);
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
valley_index=[];

% figure;
% plot(sample,'g');hold on;
% plot(UI,sample(UI),'m^','MarkerFaceColor','m');
% plot(DI,sample(DI),'bv','MarkerFaceColor','k');
% plot(peak_ind,sample(peak_ind),'.b');
% plot(valley_ind,sample(valley_ind),'.b');
% y1=smooth(sample,3);  % Moving average filter by default n=5.
% plot(y1,'m');hold on;
% sample=y1;

%% IDEA
% We want to ensure that valley resides at the begging of inhalation cycle where slope is maximum. We search for the
% point which lies between current valley and Up intercept point of moving average
% curve(MAC) and positioned just the begining of inhalation. All skopes are
% calcuted, at first iteration, negative slpoes are eliminated from valley
% candidate array.
%%
for i=1:length(valley_ind)  %% ith valley
    %     if i==445 || i==503
    %         plot(valley_ind(i),sample(valley_ind(i)),'.b');
    %     end
    up_index=find(UI>valley_ind(i) & UI<peak_ind(i));
    if isempty(up_index)  % If current valley and UI holds same position, set this as as appropriate valley
        valley_index(i)=valley_ind(i);
        continue;
    end
    temp=sample(valley_ind(i):UI(up_index));  %% All points between current valley and UI
    slope=diff(temp);

    No_ofconsecutive_positiveSlopes=[]; %% Keep track of total number of positive slopes comes after the each slope postion
    for j=1:length(slope)-1  %% j is the Current slope
        count=0;
        if slope(j)<0;  %% This cannot be a candidate of valley as jth slope is negative indicates decreasing pattern
            No_ofconsecutive_positiveSlopes(j)=-1;
        else
            for s=j+1:length(slope)  %% s are the next availble slopes of jth slope, want to keep track of total number of +ve slopes come after the jth slope
                if slope(s)<0;
                    break;  % If any -ve slope appears, that means signal is decreasing there, thus stop the counter
                end
                count=count+1;
            end
            No_ofconsecutive_positiveSlopes(j)=count;
        end
    end

    if all(No_ofconsecutive_positiveSlopes<0)==1  %% If all slopes are negative,statement will be true (1) and equal to 1
        valley_index(i)=valley_ind(i);  % current valley is the appropriate one
    elseif length(No_ofconsecutive_positiveSlopes)==0
        valley_index(i)=valley_ind(i); % current valley is the appropriate one
    else
        ind=find(max(No_ofconsecutive_positiveSlopes)==No_ofconsecutive_positiveSlopes); %% Index points the location after which total number of positive slope is maximum
        valley_index(i)=valley_ind(i)+ind(end)-1; %% Update with new valley location
    end
    %     i
end
% plot(valley_index,sample(valley_index),'*r');
end
