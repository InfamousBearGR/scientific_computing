function [error] = erotima5(m,n)
% Author : ΑΒΡΑΜΟΠΟΥΛΟΣ ΜΙΧΑΗΛ , ΑΜ 1067451 , Date : 13/1/2022
T = toeplitz([4,-1,zeros(1,m-2)]);
S = blkToeplitzTrid(n,inv(T),T^2,T);
y = eye(n*m,1);
x = ones(n*m,1);
[val,brow_idx,bcol_ptr] = sp_mx2bccs(S,m);
y1 = y + S*x;
[y2]= spmv_bccs(y,x,m,val,brow_idx,bcol_ptr);
error = norm(y1-y2);