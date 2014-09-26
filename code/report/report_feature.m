function report_feature(G,pid,sid,INDIR,OUTDIR,featureids)
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

indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[G.RUN.MODEL.STUDYTYPE '_' pid '_' sid '_' G.RUN.MODEL.NAME '_' G.FILE.FEATURE_MATNAME];
load([indir G.DIR.SEP infile]);

outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
if isempty(dir(outdir))
    mkdir(outdir);
end
[header,value,timestamp,matlabtime]=gen_feature_array(G,F,featureids,G.RUN.REPORT.FEATURELIST);
time_string=convert_timestamp_time(G,timestamp);
name=[];
for featureid=featureids
    name=[name '_' F.FEATURE{featureid}.SENSOR];
end
outfile=[G.RUN.MODEL.STUDYTYPE '_' pid '_' sid '_' G.RUN.MODEL.NAME name '_feature.csv'];
header_text=sprintf('%s,',header{:});
header_text=['time,timestamp,' header_text];
header_text(end)='';
fid=fopen([outdir G.DIR.SEP outfile],'w');
fprintf(fid,'%s\n',header_text);
for i=1:size(value,1)
    val=[];
    for j=1:size(value,2)
        val=[val,',',value{i,j}];
    end
    time=sprintf('%s,%s',time_string(i,:),num2str(timestamp(i)));
    val=[time,val];
    fprintf(fid,'%s\n',val);
end
fclose(fid);
