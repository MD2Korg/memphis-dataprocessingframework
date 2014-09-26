function saveEMA2file(pid,sid)
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
global DIR FILE
%infile = [ DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.FRMTDATA_MATNAME];
infile = [ DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.FRMTRAW_MATNAME];
load ([DIR.FORMATTEDRAW DIR.SEP infile]);

%[row col]=size(D.ema.data);
[row col]=size(R.ema.data);
a=[1,2,4,8,16,32,64,128,256,512];
fid=fopen(['C:\Users\mmrahman\Desktop\NIDA_Results\EMA\' pid '_' sid '_ema.csv'],'w');
%create header of the file

for r=1:row
    questions=0;
    for c=12:2:col
        line=[num2str(r) ','];
        line=[line num2str(questions) ',' char(R.ema.data(r,c+1))];
        if ~isempty(str2num(char(R.ema.data(r,c))))
            val=str2num(char(R.ema.data(r,c)));
            for i=1:length(a)
                if val>=a(i)
                    if bitand(a(i),val)
                        line=[line ',' num2str(i)];
                    end
                end
            end
        else
            line=[line ',' char(R.ema.data(r,c))];
        end
        fprintf(fid,'%s\n',line);
        questions=questions+1;
    end
end
fclose(fid);
