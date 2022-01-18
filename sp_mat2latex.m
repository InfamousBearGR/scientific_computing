function [val,row_ip,col_ip] = sp_mat2latex(A, sp_type)
% Author : ΑΒΡΑΜΟΠΟΥΛΟΣ ΜΙΧΑΗΛ , ΑΜ 1067451 , Date : 15/12/2021
    if strcmp(sp_type, 'csr')
        A = transpose(A); % η find με transposed A μας δίνει row_ptr αλλίως μας δίνει col_ptr (δηλαδή csc)
    end
    [M,n,val] = find(A);  % το n μας δίνει σε ποιο row ή col βρέθηκε non-zero αλλά εμείς θέλουμε να βρούμε τα ptr όχι indexes
    sizeA = size(A);
    N = zeros(sizeA(2)+1,1); % το array πάντα είναι n + 1, οπού n ο αριθμός των rows (σε csr) ή cols (σε csc)
    N(1) = 1;
    for  k = 2:sizeA(2)+1
        N(k) = N(k-1) + size(n(n==k-1),1); % προσθέτουμε τον αριθμό των μη μηδενικών που βρέθηκε στο k-1 row (csr) στη k-οστή θέση
    end
    % από εδώ και κάτω είναι τα prints για το tex αρχείο
    v = size(val);
    edit 'erot1.tex';
    f = fopen('erot1.tex', 'w');
    fprintf(f, '\\begin{center}\n');
    fprintf(f, 'val = \\begin{tabular}{|');
    for k = 1:v(1)
        fprintf(f, 'l|');
    end
    fprintf(f, '} \\hline\n');
    fprintf(f, '%0.4f', val(1,1));
    for t = 2:v(1)
        fprintf(f, ' & %0.4f', val(t,1));
    end
    fprintf(f, '\\\\ \\hline\n\\end{tabular}\n\\\\\n\\vspace{\\baselineskip}\n');
    v = size(M);
    fprintf(f, 'IA = \\begin{tabular}{|');
    for k = 1:v(1)
        fprintf(f, 'l|');
    end
    fprintf(f, '} \\hline\n');
    fprintf(f, '%i', M(1,1));
    for t = 2:v(1)
        fprintf(f, ' & %i', M(t,1));
    end
    fprintf(f, '\\\\ \\hline\n\\end{tabular}\n\\\\\n\\vspace{\\baselineskip}\n');
    
    v = size(N);
    fprintf(f, 'JA = \\begin{tabular}{|');
    for k = 1:v(1)
        fprintf(f, 'l|');
    end
    fprintf(f, '} \\hline\n');
    fprintf(f, '%i', N(1,1));
    for t = 2:v(1)
        fprintf(f, ' & %i', N(t,1));
    end
    
    fprintf(f, '\\\\ \\hline\n\\end{tabular}\n\\\\\n\\vspace{\\baselineskip}\n');
    fprintf(f, '\\end{center}\n');
    fclose(f);
    if strcmp(sp_type, 'csr')
        col_ip = M; 
        row_ip = N;
    else
        col_ip = N; 
        row_ip = M;
    end

