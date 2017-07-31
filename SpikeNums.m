AvgUnit1=zeros(16,30);
AvgUnit2=zeros(16,30);

for i=1:16
    Spike1(i,1)=size(A{i,1},1);
    Num1(i,1)=A{i,1}(1,3);
    
    Spike2(i,1)=size(B{i,1},1);
    Num2(i,1)=B{i,1}(1,3);
end

clear i

for i=1:16
    AvgUnit1(i,:)= mean(A{i,1}(:,6:end));
    AvgUnit2(i,:)= mean(B{i,1}(:,6:end));
end

clear i

abins=linspace(-0.1003,3.1000,640);

%%get centers of each 0.05ms bin
abins1=abins(1,1:201)+0.0025;

for i=1:16
    k=A{i,1}(:,2);
    [counts,centers] = hist(k,abins1);
    [M,I]=max(counts(1,111:136));
    PeakA(i,1)=counts(1,(110+I))+counts(1,(109+I))+counts(1,(111+I));
    t2peakA(i,1)=centers(1,122+I);
    [M,I]=min(counts(1,100:110));
    BottomA(i,1)=counts(1,(99+I))+counts(1,(100+I))+counts(1,(98+I));
    clear k j h I M counts centers
end

clear i

for i=1:16
    k=B{i,1}(:,2);
    [counts,centers] = hist(k,abins1);
   [M,I]=max(counts(1,111:136));
    PeakB(i,1)=counts(1,(110+I))+counts(1,(109+I))+counts(1,(111+I));
    t2peakB(i,1)=centers(1,122+I);
    [M,I]=min(counts(1,100:110));
    BottomB(i,1)=counts(1,(99+I))+counts(1,(100+I))+counts(1,(98+I));
    clear k j h I M counts centers
end

timeline=linspace(0,1.311,30);

shorttime=timeline(1,1:30);

%%Unit1
spikeonly1=AvgUnit1(:, 1:30);
spikemax=abs(min(spikeonly1,[],2));
spikemax=repmat(spikemax,[1 30]);
Trough1=(abs(min(spikeonly1,[],2)));
Peak1 =(max(spikeonly1(:,:) ,[],2));

[num idxmin] = min(spikeonly1,[],2);

idxmin=idxmin';

PeakTimeMin1=(shorttime(idxmin)');

[num2 idxmax] = max(spikeonly1,[],2);

idxmax=idxmax';

PeakTimeMax1=(shorttime(idxmax)');
t2ptime1 = PeakTimeMax1 - PeakTimeMin1;

beginPeak1=(abs(max(spikeonly1(:,1:4) ,[],2)));
troughamp1=Trough1-beginPeak1;
peakamp1=Peak1-beginPeak1;
ratioTP1=Peak1./Trough1;

%%Unit2
spikeonly2=AvgUnit2(:, 1:30);
spikemax=abs(min(spikeonly2,[],2));
spikemax=repmat(spikemax,[1 30]);
Trough2=(abs(min(spikeonly2,[],2)));
Peak2 =(max(spikeonly2(:,:) ,[],2));

[num idxmin] = min(spikeonly2,[],2);

idxmin=idxmin';

PeakTimeMin2=(shorttime(idxmin)');

[num2 idxmax] = max(spikeonly2,[],2);

idxmax=idxmax';

PeakTimeMax2=(shorttime(idxmax)');
t2ptime2 = PeakTimeMax2 - PeakTimeMin2;

beginPeak2=(abs(max(spikeonly2(:,1:4) ,[],2)));
troughamp2=Trough2-beginPeak2;
peakamp2=Peak2-beginPeak2;
ratioTP2=Peak2./Trough2;

AvgUnit1=spikeonly1;
AvgUnit2=spikeonly2;

%%Avg Hz
tottrial=linspace(1,100,100);
clear i
for i=1:16
    k=A{i,1}(:,1);
    [a(i,:),b(i,:)]=hist(k,tottrial);
    
    j=B{i,1}(:,1);
    [a2(i,:),b2(i,:)]=hist(j,tottrial);
end

AvRate1=mean(a,2);
AvRate2=mean(a2,2);

%%assign to correct electrode
Spike1(17,1)=0;
Spike2(17,1)=0;
Num1(Num1==0)=17;
Num2(Num2==0)=17;
AvgUnit1(17,:)=0;
AvgUnit2(17,:)=0;
AvgUnit1(isnan(AvgUnit1))=0;
AvgUnit2(isnan(AvgUnit2))=0;
PeakB(17,1)=0;
PeakA(17,1)=0;
BottomA(17,1)=0;
BottomB(17,1)=0;
t2peakB(17,1)=0;
t2peakA(17,1)=0;

t1=AvgUnit1;
t2=AvgUnit2;

clear i

for i=1:16
    nSpike1(Num1(i,1),1)=Spike1(i,1);
    nSpike2(Num2(i,1),1)=Spike2(i,1);
    SorUnit1(Num1(i,1),:)=AvgUnit1(i,:);
    SorUnit2(Num2(i,1),:)=AvgUnit2(i,:);
    Max1(Num1(i,1),:)=PeakA(i,1);
    Max2(Num2(i,1),:)=PeakB(i,1);
    Min1(Num1(i,1),:)=BottomA(i,1);
    Min2(Num2(i,1),:)=BottomB(i,1);
    Time1(Num1(i,1),:)=t2peakA(i,1);
    Time2(Num2(i,1),:)=t2peakB(i,1);
    AvgUnit1(Num1(i,1),:)=t1(i,:);
    AvgUnit2(Num1(i,1),:)=t2(i,:);
end

AllMax= [Max1(1:16,1) Max2(1:16,1)];
AllMin= [Min1(1:16,1) Min2(1:16,1)];
AllSpike= [nSpike1(1:16,1) nSpike2(1:16,1)];
AllTime= [Time1(1:16,1) Time2(1:16,1)];
