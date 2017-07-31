Y= zeros(100,33);

clear allmax max min amp

allmax=max(tabletest2(:,4:end),[],2);
allmin=min(tabletest2(:,4:end),[],2);
amp=abs(allmax-allmin);
logamp2 = amp>0.4e-04;
logmax2 = allmax<3.50e-04;
logmin2 = allmin>-3.50e-04;


tabletest2=tabletest2.*repmat(logmax2,1,33);
tabletest2=tabletest2.*repmat(logmin2,1,33);
tabletest2=tabletest2.*repmat(logamp2,1,33);

B = arrayfun(@(x) tabletest2(tabletest2(:,1) == x, :), unique(tabletest2(:,1)), 'uniformoutput', false);


first=B{1,1}(1,1);

if first == 0
    B=B(2:end);
end

sm=size(B,1)+1;

if sm==17
    B=B;
elseif sm <= 16
    for i=sm:16
    B{i,1}=Y;
    end
end

for d=1:16
 if size(B{d},1)==1
     B{d}=[B{d};B{d}];
 elseif size(B{d},1)> 1
     B{d}=B{d};
 end
end
