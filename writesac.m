function fid=writesac(SeisData,HdrData,filename)
% fid=WRITESAC(SeisData,HdrData,filename)
%
% INPUT:
%
% SeisData      The samples of the seismogram
% HdrData       Optional header structure array, with updated information
% filename      The name of the file that will be written
%
% OUTPUT:
%
% fid           The handle of the newly created file 
%
% See also: READSAC, MAKEHDR
% 
% Last modified by fjsimons-at-alum.mit.edu, 05/25/2020
% Last modified by sirawich-at-princeton.edu, 09/13/2021

% Default filename
defval('filename',[inputname(1),'.sac']);

% Default header
%defval('HdrData',makehdr)

% The default undefined value
badval=-12345;

% Check for consistency; tolerance needs to be fairly high
tolex=min(1e-5,HdrData.DELTA);
difer(HdrData.NPTS-length(SeisData),[],1,NaN);
difer(HdrData.B+HdrData.DELTA*(HdrData.NPTS-1)-HdrData.E,...
      tolex,1,NaN)

% Initialize Header
HdrF=repmat(badval,70,1);
HdrN=repmat(badval,15,1);
HdrI=repmat(badval,20,1);
HdrL=repmat(badval,5,1);
HdrK=repmat(str2mat(repmat(0,1,8)),24,1);

% Assign variables to the header
% If you change any of this, change it in READSAC as well!
HdrF(52)=HdrData.AZ;
HdrF(6)=HdrData.B;
HdrF(53)=HdrData.BAZ;
HdrF(51)=HdrData.DIST;
HdrF(1)=HdrData.DELTA;
HdrF(7)=HdrData.E;
HdrF(41)=HdrData.USER0;
HdrF(42)=HdrData.USER1;
HdrF(43)=HdrData.USER2;
HdrF(44)=HdrData.USER3;
HdrF(45)=HdrData.USER4;
HdrF(46)=HdrData.USER5;
HdrF(47)=HdrData.USER6;
HdrF(48)=HdrData.USER7;
HdrF(49)=HdrData.USER8;
HdrF(50)=HdrData.USER9;
HdrF(39)=HdrData.EVDP;
HdrF(38)=HdrData.EVEL;
HdrF(36)=HdrData.EVLA;
HdrF(37)=HdrData.EVLO;
HdrF(54)=HdrData.GCARC;
try 
  HdrI(1)=HdrData.IFTYPE;
  HdrI(2)=HdrData.IDEP;
catch
  error('You cannot work with resolved categorical variables - see READSAC')
  % Obviously, one could resubstitute the code for the name, see IVARS
end
HdrK(1,1:length(HdrData.KSTNM))=HdrData.KSTNM;
HdrK(2,:)=HdrData.KEVNM(1:8);
HdrK(3,1:length(HdrData.KEVNM(9:end)))=HdrData.KEVNM(9:end);
HdrK(7,1:length(HdrData.KT0))=HdrData.KT0;
HdrK(8,1:length(HdrData.KT1))=HdrData.KT1;
HdrK(9,1:length(HdrData.KT2))=HdrData.KT2;
HdrK(10,1:length(HdrData.KT3))=HdrData.KT3;
HdrK(11,1:length(HdrData.KT4))=HdrData.KT4;
HdrK(12,1:length(HdrData.KT5))=HdrData.KT5;
HdrK(13,1:length(HdrData.KT6))=HdrData.KT6;
HdrK(14,1:length(HdrData.KT7))=HdrData.KT7;
HdrK(15,1:length(HdrData.KT8))=HdrData.KT8;
HdrK(16,1:length(HdrData.KT9))=HdrData.KT9;
HdrK(18,1:length(HdrData.KUSER0))=HdrData.KUSER0;
HdrK(19,1:length(HdrData.KUSER1))=HdrData.KUSER1;
HdrK(20,1:length(HdrData.KUSER2))=HdrData.KUSER2;
HdrK(21,1:length(HdrData.KCMPNM))=HdrData.KCMPNM;
HdrK(22,1:length(HdrData.KNETWK))=HdrData.KNETWK;
HdrK(24,1:length(HdrData.KINST))=HdrData.KINST;
HdrL(4)=HdrData.LCALDA;
HdrF(40)=HdrData.MAG;
HdrN(10)=HdrData.NPTS;
HdrN(7)=HdrData.NVHDR;
HdrN(3)=HdrData.NZHOUR;
HdrN(2)=HdrData.NZJDAY;
HdrN(4)=HdrData.NZMIN;
HdrN(6)=HdrData.NZMSEC;
HdrN(5)=HdrData.NZSEC;
HdrN(1)=HdrData.NZYEAR;
HdrF(4)=HdrData.SCALE;
HdrF(35)=HdrData.STDP;
HdrF(34)=HdrData.STEL;
HdrF(32)=HdrData.STLA;
HdrF(33)=HdrData.STLO;
HdrF(11)=HdrData.T0;
HdrF(12)=HdrData.T1;
HdrF(13)=HdrData.T2;
HdrF(14)=HdrData.T3;
HdrF(15)=HdrData.T4;
HdrF(16)=HdrData.T5;
HdrF(17)=HdrData.T6;
HdrF(18)=HdrData.T7;
HdrF(19)=HdrData.T8;
HdrF(20)=HdrData.T9;

% Finally, proceed to writing this
fid=fopen(filename,'w','l');
fwrite(fid,HdrF,'float32');
fwrite(fid,HdrN,'int32');
fwrite(fid,HdrI,'int32');
fwrite(fid',HdrL,'int32');
fwrite(fid,HdrK','char');
fwrite(fid,SeisData,'float32');
fclose(fid);

% Optional output
varns={fid};
varargout=varns(1:nargout);
