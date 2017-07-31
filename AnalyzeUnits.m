%% Light reintroduction after dark exposure reactivates plasticity in adults via perisynaptic activation of MMP-9
% This is the supplement for the manuscript for SU and VEP analysis. This uses input from Tucker Davis Tech, Sorting via OpenSorter.
% For many portions of this to work you will need TuckerDavis OpenEx
% Lab of Elizabeth Quinlan, by Crystal Lantz 
%
% This is the main code for running spike organization and analysis, within it calls several scripts
%   1. PullSpikes - pulls the raw waveforms, sort codes, epocs (when the stimulus occured) and timestamps
%   2. Sort1 - Organizes all units with designated sort code 1 into electrode number
%   3. Sort2 - Organizes all units with designated sort code 2 into electrode number
%   4. Then we check to make sure we have the correct number of trials, for this study it is 200, and sets the time stamps for start/end
%   5. SUOrg - Organizes spikes into experimental trials, numbers trials for easier raster plotting
%   6. SpikeNums - Removes movement artifacts, where units occur on all channels at the same time
%
% Useful output are:
%   1. AllSpike - Total number of spikes for each sort code by electrode number
%   2. AvgUnit1 (or2) - Average waveform for each unit by electrode number and sort number
%

clear all
close all

TT = actxcontrol('TTank.X');
invoke(TT,'ConnectServer','Local','Me')
e=TT.OpenTank('F:\Directory\Tank\','R');

%% User input for Block infomation
% block number to access
block_str = 'Block-';
Block = input('Block?','s');
if isempty(Block)
    Block= '1';
end;
Block = strcat(block_str, Block);

sortnumbs={'sort=1','sort=2'};
sortcode={'FixVar'};
b=TT.SelectBlock(Block);
z=TT.CreateEpocIndexing;

%% Pull raw data, must have already specified directory, block, sort codes, and sort numbers to run
run PullSpikes

Y= zeros(100,33); #place holder when a sort number is empty

if size(SUdata1,2) < 2
	for i=1:16
		A{i,1}=Y;
	end
else
	run Sort1
end

if size(SUdata2,2) < 2
	for i=1:16
		B{i,1}=Y;
	end
else
	run Sort2
end

TT.CloseTank;
TT.ReleaseServer;

Flash=MyEpocs(2,:)';

disp("Dimensions of Flash: ")
size(Flash)

if size(Flash,1)==200 #all of these are written for 200 trials
    Flash(:,2)=Flash(:,1)-0.1003; #this value is designated by the time pre-record for each stimulation
    Flash(:,3)=Flash(:,2)+1.0007; #this value is designated by the time post-record for each stimulation
    run SUorg
    run SpikeNums
else
    disp("Trials does not = 200")
    return
end

clearvars -except A B C D nSpike1 nSpike2 nSpike3 nSpike4 Flash Spike1 Spike2 ...
    SorUnit1 SorUnit2 AllSpike AllSpike2 Unit12 Unit34 AvRate1 AvRate2 AllMax AllMin ...
    AllSpike logamp logamp2 logmax logmax2 logmin logmin2 amp sampleRateHz
