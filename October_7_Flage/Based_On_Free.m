function      Expand_B_Prime=Based_On_Free(B,Free_Pivots)


Leading_Pivots=setdiff(1:size(B,2),Free_Pivots);


A=[];
for j=1:length(Leading_Pivots)
    A=[A, B(:,Leading_Pivots(j))];
end

for j=1:length(Free_Pivots)
    A=[A, B(:,Free_Pivots(j))];
end

Reduced_Ech=rref(A);
B_Prime=-Reduced_Ech(:,length(Leading_Pivots)+1:end);

Expand_B_Prime=[];
Leading_Count=0;
Free_Count=0;
for i=1:size(B,2)
    if sum(i==Free_Pivots)>0
        Diagonal=eye(length(Free_Pivots));
        Free_Count=Free_Count+1;
        Expand_B_Prime=[Expand_B_Prime; Diagonal(Free_Count,:)];
    else
        Leading_Count=Leading_Count+1;
        Expand_B_Prime=[Expand_B_Prime; B_Prime(Leading_Count(),:)];

    end
end


