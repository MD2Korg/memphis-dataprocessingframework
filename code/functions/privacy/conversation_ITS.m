%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This Matlab script parses an ITS file to obtain
%%% start and stop times for each conversation.  The input is
%%% the name of a directory containing ITS files, and
%%% the output is a local matrix variable for each ITS file
%%% where each line is an conversation, and the 3 columns are start
%%% and stop times, and duration (seconds), respectively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mark VanDam, mark.vandam@boystown.org, 23 August 2010
%%% Adapted by Md Mahbubur Rahman, mmrahman@memphis.edu, 16 May 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; % clean up the workspace
startDir = pwd;
d = input('\n\n\n\n   Enter directory where ITS files are stored: ', 's');
cd(d);
fileList = dir; % enumerate file details in this directory
for j = 3:length(fileList)
    if strcmp(fileList(j).name(end-3:end), '.its') % look for ITS files only
        fname = fileList(j).name;
        fid=fopen(fname);
        lineNo=0;
        tConv = [];
%         tConvDur = [];
        recordingStartTimeGMT=[];
        recordingStartTimeLocal=[];
        t = timeZones();  % for time conversion

        matByLine = []; % could preallocate here to make faster
        disp(['working on file ', num2str(j-2) '...']);
        while 1
            tline = fgetl(fid);
            if ~ischar(tline), break, end
            lineNo = lineNo + 1;
            matByLine(lineNo).text = tline; % read ITS file into STRUCT
        end
        fclose(fid);
        for k = 1:length(matByLine)
            kLine = matByLine(k).text; % work one line at a time
            %%%%%%% read recording start time %%%%%%%%%%
            if strfind(kLine, 'Recording num=')
%                 recordingCntIndx = regexpi(kLine, 'Recording num="', 'end');
%                 recordingCnt = str2num(kLine(recordingCntIndx+1));
                %                 for m = 1:uttCnt  startTime="PT583.11S" endTime="PT586.36S"
                %%% get startUtt time
                eval('n1 = ''startClockTime="'';');
                eval('n2 = ''Z" endClockTime="'';');
                i1 = regexp(kLine, n1, 'end') + 1;
                i2 = regexp(kLine, n2) - 1;
                recordingStartTimeGMT = kLine(i1:i2);
                recordingStartTimeGMT = strrep(recordingStartTimeGMT, 'T', ' ')
%                 recordingStartTimeGMT = '2014-04-28 01:56:25';
                %convert the GMT time to Memphis local time
                if is_Daylight_Savings(datestr(recordingStartTimeGMT,'mm-dd-yyyy HH:MM:SS'));
                    recordingStartTimeLocal=datestr(t.utc2dst(datenum(recordingStartTimeGMT), 'Memphis, TN'));
                else
                    recordingStartTimeLocal=datestr(t.utc2st(datenum(recordingStartTimeGMT), 'Memphis, TN'));
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %             if strfind(kLine, 'spkr="CHN"') % only look for CHN lines
            if strfind(kLine, 'Conversation num=') % only look for conversation lines
                %%% get the number of utterances within segment
                convCntIndx = regexpi(kLine, 'Conversation num="', 'end');
                convCnt = str2num(kLine(convCntIndx+1));
                %                 for m = 1:uttCnt  startTime="PT583.11S" endTime="PT586.36S"
                %%% get startUtt time
                eval('n1 = ''startTime="PT'';');
                eval('n2 = ''S" endTime'';');
                i1 = regexp(kLine, n1, 'end') + 1;
                i2 = regexp(kLine, n2) - 1;
                tConvStart = kLine(i1:i2);
                tConvStartTime= datestr(datenum(recordingStartTimeLocal)+str2num(tConvStart)/86400,'YYYY-mm-DD HH:MM:SS');
                %%% get endUtt time
                eval('n3 = ''endTime="PT'';');
                i3 = regexp(kLine, n3, 'end') + 1;
                n4 = regexp(kLine(i3:end),'S"');
                i4 = i3 + (n4(1)-2);
                tConvEnd = kLine(i3:i4);
                tConvEndTime= datestr(datenum(recordingStartTimeLocal)+str2num(tConvEnd)/86400,'YYYY-mm-DD HH:MM:SS');
                %%% store Utt start and stop times to array
%                 tConvDur = [tConvDur; str2num(tConvStart) str2num(tConvEnd) (str2num(tConvEnd)-str2num(tConvStart))];
                tConv = [tConv; datenum(tConvStartTime) datenum(tConvEndTime) (str2num(tConvEnd)-str2num(tConvStart))];
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%  do some analysis here  %%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %                 end
            end
        end
        clear matByLine % clean up a big variable to free memory space
        %%% write variable for each file, "tUtt_[fname]"
        eval(['tConv_' fname(1:length(fname)-4) '=tConv;']);
    end
end
cd(startDir); % go back to starting directory
disp(' ');
disp('Done.');
who tUtt_*
