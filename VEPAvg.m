%% Light reintroduction after dark exposure reactivates plasticity in adults via perisynaptic activation of MMP-9
% This is the supplement for the manuscript for SU and VEP analysis. This uses input from Tucker Davis Tech, Sorting via OpenSorter.
% For many portions of this to work you will need TuckerDavis OpenEx.
% VEP script uses subaxis which is avalible here: https://www.mathworks.com/matlabcentral/fileexchange/3696-subaxis-subplot
% Lab of Elizabeth Quinlan, by Crystal Lantz 
%
% This script is fairly straightforward:
%  1- Pull data from TDT specifying directory and Tank
%  2- Select define the epoc for LFP, and select each channel of data. Average each channel.
%  3- Organize the data for both visualization and analysis
%  4- Calculate LFP parameters; time to peak, max/min, amplitude
%


%% Open connection to TDT Server

TT = actxcontrol('TTank.X');
invoke(TT,'ConnectServer','Local','Me')
e=TT.OpenTank('F:\Directory\Tank','R');

%% User input for Block infomation
% block number to access
block_str = 'Block-';
Block = input('Block?','s');
if isempty(Block)
    Block= '1';
end;
Block = strcat(block_str, Block);

Trials = 200;
 
b=TT.SelectBlock(Block);
z=TT.CreateEpocIndexing;
filt =TT.SetFilterWithDescEx('SPAT=1000');

     
%% Pull Individual Channel data

%Channel 1 = Channel 1
 a=TT.ReadEventsV(Trials,'VEPx',1,0,0,0,'ALL');
 VEPdata1=TT.ParseEvV(0,a);
 sampleRateHz=TT.ParseEvInfoV(0,1,9);
 npts=size(VEPdata1);
 TimeAxis=(0:(npts(1)-1))/sampleRateHz;
 AverageVEP1=mean(VEPdata1');

%Channel 2 = Channel 2
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
% create cell-array of Averages
BlockAvg= {AverageVEP1; AverageVEP2; AverageVEP3; AverageVEP4; AverageVEP5; AverageVEP6;...
    AverageVEP7; AverageVEP8; AverageVEP9; AverageVEP10; AverageVEP11; AverageVEP12; AverageVEP13;...
    AverageVEP14; AverageVEP15; AverageVEP16};

% Create Matrix of all Averages
TotVEP = [AverageVEP1; AverageVEP2; AverageVEP3; AverageVEP4;...
    AverageVEP5; AverageVEP6; AverageVEP7; AverageVEP8;...
    AverageVEP9; AverageVEP10; AverageVEP11; AverageVEP12; AverageVEP13;...
    AverageVEP14; AverageVEP15; AverageVEP16];

%% Plot VEP averages
for i=1:16
figure;
subaxis(2,8,i,'Spacing', 0.025, 'Padding', 0.00, 'Margin', 0.03);
plot(TimeAxis,BlockAvg{i})
axis([0 1 -0.0001 0.0001])
end

%% Time to Peak calculation
% Take first 1500 samples
First = TotVEP(1:16, 307:1526);

Last = TotVEP(1:16, 1527:3054);

% Find Max and Min
AmpMax1 =(max(First,[],2));
AmpMin1 = abs(min(First,[],2));

AmpMax2 =(max(Last,[],2));
AmpMin2 = abs(min(Last,[],2));

% Find Amplitudes and conver to microvolts
Amp1 = (AmpMax1+AmpMin1)*1000000; #amplitude of first VEP reversal
Amp2 = (AmpMax2+AmpMin2)*1000000; #amplitude of second VEP reversal

Channels=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

% Create Time Axis from point sampled for Max and Min
ShortTime=TimeAxis(1,307:1526);

% Find Time Axis points for Min
[num idxmin] = min(First,[],2);
idxmin=idxmin';
PeakTimeMin=(ShortTime(idxmin)');

% Find Time Axis points for Max
[num2 idxmax] = max(First,[],2);
idxmax=idxmax';
PeakTimeMax=(ShortTime(idxmax)');



