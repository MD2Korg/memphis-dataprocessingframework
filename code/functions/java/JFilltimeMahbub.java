/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
*/

public class JFilltimeMahbub{

    private double samples_per_second;
	private int sampleLength;

	public JFilltimeMahbub(double sps, double sampleLen){
        samples_per_second=sps;
		sampleLength=(int)sampleLen;
    }

	public double test(double[] times){
		return times[3];
	}

	public double[] fill(double[] times){
		double[] out=new double[sampleLength*times.length];
		double dt;
		double DT;
		for(int i=0;i<times.length-1;i++){
			DT=times[i+1]-times[i];
			if(DT>sampleLength*1000/samples_per_second){
				dt=1000/samples_per_second;
			}else{
				dt=DT/sampleLength;
			}
			for(int j=0;j<sampleLength;j++) out[sampleLength*i+j]=times[i]+dt*j;
		}
		dt=1000/samples_per_second;
		for(int j=0;j<sampleLength;j++) out[sampleLength*(times.length-1)+j]=times[times.length-1]+j*dt;
		return out;
	}
}
