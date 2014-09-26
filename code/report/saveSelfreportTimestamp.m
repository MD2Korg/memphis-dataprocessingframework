function saveSelfreportTimestamp(G,pid,sid)%,selfReportID)
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
% DST2012start=1331452798000; %should come from config file
infile = [ pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
load ([G.DIR.DATA G.DIR.SEP 'formatteddata' G.DIR.SEP infile]);
% if selfReportID==2
    fid1=fopen('C:\DataProcessingFramework\data\nida\report\selfreports\NIDA_SmokingSelfreport.csv','a'); %should come from config file
%     filename='C:\DataProcessingFramework\data\nida\report\NIDA_SmokingSelfreport1.csv';
% end
% if selfReportID==3
    fid2=fopen('C:\DataProcessingFramework\data\nida\report\selfreports\NIDA_CravingSelfreport.csv','a'); %should come from config file
%     filename='C:\DataProcessingFramework\data\nida\report\NIDA_CravingSelfreport1.csv';
% end
%fprintf(fid,'%s\n','participant,weekday,date,time');
% lines=[];
if isfield(D, 'selfreport') && isfield(D.selfreport{2},'timestamp')
    for i=1:length(D.selfreport{2}.timestamp)
%         if D.selfreport{selfReportID}.timestamp<DST2012start
%             TIME.TIMEZONE = -5;
%         else
%             TIME.TIMEZONE = -4;
%         end
%         dateTime=convert_timestamp_time(G, D.selfreport{selfReportID}.timestamp(i));
%         [n day]=weekday(dateTime);
%         line=[pid ',' day ',' dateTime(1:10) ',' dateTime(12:end)];
        line1=[pid(2:end) ',' sid(2:end) ',' num2str(D.selfreport{2}.timestamp(i))];
        fprintf(fid1,'%s\n',line1);
    end
end
fclose(fid1);

if isfield(D, 'selfreport') && isfield(D.selfreport{3},'timestamp')
    for i=1:length(D.selfreport{3}.timestamp)
%         if D.selfreport{selfReportID}.timestamp<DST2012start
%             TIME.TIMEZONE = -5;
%         else
%             TIME.TIMEZONE = -4;
%         end
%         dateTime=convert_timestamp_time(G, D.selfreport{selfReportID}.timestamp(i));
%         [n day]=weekday(dateTime);
%         line=[pid ',' day ',' dateTime(1:10) ',' dateTime(12:end)];
        line2=[pid(2:end) ',' sid(2:end) ',' num2str(D.selfreport{3}.timestamp(i))];
        fprintf(fid2,'%s\n',line2);
    end
end
fclose(fid2);
% dlmwrite(filename,lines);
end

%run and test the code
