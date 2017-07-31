%%Sort 1
%%calculate trial number
for k=1:16
  for i=1:size(Flash,1)
    Flash(i,2)<= A{k}(:,3);
    trialstart(:,i)=ans;
  end
    allnum{k}=sum(trialstart,2);

    clear trialstart
end

clear k
clear i

%%remove spikes from before visstim start
for k=1:16
    if allnum{1,k}(1,1)==0
    [x, y]=find(allnum{1,k}(:,:)==0);
        if size(x,1) < size(allnum{1,k},1)
            removenum = max(x)+1;
            allnum{1,k}=allnum{1,k}(removenum:end,:);
            A{k,1}= A{k,1}(removenum:end,:);
        elseif size(x,1) == size(allnum{1,k},1)
            A{k,1}=zeros(1,33); 
            allnum{1,k}=0;
        end
    end
end

clear k


for k=1:16

    cellval=allnum{1,k};
    if cellval(1,1)==0
        trialtimz{k}=0;
    elseif cellval(1,1)~=0
        trialtimz{k}=A{k,1}(:,3)-Flash(cellval,1);
    end
end

clear k

for k = 1:16
    A{k}=[allnum{k} trialtimz{k} A{k}];
end

clear k

% for k = 1:16
%     big=size(A{k,1},1)-1;
%     yes=abs(A{k,1}(2:end,2)-A{k,1}(1:big,2));
%     quest=yes>0.015;
%     quest=[1;quest];
%     quest = repmat(quest,1,35);
%     test=A{k,1};
%     test= test.*quest;
% %     A{k,1}(:,1)= A{k,1}(:,1).*quest;
% %     test=A{k,1};
%     test(test==0)=[];
%     A{k,1}=test;
%     
%     clear big quest yes test
% end

%%remove spikes bigger than time
% clear k
% for k=1:16
%     if max(A{k,1}(:,2))> 1.0008
%     [x, y]=find(A{k,1}(:,2)> 1.0008);
%         if size(x,1) < size(allnum{1,k},1)
%             removenum = max(x)+1;
%             allnum{1,k}=allnum{1,k}(removenum:end,:);
%             A{k,1}= A{k,1}(removenum:end,:);
%         elseif size(x,1) == size(allnum{1,k},1)
%             A{k,1}=0; 
%             allnum{1,k}=0;
%         end
%     end
% end


%%Sort 2
%%calculate trial number

clear k
clear i
clear j
clear allnum
clear trialtimz

for k=1:16
  for i=1:size(Flash)
    Flash(i,2)<= B{k}(:,3);
    trialstart(:,i)=ans;
  end
    allnum{k}=sum(trialstart,2);

    clear trialstart
end

clear k
clear i

%%remove spikes from before visstim start
for k=1:16
    if allnum{1,k}(1,1)==0
    [x, y]=find(allnum{1,k}(:,:)==0);
        if size(x,1) < size(allnum{1,k},1)
            removenum = max(x)+1;
            allnum{1,k}=allnum{1,k}(removenum:end,:);
            B{k,1}= B{k,1}(removenum:end,:);
        elseif size(x,1) == size(allnum{1,k},1)
            B{k,1}=zeros(1,33); 
            allnum{1,k}=0;
        end
    end
end

clear k
for k=1:16

    cellval=allnum{1,k};
    if cellval(1,1)==0
        trialtimz{k}=0;
    elseif cellval(1,1)~=0
        trialtimz{k}=B{k,1}(:,3)-Flash(cellval,1);
    end
    
end

clear k

for k = 1:16
    B{k}=[allnum{k} trialtimz{k} B{k}];
end

% %%Sort 3
% %%calculate trial number
% 
% clear k
% clear i
% clear j
% clear allnum
% clear trialtimz
% 
% for k=1:16
%   for i=1:size(Flash)
%     Flash(i,2)<= C{k}(:,3);
%     trialstart(:,i)=ans;
%   end
%     allnum{k}=sum(trialstart,2);
% 
%     clear trialstart
% end
% 
% clear k
% clear i
% 
% %%remove spikes from before visstim start
% for k=1:16
%     if allnum{1,k}(1,1)==0
%     [x, y]=find(allnum{1,k}(:,:)==0);
%         if size(x,1) < size(allnum{1,k},1)
%             removenum = max(x)+1;
%             allnum{1,k}=allnum{1,k}(removenum:end,:);
%             C{k,1}= C{k,1}(removenum:end,:);
%         elseif size(x,1) == size(allnum{1,k},1)
%             C{k,1}=0;
%             allnum{1,k}=0;
%         end
%     end
% end
% 
% clear k
% for k=1:16
% 
%     cellval=allnum{1,k};
%     if cellval(1,1)==0
%         trialtimz{k}=0;
%     elseif cellval(1,1)~=0
%         trialtimz{k}=C{k,1}(:,3)-Flash(cellval,1);
%     end
%     
% end
% 
% clear k
% 
% for k = 1:16
%     C{k}=[allnum{k} trialtimz{k} C{k}];
% end
% 
% %%Sort 4
% %%calculate trial number
% 
% clear k
% clear i
% clear j
% clear allnum
% clear trialtimz
% 
% for k=1:16
%   for i=1:size(Flash)
%     Flash(i,2)<= D{k}(:,3);
%     trialstart(:,i)=ans;
%   end
%     allnum{k}=sum(trialstart,2);
% 
%     clear trialstart
% end
% 
% clear k
% clear i
% 
% %%remove spikes from before visstim start
% for k=1:16
%     if allnum{1,k}(1,1)==0
%     [x, y]=find(allnum{1,k}(:,:)==0);
%         if size(x,1) < size(allnum{1,k},1)
%             removenum = max(x)+1;
%             allnum{1,k}=allnum{1,k}(removenum:end,:);
%             D{k,1}= D{k,1}(removenum:end,:);
%         elseif size(x,1) == size(allnum{1,k},1)
%             D{k,1}=0;
%             allnum{1,k}=0;
%         end
%     end
% end
% 
% clear k
% for k=1:16
% 
%     cellval=allnum{1,k};
%     if cellval(1,1)==0
%         trialtimz{k}=0;
%     elseif cellval(1,1)~=0
%         trialtimz{k}=D{k,1}(:,3)-Flash(cellval,1);
%     end
%     
% end

% clear k
% 
% for k = 1:16
%     D{k}=[allnum{k} trialtimz{k} D{k}];
% end
  
clearvars -except A B C D AvgUnit1 AvgUnit2 ratioTP1 t2ptime1 ratioTP2 t2ptime2 Spike1 Num1...
    Spike2 Num2 Flash MyEpocs AllSpike1 totMax totSpike v BlockNum nsize spacer sortnumbs...
    BlockNum nsize v totMax totSpike totWave1 espace totWave2 logamp logamp2 logmax logmax2 logmin logmin2 amp...
    Allpeak AllspikeR BlockNum spec v nsize AllSpikeR allCV  sampleRateHz counts counts2 BigCount AllMax Allspike AllSpike Allspike1 Allspike2
