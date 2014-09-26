function save_feature2text_rip_ecg_memphis(G,pid,sid,INDIR,OUTDIR)
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
%create header of the file
%global FILE DIR SENSOR

% infile = [G.DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_stress60_' G.FILE.FEATURE_MATNAME];
% load ([G.DIR.FEATURE G.DIR.SEP infile]);

% indir=[G.DIR.DATA G.DIR.SEP INDIR];
indir=INDIR;
% infile=[pid '_' sid '_stress60_' G.FILE.FEATAURE_MATNAME];
% infile=['field_' pid '_' sid '_drug60_feature'];
infile=['field_' pid '_' sid '_stress60_feature'];
outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
% outfile=[G.RUN.MODEL.STUDYTYPE '_' pid '_' sid '_' G.RUN.MODEL.NAME '_' G.FILE.WINDOW_MATNAME];
load ([indir G.DIR.SEP infile]);
% header='subject number,Date,Time,Weekday,Activity';
 %nF=length(F.sensor(2).FEATURENAME);
 nF=12;
% for i=1:nF
%     header=[header ',' char(F.sensor(2).FEATURENAME(i))];
% end

% filename='ecg_features_20130405'
% filename='rip_20130801_f22_f41';
% filename='ecg_rip_p01_p21_final';
% filename=['features_activity_selfreport_' pid];
filename=['features_activity_selfreport_stress_physiology'];

% name=['C:\DataProcessingFramework\data\nida\report\features_' filename '.csv'];
name=[outdir  G.DIR.SEP 'features_' filename '.csv'];
fid=fopen(name,'a');
% fprintf(fid,'%s\n',header);

for i=1:length(F.window)
    i
    %if isfield(F.window,'starttimestamp')
    noEcgRip=0;
     if F.window(i).feature{G.FEATURE.R_RIPID}.quality==0 || F.window(i).feature{G.FEATURE.R_ECGID}.quality==0
        time=convert_timestamp_time(G,F.window(i).starttimestamp);
        if ~isempty(time)
            line=[pid ','];
            [n s]=weekday(convert_timestamp_matlabtimestamp(G,F.window(i).starttimestamp));
            line=[line num2str(F.window(i).starttimestamp) ',' time(1:10) ',' time(12:17) '00' ',' s ];
            val='';
%             if isfield(F.window(i).feature{G.FEATURE.R_ACLID},'value')
%                 if ~isempty(F.window(i).feature{4}.value)
%                     if F.window(i).feature{4}.value{30}>0.21384
%                         val='Yes';
%                     else
%                         val='No';
%                     end
%                 end
%             end

%             line=[line ',' val];
            activity=0;
            [stressVal stressProbability admissionControl]=isStressed(pid,F.window(i).starttimestamp,F.window(i).endtimestamp);
            activity=admissionControl;
            if stressVal==-1
                activity=isActive(pid,F.window(i).starttimestamp,F.window(i).endtimestamp);
            end
            %check the self-report within the window time
            line=[line ',' num2str(stressVal) ',' num2str(stressProbability) ',' num2str(activity)];
            val='';
            isSelfReport=isSelfreportInBetween(F,F.window(i).starttimestamp,F.window(i).endtimestamp,G.SELFREPORT.SMKID);  %smoking self-report
            if isSelfReport==1
                val='Yes';
            else
                val='No';
            end
            line=[line ',' val];

            val='';
            isSelfReport=isSelfreportInBetween(F,F.window(i).starttimestamp,F.window(i).endtimestamp,G.SELFREPORT.CRVID);  %craving self-report
            if isSelfReport==1
                val='Yes';
            else
                val='No';
            end
            line=[line ',' val];

            val='';
            if isfield(F.window(i).feature{2},'value')
%                 if F.window(i).feature{2}.value{nF}>500
%                     disp('invalid heart rate')
%                 end
                for f=2:nF
                    if ~isempty(F.window(i).feature) && ~isempty(F.window(i).feature{2}.value{1})
                        line=[line ',' num2str(F.window(i).feature{2}.value{f})];
                    end
                end
            else
                noEcgRip=noEcgRip+1;
                for f=2:nF
                    line=[line ',' val];
                end
            end

            val='';
            featureSet=[22:41];  %id of respiration features to consider
            if isfield(F.window(i).feature{G.FEATURE.R_RIPID},'value')
                for f=featureSet
                    if ~isempty(F.window(i).feature) && ~isempty(F.window(i).feature{G.FEATURE.R_RIPID}.value)
                        line=[line ',' num2str(F.window(i).feature{G.FEATURE.R_RIPID}.value{f})];
                    end
                end
%                 fprintf(fid,'%s\n',line);
            else
                noEcgRip=noEcgRip+1;
                for k=1:length(featureSet)
                    line=[line ',' val];
                end
            end
            if noEcgRip~=2
                fprintf(fid,'%s\n',line);
            else
                noEcgRip
            end
        end
    end
end
fclose(fid);
end

function isSelfReport=isSelfreportInBetween(F,starttime,endtime,selfreportId)
    isSelfReport=0;
    if length(F.selfreport{selfreportId}.timestamp)>0
        for j=1:length(F.selfreport{selfreportId}.timestamp)
            if F.selfreport{selfreportId}.timestamp(j)>=starttime && F.selfreport{selfreportId}.timestamp(j)<=endtime
                isSelfReport=1;
                return;
            end
        end
    end
end

function [stressVal stressProbability admissionControl]=isStressed(pid,starttimestamp,endtimestamp)
stressVal=-1;
stressProbability=-1;
admissionControl=-1;
stress=csvread(['C:\DataProcessingFramework1\data\Memphis\report\StressData\' pid(2:end) '.csv'],1,0);
ind=find(stress(:,end)>=starttimestamp & stress(:,end)<=endtimestamp);
if isempty(ind)
    return;
end
stressVal=stress(ind(end),2);
stressProbability=stress(ind(end),1);
admissionControl=stress(ind(end),3);
end

function activity=isActive(pid,starttimestamp,endtimestamp)
activity=-1;
participant=str2num(pid(2:end));
% find whether this window of time is under any activity episode
activityMatrix=csvread('C:\DataProcessingFramework1\data\Memphis\report\activityEpisodes_matrix.csv',0,0);
ind=find(activityMatrix(:,1)==participant);
activityOfTheSubject=activityMatrix(ind,:);
ind1=find(activityOfTheSubject(:,3)<=starttimestamp & activityOfTheSubject(:,4)>=endtimestamp);  %current window is entirely within an activity episode
if ~isempty(ind1)
    activity=activityOfTheSubject(ind1(1),5);
    return;
end

ind2=find(activityOfTheSubject(:,3)>=starttimestamp & activityOfTheSubject(:,4)<=endtimestamp);
activeDur=0;
for i=1:length(ind2)
    if activityOfTheSubject(ind2(i),5)==1
        activeDur=activeDur+(activityOfTheSubject(ind2(i),4)-activityOfTheSubject(ind2(i),3))/1000;
    end
end
if activeDur>0.5*(endtimestamp-starttimestamp)/1000                  %majority of the window shows activity
    activity=1;
else
    activity=0;
end
end
