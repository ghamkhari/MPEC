function Expr_Set=Expression_Product_Self(Expr1)

Expr_Set=[];

for i=1:length(Expr1)
    Small_Set=[];
    for j=i:length(Expr1)
        if ShowDegree(Expr1(i))==1 && ShowDegree(Expr1(j))==1
        Small_Set=[Small_Set; Expr1(i)*Expr1(j)];
        end
    end
    Expr_Set=[Expr_Set; Small_Set];
end