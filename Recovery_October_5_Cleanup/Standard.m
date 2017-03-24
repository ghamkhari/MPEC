

i=2;

while i <= length(G)-1
    
    
    
    if   ismember(G(i),G(1:i-1))  &&  ~ismember(G(i),S)
        
        Node_Number=Node_Number+1;
        Link=[Link;Node_Number,  G(find(ismember(G(1:i-1),G(i)))), .08];
        Where=find(ismember(G(~ismember(G,S)),G(i)));Where=Where(2);
        a=[a(1:Where-1,:);a(Where+1:end,:);a(Where,:)];
        P_G_Max=[P_G_Max(1:Where-1,:);P_G_Max(Where+1:end,:);P_G_Max(Where,:)];
        G=[G(1:i-1);G(i+1:end);Node_Number]; 
        C=[C ;10];
        i=i-1;
    end
    
    
    if  ismember(G(i),G(1:i-1))  &&  ismember(G(i),S)
        
        Node_Number=Node_Number+1;
        Link=[Link;Node_Number,  G(find(ismember(G(1:i-1),G(i)))), .08];
        Where=find(ismember(S,G(i)));
        Where=Where(2);
        P_S_Max=[P_S_Max(1:Where-1);P_S_Max(Where+1:end);P_S_Max(Where)];
        S=[S(1:Where-1);S(Where+1:end);Node_Number];
        G=[G(1:i-1);G(i+1:end);Node_Number];  
        C=[C ;10];
        i=i-1;
    end
    
    i=i+1;
    
end

i=2;

while i <= length(D)-1
    
    if   ismember(D(i),D(1:i-1))  
        
        Node_Number=Node_Number+1;
        Link=[Link;Node_Number,  D(find(ismember(D(1:i-1),D(i)))), .08];
        b=[b(1:i-1,:);b(i+1:end,:);b(i,:)];
        P_D_Max=[P_D_Max(1:i-1,:);P_D_Max(i+1:end,:);P_D_Max(i,:)];
        D=[D(1:i-1);D(i+1:end);Node_Number]; 
        C=[C ;10];
        i=i-1;
    end
    
    i=i+1;
end





