function HdrData=makehdr
% HdrData=MAKEHDR
%
% Makes a sensible empty header for WRITESAC
%
% SEE ALSO: READSAC
%
% Last modified by fjsimons-at-alum.mit.edu, 02/22/2020
% Last modified by sirawich-at-princeton.edu, 08/31/2021

badval=-12345;
badalpha='-12345..';

HdrData=[];

HdrData.AZ=badval;
HdrData.B=0;
HdrData.BAZ=badval;
HdrData.CMPAZ=badval;
HdrData.CMPINC=badval;
HdrData.DELTA=1;
HdrData.DIST=badval;
HdrData.E=1;
HdrData.EVDP=badval;
HdrData.EVEL=badval;
HdrData.EVLA=badval;
HdrData.EVLO=badval;
HdrData.GCARC=badval;
HdrData.IDEP=5;
HdrData.IEVREG=badval;
HdrData.IEVTYP=badval;
HdrData.IFTYPE=1;
HdrData.IINST=badval;
HdrData.IMAGSRC=badval;
HdrData.IMAGTYP=badval;
HdrData.INTERNAL=2;
HdrData.IQUAL=badval;
HdrData.ISTREG=badval;
HdrData.ISYNTH=badval;
HdrData.IZTYPE=69;
HdrData.KCMPNM='single';
HdrData.KINST='Matlab';
HdrData.KSTNM='Linux ';
HdrData.KUSER0='fjsimons';
HdrData.LCALDA=0;
HdrData.LEVEN=1;
HdrData.LOVROK=badval;
HdrData.LPSPOL=0;
HdrData.MAG=badval;
HdrData.NVHDR=6;
HdrData.NZHOUR=indeks(datevec(datenum(clock)),4);
HdrData.NZJDAY=floor(dayofyear);
HdrData.NZMIN=indeks(datevec(datenum(clock)),5);
HdrData.NZMSEC=0;
HdrData.NZSEC=ceil(indeks(datevec(datenum(clock)),6));
HdrData.NZYEAR=indeks(datevec(datenum(clock)),1);
HdrData.SCALE=badval;
HdrData.SKALE=1;
HdrData.STDP=badval;
HdrData.STEL=badval;
HdrData.STLA=badval;
HdrData.STLO=badval;
HdrData.T0=badval;
HdrData.T1=badval;
HdrData.T2=badval;
HdrData.T3=badval;
HdrData.T4=badval;
HdrData.T5=badval;
HdrData.T6=badval;
HdrData.T7=badval;
HdrData.T8=badval;
HdrData.T9=badval;
HdrData.KT0=badalpha;
HdrData.KT1=badalpha;
HdrData.KT2=badalpha;
HdrData.KT3=badalpha;
HdrData.KT4=badalpha;
HdrData.KT5=badalpha;
HdrData.KT6=badalpha;
HdrData.KT7=badalpha;
HdrData.KT8=badalpha;
HdrData.KT9=badalpha;
