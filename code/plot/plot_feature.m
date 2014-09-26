function plot_feature(G,pid,sid,INDIR,fid,flist,MODEL)
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
color={'g.','k.','c.','y.','b.'};
indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_' G.FILE.FEATURE_MATNAME];
load([indir G.DIR.SEP infile]);
offset=0;
i=0;j=0;
h=[];
for f=flist
    hold on;
    matlabtime=[];value=[];
    i=0;
    for w=1:length(F.window)
        if F.window(w).feature{fid}.quality~=G.QUALITY.GOOD, continue;end
        if F.window(w).starttimestamp==0, continue;end;
        if F.window(w).start_matlabtime==0, continue;end;
        i=i+1;
        matlabtime(i)=F.window(w).start_matlabtime;
        value(i)=F.window(w).feature{fid}.value{f};
    end
    offset=offset-min(value);
    h(j+1)=plot_signal(matlabtime,value,color{rem(j,length(color)+1)+1},1,offset);
    legend_text{j+1}=F.FEATURE{fid}.FEATURENAME.NAME{f};
    offset=offset+max(value);
    j=j+1;
end
legend(h,legend_text,'Interpreter', 'none');
xlabel('Time');
ylabel('Magnitude');
end
