function report_sensor(G,pid,sid,INDIR,OUTDIR,list_sensor)
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

outfile=[pid '_' sid];
data=findfile_pid_sid_dir(G,pid,sid,INDIR);
for i=list_sensor
    x=[data.sensor{i}.sample;data.sensor{i}.timestamp]';
    outname=[outdir G.DIR.SEP outfile '_' INDIR '_' data.sensor{i}.NAME '.csv'];
    header={'sample','timestamp'};
    header_text=sprintf('%s,',header{:});
    header_text(end)='';
    dlmwrite(outname,header_text,'');
    dlmwrite(outname,x,'-append','precision','%.0f');
end
