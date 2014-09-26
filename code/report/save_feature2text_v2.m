function save_feature2text_v2(G,pid,sid)
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

infile = [G.DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_drug60_' G.FILE.FEATURE_MATNAME];
load ([G.DIR.FEATURE G.DIR.SEP infile]);

% header='subject number,Date,Time,Weekday,Activity';
 nF=length(F.sensor(2).FEATURENAME);
% for i=1:nF
%     header=[header ',' char(F.sensor(2).FEATURENAME(i))];
% end

filename='ecg_20130228'

name=['C:\DataProcessingFramework\data\nida\report\features_' filename '.csv'];
fid=fopen(name,'a');
% fprintf(fid,'%s\n',header);
for i=1:min(length(F.sensor(2).window),length(F.sensor(3).window))
    if isfield(F.sensor(2).window,'starttimestamp')
        time=convert_timestamp_time(F.sensor(2).window(i).starttimestamp);
        if ~isempty(time)
            line=[pid ','];
            [n s]=weekday(time);
            line=[line time(1:10) ',' time(12:17) '00' ',' s ];
            val='';
            if isfield(F.sensor(3).window,'feature')
                if ~isempty(F.sensor(3).window(i).feature)
                    if F.sensor(3).window(i).feature(30)>6.5
                        val='Yes';
                    else
                        val='No';
                    end
                end
            end
            line=[line ',' val];
            if isfield(F.sensor(2).window,'feature')
                for f=1:nF
                    if ~isempty(F.sensor(2).window(i).feature)
                        line=[line ',' num2str(F.sensor(2).window(i).feature{f})];
                    end
                end
                fprintf(fid,'%s\n',line);
            end
        end
    end
end
fclose(fid);
