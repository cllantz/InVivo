% This Script sorts units by sort code 1, and electrode number

Y= zeros(100,33);

%%Find amplitude of each unit and remove sorted units that are impossibly large or impossibly small.
allmax=max(tabletest(:,4:end),[],2);
allmin=min(tabletest(:,4:end),[],2);
amp=abs(allmax-allmin);
logamp = amp>0.4e-04;
logmax = allmax<3.50e-04;
logmin = allmin>-3.50e-04;


tabletest=tabletest.*repmat(logmax,1,33);
tabletest=tabletest.*repmat(logmin,1,33);
tabletest=tabletest.*repmat(logamp,1,33);

%% Sort by electrode number (1 -16)
A = arrayfun(@(x) tabletest(tabletest(:,1) == x, :), unique(tabletest(:,1)), 'uniformoutput', false);

first=A{1,1}(1,1);

if first == 0
    A=A(2:end);
end

sm=size(A,1)+1;

if sm==17
    A=A;
elseif sm <= 16
    for i=sm:16
    A{i,1}=Y;
    end
end

for d=1:16
 if size(A{d},1)==1
     A{d}=[A{d};A{d}];
 elseif size(A{d},1)> 1
     A{d}=A{d};
 end
end
