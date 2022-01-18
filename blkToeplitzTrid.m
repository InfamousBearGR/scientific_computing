function [F] = blkToeplitzTrid(n,B,A,C)
% Author : ΑΒΡΑΜΟΠΟΥΛΟΣ ΜΙΧΑΗΛ , ΑΜ 1067451 , Date : 21/12/2021
F = cell(n);
m = size(A);

for i = 1:n
    for j = 1:n
        if (i == j)
            F{i,j} = A;
        elseif (i + 1 == j)
            F{i,j} = C;
        elseif (i == j + 1)
            F{i,j} = B;
        else
            F{i,j} = zeros(m(1));
        end
    end
end
F = cell2mat(F);