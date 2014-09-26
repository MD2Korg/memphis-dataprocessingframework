%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This Matlab script parses an ITS file to obtain
%%% start and stop times for each CHN utterance.  The input is
%%% the name of a directory containing ITS files, and
%%% the output is a local matrix variable for each ITS file
%%% where each line is an utterance, and the 2 columns are start
%%% and stop times, respectively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mark VanDam, mark.vandam@boystown.org, 23 August 2010
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
        tCHN = [];
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
            if strfind(kLine, 'spkr="CHN"') % only look for CHN lines
                %%% get the number of utterances within segment
                uttCntIndx = regexpi(kLine, 'childUttCnt="', 'end');
                uttCnt = str2num(kLine(uttCntIndx+1));
                for m = 1:uttCnt
                    %%% get startUtt time
                    eval(['n1 = ''startUtt' num2str(m) '="PT'';']);
                    eval(['n2 = ''S" endUtt' num2str(m) ''';' ]);
                    i1 = regexp(kLine, n1, 'end') + 1;
                    i2 = regexp(kLine, n2) - 1;
                    tStartUtt = kLine(i1:i2);
                    %%% get endUtt time
                    eval(['n3 = ''endUtt' num2str(m) '="PT'';']);
                    i3 = regexp(kLine, n3, 'end') + 1;
                    n4 = regexp(kLine(i3:end),'S" ');
                    i4 = i3 + (n4(1)-2);
                    tEndUtt = kLine(i3:i4);
                    %%% store Utt start and stop times to array
                    tCHN = [tCHN; str2num(tStartUtt) str2num(tEndUtt)];
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %%  do some analysis here  %%
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                end
            end
        end
        clear matByLine % clean up a big variable to free memory space
        %%% write variable for each file, "tUtt_[fname]"
        eval(['tUtt_' fname(1:length(fname)-4) '=tCHN;']);
    end
end
cd(startDir); % go back to starting directory
disp(' ');
disp('Done.');
who tUtt_*
