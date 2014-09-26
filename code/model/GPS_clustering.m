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

G=config();
G=config_run_memphis(G);
% PS_LIST=G.PS_LIST;
%
% pno=size(PS_LIST);
% for p=1:pno
%     pid1=char(PS_LIST{p,1});
%     slist=PS_LIST{p,2};
%     for s=slist
%         sid1=char(s);
%         pid=str2num(pid1(2:end));
%         sid=str2num(sid1(2:end));
pid=14;
sid=9;
        load(['C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\formatteddata\p' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '_frmtdata.mat']);
        start=1;
        endd=length(D.sensor{14}.sample);

        speed=D.sensor{17}.sample(start:endd);
        % length(D.sensor{14}.sample)
        % length(D.sensor{15}.sample)
        % length(D.sensor{16}.sample)
        % length(D.sensor{17}.sample)
        nonVehicleInd=find(speed<2.53);

        %sample every 60th samples to get it one sample over a minute
        nonVehicleIndPerMinute=nonVehicleInd(1:10:end);

        %gps=[double(D.sensor{14}.sample(nonVehicleInd)),double(D.sensor{15}.sample(nonVehicleInd)), D.sensor{16}.timestamp(nonVehicleInd)];
        % gps=[double(D.sensor{14}.sample(nonVehicleIndPerMinute)),double(D.sensor{15}.sample(nonVehicleIndPerMinute)), D.sensor{16}.timestamp(nonVehicleIndPerMinute)];
        % [class,type]=DBSCAN(gps,10,100);
        [stayPoint]=stay_point_GPS(D.sensor{14}.sample(nonVehicleIndPerMinute),D.sensor{14}.timestamp(nonVehicleIndPerMinute),D.sensor{15}.sample(nonVehicleIndPerMinute),D.sensor{15}.timestamp(nonVehicleIndPerMinute));
        % [stayPoint]=stay_point_GPS(D.sensor{14}.sample(1:13700),D.sensor{14}.timestamp(1:13700),D.sensor{15}.sample(1:13700),D.sensor{15}.timestamp(1:13700));
        % [stayPoint]=stay_point_GPS(D.sensor{14}.sample,D.sensor{14}.timestamp,D.sensor{15}.sample,D.sensor{15}.timestamp);

        %get phone ON episodes
        % phoneDiffInd=find(diff(D.sensor{11}.timestamp)/1000/60>10); %phone on ensures data from phone accelerometer
        % phoneOnEpisodes=[];
        % getPhoneONepisodes;

        %get chest sensor ON episodes
        % chestDiffInd=find(diff(D.sensor{4}.timestamp)/1000/60>10);
        % chestONepisodes=[];
        % getChestSensorONepisodes;
%
%         home=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\homeEpisode.csv',1,0);
%         work=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\workEpisode.csv',1,0);
%         univ=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\univEpisode.csv',1,0);
%         store=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\storeEpisode.csv',1,0);
%         restaurant=csvread('C:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\significantPlaceEpisodes\restaurantEpisode.csv',1,0);
%         clusterNo=size(stayPoint,1);
%         clusters=1:clusterNo;
%         ind1=find(home(:,1)==pid & home(:,2)==sid);
%         homeInd=home(ind1,5);
%         ind2=find(work(:,1)==pid & work(:,2)==sid);
%         workInd=work(ind2,5);
%         ind3=find(univ(:,1)==pid & univ(:,2)==sid);
%         univInd=univ(ind3,5);
%         ind4=find(store(:,1)==pid & store(:,2)==sid);
%         storeInd=store(ind4,5);
%         ind5=find(restaurant(:,1)==pid & restaurant(:,2)==sid);
%         restaurantInd=restaurant(ind5,5);
%         nonOthers=[homeInd' workInd' univInd' storeInd' restaurantInd'];
%         others=setDiff(clusters,nonOthers);
%         if length(others)>0
%             writeLocationEpisodes(pid, sid, stayPoint,others, 'other');
%         end

        fpKml = fopen(['c:\SignalQuality\WiseManetLab\DataProcessingFramework\data\memphis\clurstering\dbcluster_p' num2str(pid) '_' strcat('s',num2str(sid','%02d')) '.kml'],'w');
        skeletonPath = 'functions/kml/skleton_kml.txt';
        skeletonKml = getFileContent(skeletonPath);
        skeletonKmlParts = regexp(skeletonKml,'#PUT_CONTENT_HERE#', 'split');
        skeletonKmlHeader = char(skeletonKmlParts(1));
        skeletonKmlFooter = char(skeletonKmlParts(2));

        fprintf(fpKml, '%s', skeletonKmlHeader);
        [r c]=size(stayPoint);
        for i=1:r
            label=num2str(i);
            kmlGeneratePoint(fpKml, G, label, ...
                stayPoint(i,1), stayPoint(i,2), 0, stayPoint(i,1), stayPoint(i,2), stayPoint(i,3), stayPoint(i,4));
        end
        % for i=1:length(class)
        %     if class(i)==-1
        %         continue;
        %     end
        %     label = int2str(class(i));
        %     kmlGeneratePoint(fpKml, G, label, ...
        %         gps(i,1), gps(i,2), 0, speed(nonVehicleInd(i)), 0, gps(i,3), gps(i,3));
        % end
        fprintf(fpKml, '%s', skeletonKmlFooter);

        % homeInd=find(class==2);
        % if ~isempty(homeInd)
        %     homeTime=gps(homeInd,3);
        %     homeEpisodeInd=find(diff(homeTime)/1000/60>10);
        %     getHomeEpisodes;
        % end
        %
        % workInd=find(class==2);
        % if ~isempty(workInd)
        %     workTime=gps(workInd,3);
        %     workEpisodeInd=find(diff(workTime)/1000/60>10);
        %     getWorkEpisodes;
        % end
        %
        % univInd=find(class==1);
        % if ~isempty(univInd)
        %     univTime=gps(univInd,3);
        %     univEpisodeInd=find(diff(univTime)/1000/60>10);
        %     getUnivEpisodes;
        % end
        %
        % restaurantInd=find(class==3);
        % if ~isempty(restaurantInd)
        %     restaurantTime=gps(restaurantInd,3);
        %     restaurantEpisodeInd=find(diff(restaurantTime)/1000/60>10);
        %     getRestaurantEpisodes;
        % end

        disp([num2str(pid) '_' num2str(sid) '_done']);
%     end
% end
