
function epb=bpmin(H,F,dB)
% epb=BPMIN(H,F,dB)
%
% Takes a filter, figures out where its gain drops below a certain frequency
%
% INPUT:
%
% H     Magnitude response (in deciBel)
% F     Frequency vector
% dB    Stopband level (positive)
%
% OUTPUT:
% 
% epb   Frequencies where the pass band exceeds dB level
%
% SEE ALSO:
%
% bandpass
%
% Last modified by fjsimons-at-alum.mit.edu, 02/28/2019

% Supply defaults
defval('dB',3)

H=H+dB;
Hm=find(H==max(H));

% Both are now monotonic functions
F1=interp1(H(1:Hm),F(1:Hm),0);
F2=interp1(H(Hm+1:end),F(Hm+1:end),0);

epb=[F1 F2];


