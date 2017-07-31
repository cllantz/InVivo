%% Open connection to TDT Server

TT = actxcontrol('TTank.X');
invoke(TT,'ConnectServer','Local','Me')
 e=TT.OpenTank('C:\Users\clantz\Desktop\crystal\crystal\20170516\20170516','R');

 %% User input for Block infomation
 % block number to access
block_str = 'Block-';
Block = input('Block?','s');
% just type the number, bruh
if isempty(Block)
    % Default speed of grating in cycles per second:
    Block= '1';
end;
Block = strcat(block_str, Block);
% % 
% % Block name for saving269
% %  savename = input('Block Save?','s');
% % if isempty(Block)
% %     Default speed of grating in cycles per second:
% %     Block= 'Block1';
% % end;

Trials = 200;
% % number of trials in block
%  Trials = input('Trials?');
% if isempty(Block)
%     % Default speed of grating in cycles per second:
%     Trials= 100;
% end;
 
 b=TT.SelectBlock(Block);
 z=TT.CreateEpocIndexing;
 filt =TT.SetFilterWithDescEx('SPAT=1000');


     
 %% Pull Individual Channel data
 %save as original Channel number
 
 %Channel 1 = Channel 1
 a=TT.ReadEventsV(Trials,'VEPx',1,0,0,0,'ALL');
 VEPdata1=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata1);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP1=mean(VEPdata1');

 % Channel 2 = Channel 2
 a=TT.ReadEventsV(Trials,'VEPx',2,0,0,0,'ALL');
 VEPdata2=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata2);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP2=mean(VEPdata2');

 % Channel 3 = Channel 3
 a=TT.ReadEventsV(Trials,'VEPx',3,0,0,0,'ALL');
  VEPdata3=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata3);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP3=mean(VEPdata3');

 % Channel 4 = Channel 4
 a=TT.ReadEventsV(Trials,'VEPx',4,0,0,0,'ALL');
 VEPdata4=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9); 
 npts=size(VEPdata4);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP4=mean(VEPdata4');

 % Channel 5 = Channel 5
 a=TT.ReadEventsV(Trials,'VEPx',5,0,0,0,'ALL');
 VEPdata5=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata5);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP5=mean(VEPdata5');

 % Channel 6 = Channel 6
 a=TT.ReadEventsV(Trials,'VEPx',6,0,0,0,'ALL');
 VEPdata6=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata6);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP6=mean(VEPdata6');

 % Channel 7 = Channel 7
 a=TT.ReadEventsV(Trials,'VEPx',7,0,0,0,'ALL');
 VEPdata7=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata7);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP7=mean(VEPdata7');

 % Channel 8 = Channel 8
 a=TT.ReadEventsV(Trials,'VEPx',8,0,0,0,'ALL');
 VEPdata8=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata8);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP8=mean(VEPdata8');

 % Channel 9 = Channel 9
 a=TT.ReadEventsV(Trials,'VEPx',9,0,0,0,'ALL');
 VEPdata9=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata9);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP9=mean(VEPdata9');

 % Channel 10 = Channel 10
 a=TT.ReadEventsV(Trials,'VEPx',10,0,0,0,'ALL');
 VEPdata10=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata10);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP10=mean(VEPdata10');

% Channel 11 = Channel 11 
a=TT.ReadEventsV(Trials,'VEPx',11,0,0,0,'ALL');
VEPdata11=TT.ParseEvV(0,a);
sampleRateHz=TT.ParseEvInfoV(0,1,9);
npts=size(VEPdata11);
TimeAxis=(0:(npts(1)-1))/sampleRateHz;
AverageVEP11=mean(VEPdata11');

 % Channel 12 = Channel 12
 a=TT.ReadEventsV(Trials,'VEPx',12,0,0,0,'ALL');
 VEPdata12=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata12);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP12=mean(VEPdata12');

 % Channel 13 = Channel 13
 a=TT.ReadEventsV(Trials,'VEPx',13,0,0,0,'ALL');
 VEPdata13=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata13);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP13=mean(VEPdata13');

 % Channel 14 = Channel 14
 a=TT.ReadEventsV(Trials,'VEPx',14,0,0,0,'ALL');
 VEPdata14=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata14);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP14=mean(VEPdata14');

 % Channel 15 = Channel 15
 a=TT.ReadEventsV(Trials,'VEPx',15,0,0,0,'ALL');
 VEPdata15=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata15);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP15=mean(VEPdata15');

 % Channel 16 = Channel 16
 a=TT.ReadEventsV(Trials,'VEPx',16,0,0,0,'ALL');
  VEPdata16=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata16);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP16=mean(VEPdata16');

%% Close TDT Server 
TT.CloseTank;
TT.ReleaseServer;

%% Organize Data

% Create cell-array of raw data
Block= {VEPdata1; VEPdata2; VEPdata3; VEPdata4; VEPdata5; VEPdata6;...
    VEPdata7; VEPdata8; VEPdata9; VEPdata10; VEPdata11; VEPdata12; VEPdata13;...
    VEPdata14; VEPdata15; VEPdata16};

% create cell-array of Averages
BlockAvg= {AverageVEP1; AverageVEP2; AverageVEP3; AverageVEP4; AverageVEP5; AverageVEP6;...
    AverageVEP7; AverageVEP8; AverageVEP9; AverageVEP10; AverageVEP11; AverageVEP12; AverageVEP13;...
    AverageVEP14; AverageVEP15; AverageVEP16};

%Create Matrix of all Averages
TotVEP = [AverageVEP1; AverageVEP2; AverageVEP3; AverageVEP4;...
    AverageVEP5; AverageVEP6; AverageVEP7; AverageVEP8;...
    AverageVEP9; AverageVEP10; AverageVEP11; AverageVEP12; AverageVEP13;...
    AverageVEP14; AverageVEP15; AverageVEP16];

%% Create Matrix of Variability for Each Channel
varVEP=[var(VEPdata1,0,2), var(VEPdata2,0,2), var(VEPdata3,0,2),...
var(VEPdata4,0,2), var(VEPdata5,0,2), var(VEPdata6,0,2), ...
var(VEPdata7,0,2), var(VEPdata8,0,2), var(VEPdata9,0,2),...
var(VEPdata10,0,2), var(VEPdata11,0,2), var(VEPdata12,0,2), var(VEPdata13,0,2),...
var(VEPdata14,0,2), var(VEPdata15,0,2), var(VEPdata16,0,2)]';
% 
% %plot Variability
% figure(1);
% plot(TimeAxis, varVEP);
% 
% %plot Traces
% figure(2)
% plot(TimeAxis, TotVEP);

%% Calculate CSD 
% Bear eq
% CSD14=-1*(75*(AverageVEP14-AverageVEP15)-75*(AverageVEP15-AverageVEP16))/(0.5*75*75*(75+75));
% CSD13=-1*(75*(AverageVEP13-AverageVEP14)-75*(AverageVEP14-AverageVEP15))/(0.5*75*75*(75+75));
% CSD12=-1*(75*(AverageVEP12-AverageVEP13)-75*(AverageVEP13-AverageVEP14))/(0.5*75*75*(75+75));
% CSD11=-1*(75*(AverageVEP11-AverageVEP12)-75*(AverageVEP12-AverageVEP13))/(0.5*75*75*(75+75));
% CSD10=-1*(75*(AverageVEP10-AverageVEP11)-75*(AverageVEP11-AverageVEP12))/(0.5*75*75*(75+75));
% CSD9=-1*(75*(AverageVEP9-AverageVEP10)-75*(AverageVEP10-AverageVEP11))/(0.5*75*75*(75+75));
% CSD8=-1*(75*(AverageVEP8-AverageVEP9)-75*(AverageVEP9-AverageVEP10))/(0.5*75*75*(75+75));
% CSD7=-1*(75*(AverageVEP7-AverageVEP8)-75*(AverageVEP8-AverageVEP9))/(0.5*75*75*(75+75));
% CSD6=-1*(75*(AverageVEP6-AverageVEP7)-75*(AverageVEP7-AverageVEP8))/(0.5*75*75*(75+75));
% CSD5=-1*(75*(AverageVEP5-AverageVEP6)-75*(AverageVEP6-AverageVEP7))/(0.5*75*75*(75+75));
% CSD4=-1*(75*(AverageVEP4-AverageVEP5)-75*(AverageVEP5-AverageVEP6))/(0.5*75*75*(75+75));
% CSD3=-1*(75*(AverageVEP3-AverageVEP4)-75*(AverageVEP4-AverageVEP5))/(0.5*75*75*(75+75));
% CSD2=-1*(75*(AverageVEP2-AverageVEP3)-75*(AverageVEP3-AverageVEP4))/(0.5*75*75*(75+75));
% CSD1=-1*(75*(AverageVEP1-AverageVEP2)-75*(AverageVEP2-AverageVEP3))/(0.5*75*75*(75+75));

% %Mitz eq
CSD14=-1*((AverageVEP14-(2*(AverageVEP15))+AverageVEP16)/(2500));
CSD13=-1*((AverageVEP13-(2*(AverageVEP14))+AverageVEP15)/(2500));
CSD12=-1*((AverageVEP12-(2*(AverageVEP13))+AverageVEP15)/(2500));
CSD11=-1*((AverageVEP11-(2*(AverageVEP12))+AverageVEP13)/(2500));
CSD10=-1*((AverageVEP10-(2*(AverageVEP11))+AverageVEP12)/(2500));
CSD9=-1*((AverageVEP9-(2*(AverageVEP10))+AverageVEP11)/(2500));
CSD8=-1*((AverageVEP8-(2*(AverageVEP9))+AverageVEP10)/(2500));
CSD7=-1*((AverageVEP7-(2*(AverageVEP8))+AverageVEP9)/(2500));
CSD6=-1*((AverageVEP6-(2*(AverageVEP7))+AverageVEP8)/(2500));
CSD5=-1*((AverageVEP5-(2*(AverageVEP6))+AverageVEP7)/(2500));
CSD4=-1*((AverageVEP4-(2*(AverageVEP5))+AverageVEP6)/(2500));
CSD3=-1*((AverageVEP3-(2*(AverageVEP4))+AverageVEP5)/(2500));
CSD2=-1*((AverageVEP2-(2*(AverageVEP3))+AverageVEP4)/(2500));
CSD1=-1*((AverageVEP1-(2*(AverageVEP2))+AverageVEP3)/(2500));

% CSD1=((AverageVEP13-(2*(AverageVEP15))+AverageVEP16)/(2500));
% CSD3=((AverageVEP12-(2*(AverageVEP13))+AverageVEP14)/(2500));
% CSD4=((AverageVEP11-(2*(AverageVEP12))+AverageVEP13)/(2500));
% CSD5=((AverageVEP10-(2*(AverageVEP11))+AverageVEP12)/(2500));
% CSD6=((AverageVEP9-(2*(AverageVEP10))+AverageVEP11)/(2500));
% CSD7=((AverageVEP8-(2*(AverageVEP9))+AverageVEP10)/(2500));
% CSD8=((AverageVEP7-(2*(AverageVEP8))+AverageVEP9)/(2500));
% CSD9=((AverageVEP6-(2*(AverageVEP7))+AverageVEP8)/(2500));




% %%mine
% CSD1=((AverageVEP14-AverageVEP16-(2*(AverageVEP15)))/(2500));
% CSD2=((AverageVEP13-AverageVEP15-(2*(AverageVEP14)))/(2500));
% CSD3=((AverageVEP12-AverageVEP14-(2*(AverageVEP13)))/(2500));
% CSD4=((AverageVEP11-AverageVEP13-(2*(AverageVEP12)))/(2500));
% CSD5=((AverageVEP10-AverageVEP12-(2*(AverageVEP11)))/(2500));
% CSD6=((AverageVEP9-AverageVEP11-(2*(AverageVEP10)))/(2500));
% CSD7=((AverageVEP8-AverageVEP10-(2*(AverageVEP9)))/(2500));
% CSD8=((AverageVEP7-AverageVEP9-(2*(AverageVEP8)))/(2500));
% CSD9=((AverageVEP6-AverageVEP8-(2*(AverageVEP7)))/(2500));
% CSD10=((AverageVEP5-AverageVEP7-(2*(AverageVEP6)))/(2500));
% CSD11=((AverageVEP4-AverageVEP6-(2*(AverageVEP5)))/(2500));
% CSD12=((AverageVEP3-AverageVEP5-(2*(AverageVEP4)))/(2500));
% CSD13=((AverageVEP2-AverageVEP4-(2*(AverageVEP3)))/(2500));
% CSD14=((AverageVEP1-AverageVEP3-(2*(AverageVEP2)))/(2500));

%Create Matrix of CSD values
CSD = ([CSD1;CSD2;CSD3;CSD4;CSD5;CSD6;CSD7;CSD8;CSD9;CSD10;CSD11;CSD12;CSD13;CSD14]); 

% %Create X and Y coords for ploting CSD
% X = linspace(0,1,3054);
% Y = linspace(1, 14, 14);
% 
% % Plot CSD using contour
% figure(4)
% contourf(X,Y,CSD,30, 'LineColor', 'none')
% set(gca,'Ydir','reverse')

for i=1:16
figure(2);
%subplot(2,8,i);
subaxis(2,8,i,'Spacing', 0.025, 'Padding', 0.00, 'Margin', 0.03);
plot(TimeAxis,BlockAvg{i})
axis([0 1 -0.0001 0.0001])
end

%% Time to Peak calculation
%Take first 1500 samples
First = TotVEP(1:16, 307:1526);

Last = TotVEP(1:16, 1527:3054);

% Find Max and Min
AmpMax1 =(max(First,[],2));
AmpMin1 = abs(min(First,[],2));

AmpMax2 =(max(Last,[],2));
AmpMin2 = abs(min(Last,[],2));

% Find Amplitudes
Amp1 = (AmpMax1+AmpMin1)*1000000;
Amp2 = (AmpMax2+AmpMin2)*1000000;

Channels=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

%Create Time Axis from point sampled for Max and Min
ShortTime=TimeAxis(1,307:1526);

%Find Time Axis points for Min
[num idxmin] = min(First,[],2);
idxmin=idxmin';
PeakTimeMin=(ShortTime(idxmin)');

%Find Time Axis points for Max
[num2 idxmax] = max(First,[],2);
idxmax=idxmax';
PeakTimeMax=(ShortTime(idxmax)');

% 
% %% Save Important Stuff
% save(savename,'Block*', 'Peak*', 'Channels', 'TotVEP', 'TimeAxis',...
%     'ShortTime', 'Amp*')


% %%calc frequency
% for i =1:16
% 
% params.fpass=[0 60];
% params.Fs=3052;
% params.tapers=[1 3];
% params.trialave=200;
% data= Block{i};
% data =zscore(data);
% [S,fw0]=mtspectrumc(data,params);
% 
% freq(i,:)=fw0;
% power(i,:)=S;
% end
%  

for i=1:16
    VEPsm(i,:)=smooth(TotVEP(i,:)*1000000,50);
end

for i=1:12
   aCSD(i,:)=zscore(-1*((VEPsm(i,:)-(2*(VEPsm(i+2,:)))+VEPsm(i+4,:))/(2500)));
end

