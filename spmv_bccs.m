function [y]= spmv_bccs(y,x,nb,val,brow_idx,bcol_ptr)
n = length(bcol_ptr)-1;
p=1;
for j=1:n
    pos1=bcol_ptr(j);
    pos2=bcol_ptr(j+1)-1;
   for w = pos1:pos2
       for col=nb-1:-1:0
           for i = nb-1:-1:0
                y(brow_idx(w)*nb-i) = y(brow_idx(w)*nb-i) + x(j*nb-col)*val(p);
                p = p + 1;
           end
       end
   end
end
