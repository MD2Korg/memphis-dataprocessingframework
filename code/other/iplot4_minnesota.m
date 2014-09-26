function iplot4_minnesota(G, participant,session, slist)
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
    
    %color={'r-','g-','b-','y-','m-','c-','w-', 'k-',   'r-','g-','b-','y-','m-','c-','w-', 'k-'};
    color={'r-','g-','b-','m-','c-', 'k-',   'r-','g-','b-','m-','c-', 'k-',   'r-','g-','b-','m-','c-', 'k-',   'r-','g-','b-','m-','c-', 'k-'};

    INDIR = 'formatteddata';
	pid = ['p' num2str(participant','%02d')];
	sid = ['s' num2str(session','%02d')];
	indir=[G.DIR.DATA G.DIR.SEP INDIR];
	infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
	if exist([indir G.DIR.SEP infile],'file')~=2,return;end
	load([indir G.DIR.SEP infile]);

    for s=slist
        maxS = max(D.sensor{s}.sample);
        minS = min(D.sensor{s}.sample);
        D.sensor{s}.sampleNorm = (D.sensor{s}.sample-minS)/(maxS-minS);%Scaling from 0 to 1
    end

    figure;

	yMax=0;
	for s=slist
		yMax=yMax+max(D.sensor{s}.sampleNorm);
    end


    offset=yMax;
    i=0;
    h=[];
    for s=slist
        hold on;
        offset=offset-max(D.sensor{s}.sampleNorm);
        if length(D.sensor{s}.matlabtime)==0
            continue;
        end
        h(i+1)=plot_signal(D.sensor{s}.matlabtime,D.sensor{s}.sampleNorm,color{rem(i,length(color)+1)+1},1,offset);
        legend_text{i+1}=D.sensor{s}.NAME;
        i=i+1;
	end

	legend(h,legend_text,'Interpreter', 'none');
    xlabel('Time');
    ylabel('Magnitude');


	list_selfreport=G.RUN.FRMTRAW.SELFREPORTLIST;
    for s=list_selfreport
        hold on;
        for i=1:length(D.selfreport{s}.matlabtime)
            hold on;
            plot([D.selfreport{s}.matlabtime(i),D.selfreport{s}.matlabtime(i)],ylim,'r-','LineWidth',2);
            hold on;
            text(D.selfreport{s}.matlabtime(i), 0  , [D.selfreport{s}.NAME ' : ' int2str(i)], 'Color', 'k','FontSize',18,'Rotation',90);
        end
    end

    %plot_ema(G,pid,'s01','formattedraw_lab',22);
    tableList = G.RUN.EMA_METADATA_TABLE_LIST;
    emaType = {'EMA Default', 'EMA_Saliva'};

    for e=1:length(tableList)
        for i=1:size(D.ema{e}.data,1)
            hold on;
            %if str2num(char(D.ema{e}.data(i,3)))==context
                starttimestamp=D.ema{e}.data(i).starttimesstamp;
                emaStart=starttimestamp;
                plot([convert_timestamp_matlabtimestamp(G,emaStart),convert_timestamp_matlabtimestamp(G,emaStart)],ylim,'k-','LineWidth',2);
                hold on;
                text(convert_timestamp_matlabtimestamp(G,emaStart), 0  , emaType{i}, 'Color', 'k','FontSize',18,'Rotation',90);
            %end
        end
    end

end
