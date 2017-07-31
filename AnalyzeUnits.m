clear all
close all

TT = actxcontrol('TTank.X');
invoke(TT,'ConnectServer','Local','Me')
 e=TT.OpenTank('F:\Projects\Data\ScalingProject\BE58\BE585','R');

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

sortnumbs={'sort=1','sort=2'};
sortcode={'FixVar'};
b=TT.SelectBlock(Block);
z=TT.CreateEpocIndexing;
 
run PullSpikes

if size(SUdata1,2)>2
run Sort1
elseif size(SUdata1,1)<2
    for i=1:16
        A(i,1)=Y;
    end
end

Y= zeros(100,33);

if size(SUdata2,2) > 2
run Sort2
elseif size(SUdata2,2) < 2
    for i=1:16
        B{i,1}=Y;
    end
end

TT.CloseTank;
TT.ReleaseServer;

Flash=MyEpocs(2,:)';

size(Flash)

if size(Flash,1)==200
    Flash(:,2)=Flash(:,1)-0.1003;
    Flash(:,3)=Flash(:,2)+1.0007;
    run SUorg
    run SpikeNums
end

clearvars -except A B C D nSpike1 nSpike2 nSpike3 nSpike4 Flash Spike1 Spike2 ...
    SorUnit1 SorUnit2 AllSpike AllSpike2 Unit12 Unit34 AvRate1 AvRate2 AllMax AllMin ...
    AllSpike logamp logamp2 logmax logmax2 logmin logmin2 amp sampleRateHz
