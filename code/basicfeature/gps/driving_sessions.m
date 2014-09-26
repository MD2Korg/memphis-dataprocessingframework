function session = driving_session( speeds, timestamps, maxGaitSpeed )
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
meterPerSecToMilePerHour = 2.23694;
session = [];
startIndexDriving = -1;
lastIndexDriving = -1;
for i=1:numel(timestamps)
	sessionEnded = false;
	if i>1
		prevTsGap = timestamps(i)-timestamps(i-1);
		if prevTsGap > 10*1000
			% gps signal loss for 10 sec will end the session.
			sessionEnded = true;
		end
	end

	if speeds(i)>maxGaitSpeed && sessionEnded == false
		lastIndexDriving = i;
		if startIndexDriving == -1
			startIndexDriving = i;
		end
	else
		if lastIndexDriving == -1 || startIndexDriving == -1
			continue;
		end
		diffFromLast = timestamps(i) - timestamps(lastIndexDriving);
		if diffFromLast > 2*60*1000
			sessionEnded = true;
			% 2+ min stop means another session
			if timestamps(lastIndexDriving)-timestamps(startIndexDriving) >= 3*60*1000
				%only take sessions where driving session>=3min
				avgSpeedMph = mean(speeds(startIndexDriving:lastIndexDriving)) * meterPerSecToMilePerHour;
				session(end+1, :) = [timestamps(startIndexDriving) timestamps(lastIndexDriving) avgSpeedMph];
			end
			startIndexDriving = -1;
			lastIndexDriving = -1;
		end
	end
end

end
