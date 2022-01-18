# Scientific Computing

A Matlab exercise given by our teacher.

`sp_mat2latex` takes a square sparse matrix and converts it to CSR or CSC depending on the sp_type ('csc' or 'csr). The output is val,row_ip,col_ip. Lastly the results are saved in a tex file called erot1.tex.

`blkToeplitzTrid` takes 3 matrices (A, B, C) size m x m and makes a tridagonial Toeplitz matrix with A, B, C blocks in the diagonal region, n is the number for creating the final nm x nm matrix.

`sp_mx2bccs` takes a sparse square matrix and converts it to BCCS, nb is the size of the blocks for BCCS. The output is val,brow_idx,bcol_ptr.

`spmv_bccs` uses the output of a BCCS matrix, 2 arrays (x, y) and nb (the size of the blocks of BCCS) to calculate the equation y <- y + Ax.

`erotima5` creates a Toeplitz matrix T and and the another S matrix based on `blkToeplitzTrid`, then 2 arrays are created (x, y) with values. The user defines m, n which you can see in the code where they are used and then the equation `y=y+Sx` is done in 2 ways, the Matlab way (just `y=y+Sx`) and after using `sp_mx2bccs` on S and then `spmv_bccs`. In the end the norm-2 difference is calculated in the 2 different methods to determine the error.
