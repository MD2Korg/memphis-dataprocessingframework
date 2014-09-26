function report_selfreport_all(G,INDIR,OUTDIR,PS_LIST,selfreportid)
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

outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
if isempty(dir(outdir))
    mkdir(outdir);
end
fid=fopen([outdir G.DIR.SEP G.STUDYNAME '_selfreport_' G.SELFREPORT.ID(selfreportid).NAME '.csv'],'w');
header='subject,session,date,time,timestamp';

fprintf(fid,'%s\n',header);

pno=size(PS_LIST);
for p=1:pno
    pid=char(PS_LIST{p,1});
    slist=PS_LIST{p,2};
    for s=slist
        sid=char(s);
        data=findfile_pid_sid_dir(G,pid,sid,INDIR);
        timestamp=data.selfreport{selfreportid}.timestamp;
        if isempty(timestamp), continue;end;
        timestr=convert_timestamp_time(G,timestamp);
        for i=1:length(timestamp)
            line=[pid ',',sid,',',strrep(timestr(i,:),' ',','),',',num2str(timestamp(i))];
            fprintf(fid,'%s\n',line);
        end

    end
end
fclose(fid);
