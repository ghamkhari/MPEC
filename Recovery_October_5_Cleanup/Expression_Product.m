% function Expr_Set=Expression_Product(Expr1,Expr2)
% 
% Expr_Set=Fastvar(zeros(length(Expr1)*length(Expr2),1));
% 
% Counter=1;
% for i=1:length(Expr1)
%     for j=1:length(Expr2)
%         if ShowDegree(Expr1(i))==1 && ShowDegree(Expr2(j))==1
%         Expr_Set(Counter)=Expr1(i)*Expr2(j);
%         end
%         Counter=Counter+1;
%     end
% end

function Expr_Set=Expression_Product(Expr1,Expr2)

Expr_Set=[];

for i=1:length(Expr1)
    Expr_Small_Set=[];
    for j=1:length(Expr2)
        if ShowDegree(Expr1(i))==1 && ShowDegree(Expr2(j))==1
        Expr_Small_Set=[Expr_Small_Set; Expr1(i)*Expr2(j)];
        end
    end
    Expr_Set=[Expr_Set; Expr_Small_Set];
end