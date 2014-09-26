function report_labsessions(G,pid,sid,in)
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
infile = [ pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
load ([G.DIR.DATA G.DIR.SEP in G.DIR.SEP infile]);
fid=fopen('C:\DataProcessingFramework\data\nida\report\labCues.csv','a');
for r=1:length(D.labstudy_mark.eventname)     % # of data point
    line=[pid ',' sid]; %subject number
    time=convert_timestamp_time(G,D.labstudy_mark.starttimestamp(r));
    [n s]=weekday(time);
    line=[line ',' s, ',' time(1:10) ',' time(12:19) ];
    time2=convert_timestamp_time(G,D.labstudy_mark.endtimestamp(r));
    line=[line ',' time(12:19) ',' char(D.labstudy_mark.eventname{r}) ];
    fprintf(fid,'%s\n',line);
end
fclose(fid);
end
