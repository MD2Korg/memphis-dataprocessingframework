function success = kmlGeneratePoint(fpOut, G, label, lat, long, alt, speed, accuracy, timestampMatch, timestampEma)
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
    timeStrMatch = convert_timestamp_time(G, timestampMatch);
    timeStrEma = convert_timestamp_time(G, timestampEma);
    diff = abs(timestampMatch - timestampEma)/1000;
    description = [ ...
        'Speed : ' num2str(speed*2.24) ' mile/hour' char(10) ...
        'Accuracy : ' num2str(accuracy) char(10) ...
        'Time Match : ' timeStrMatch char(10) ...
        'Time Ema : ' timeStrEma char(10) ...
        'Match : ' num2str(timestampMatch) char(10) ...
        'Ema : ' num2str(timestampEma) char(10) ...
        'Time Diff = ' num2str(diff,2) ' sec' ...
        ];
    fprintf(fpOut,'<Placemark>\n<name>%s</name>\n<visibility>1</visibility>\n<description>\n%s\n</description>\n', label, description);
    fprintf(fpOut, '<styleUrl>#m_ylw-pushpinPoint</styleUrl>\n<Point>\n<coordinates>\n');
    fprintf(fpOut, '%f,%f,%f\n', long, lat, alt);
    fprintf(fpOut, '</coordinates>\n</Point>\n</Placemark>\n');
    success = 1;
end
