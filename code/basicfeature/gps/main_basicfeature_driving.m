function driving = main_basicfeature_driving( G, sensor )
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
maxGaitSpeed = 2.533;
try
	driving = [];
	lats = sensor{G.SENSOR.P_GPS_LATID}.sample;
	longs = sensor{G.SENSOR.P_GPS_LONGID}.sample;
	alts = sensor{G.SENSOR.P_GPS_ALTID}.sample;
	speeds = sensor{G.SENSOR.P_GPS_SPDID}.sample;
	bears = sensor{G.SENSOR.P_GPS_BEAR}.sample;
	accuracys = sensor{G.SENSOR.P_GPS_ACCURACYID}.sample;
	timestamps = sensor{G.SENSOR.P_GPS_LATID}.timestamp;

	driving.sessions = driving_sessions(speeds, timestamps, maxGaitSpeed);
	driving.turns = driving_turns(driving.sessions, lats, longs, speeds, accuracys, timestamps, maxGaitSpeed);

catch e
	disp(e.message);
end

end
