function ema_report_from_frmtdata_nida(G,indir,outdir,PS_LIST)
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

load('C:\StudyData\NIDA\NIDA_EMA_QuestionnaireWithPossibleAnsweres.mat');

dates=datestr(date,'yyyymmddTHHMMSS');

OUTDIR=[G.DIR.DATA G.DIR.SEP outdir];
mkdir(OUTDIR);
fid=fopen([OUTDIR G.DIR.SEP 'ema_report_' G.STUDYNAME '_' dates(1:8) '.csv'],'w');
%create header of the file
header='subject number,Date,Time,Weekday,Context,Delay Duration';
nQ=length(EMAQuestionnaire.question);
for i=1:nQ
    header=[header ',' EMAQuestionnaire.question(i).text];
end
header='subject,session,date,time,day,wearTime,respMissRate,ecgMissRate,smokingSelfRep,cravingSelfRep,EMAtriggered,EMAanswered';
fprintf(fid,'%s\n',header);

pno=size(PS_LIST);
for p=1:pno
	pid=char(PS_LIST{p,1});
	slist=PS_LIST{p,2};
	for s=slist
		sid=char(s);
        [datee,day,totalWearingTime_hr,rip_missingRate,ecg_missingRate,smokingSelfRep,cravingSelfRep,drinkingSelfRep,numOfEMA_trigger,numOfEMA_answer]=short_report_on_each_day(G,pid,sid,indir);
        line=[pid ',' sid ',' datee ',' day ',' num2str(totalWearingTime_hr) ',' num2str(rip_missingRate) ',' num2str(ecg_missingRate) ',' num2str(smokingSelfRep) ',' num2str(cravingSelfRep) ',' num2str(numOfEMA_trigger) ',' num2str(numOfEMA_answer)];
        fprintf(fid,'%s\n',line);
    end
end
fclose(fid);
