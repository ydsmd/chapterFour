function res = SuspectSelect(D,p,Label)
    Suspect = [];
    relativeDistance = D/median(D);
    set = [relativeDistance,Label];
    a1=sortrows(set,1,'descend');
    Score = [];
    for i = 1:length(a1(:,1))
        if length(Suspect)>=p
            break;
        end
        if isempty(find(Suspect ==a1(i,2)))
            Suspect = [Suspect,a1(i,2)];
        end
    end
    for i = 1:p
    select = a1(:,2)==Suspect(i);
    Score(i) = mean(a1(select,1));
    end
    res = [Suspect;Score];
end