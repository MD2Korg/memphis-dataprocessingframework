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

pid='p21';sid='s04';
%indir=[G.DIR.DATA G.DIR.SEP 'segment'];
infile=[pid '_' sid '_segment.mat'];
load(['C:\DataProcessingFramework_COC\data\nida\segment' G.DIR.SEP infile]);

indir=[G.DIR.DATA G.DIR.SEP 'formatteddata'];
infile=[pid '_' sid '_frmtdata.mat'];
load([indir G.DIR.SEP infile]);

figure; hold on;

plot_signal(D.sensor{2}.matlabtime_all,D.sensor{2}.sample_all,'r-',1)
plot_signal(D.sensor{2}.matlabtime,D.sensor{2}.sample,'g-',1)
plot_signal(P.acl.avg.matlabtime,P.acl.avg.t60*1000+4500,'b-',1);legend_text{3}='Activity Indicator(ACCEL)';
plot_signal([P.acl.avg.matlabtime(1),P.acl.avg.matlabtime(end)],[P.acl.avg.th60,P.acl.avg.th60]*1000+4500,'r-',2);

activityEpisodes=load('c:\dataProcessingFramework\data\nida\report\activityEpisodes\activityEpisodes_dynamicThreshold.csv');
ind=find(activityEpisodes(:,1)==21 & activityEpisodes(:,2)==4 & activityEpisodes(:,5)==0);

%{
for i=1:length(ind)
	stime=convert_timestamp_matlabtimestamp(G,activityEpisodes(ind(i),3));
	etime=convert_timestamp_matlabtimestamp(G,activityEpisodes(ind(i),4));
	plot_signal([stime,etime],[5000,5000],'g-',2);
end
%}

passed.sample=[];passed.matlabtime=[];
for i=1:length(ind)
	ind2=find(D.sensor{2}.timestamp>=activityEpisodes(ind(i),3) & D.sensor{2}.timestamp<activityEpisodes(ind(i),4));
	if ~isempty(ind2)
        passed.sample=[passed.sample D.sensor{2}.sample(ind2)];
        passed.matlabtime=[passed.matlabtime D.sensor{2}.matlabtime(ind2)];
    end
end;

plot_signal(passed.matlabtime,passed.sample+5200,'g-',1)

for i=1:length(ind)
	ind2=find(D.sensor{2}.timestamp>=activityEpisodes(ind(i),3) & D.sensor{2}.timestamp<activityEpisodes(ind(i),4));
	if ~isempty(ind2)
		passed.sample=[passed.sample D.sensor{2}.sample(ind2)];
		passed.matlabtime=[passed.matlabtime D.sensor{2}.matlabtime(ind2)];
	end
end;

for l=1:length(D.selfreport{2}.matlabtime)
    hold on;
    plot([D.selfreport{2}.matlabtime(l),D.selfreport{2}.matlabtime(l)],ylim,'k-','LineWidth',2);
    tx=['Smoking Selfreport']; % char(10) '(Actual time 80 minutes ago)'];
    text(D.selfreport{2}.matlabtime(l)+3/(60*24), 600  , tx, 'Color', 'k','FontSize',18,'Rotation',90);
end
set(gca,'fontsize',14);
xlabel('Time of Day')
