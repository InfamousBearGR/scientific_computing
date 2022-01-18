function [val,brow_idx,bcol_ptr] = sp_mx2bccs(A,nb)
% Author : ΑΒΡΑΜΟΠΟΥΛΟΣ ΜΙΧΑΗΛ , ΑΜ 1067451 , Date : 27/12/2021
s = size(A,1);

if (mod(s,nb) == 0) % το nb πρέπει να έχει υπόλοιπο 0 με το μέγεθος της μίας πλευράς του Α για να το χωρίσει σε ίσα τμήματα
    m(1,1:s/nb) = nb;
    A = mat2cell(A, m, m); % μετρέπουμε το Α σε cell matrix για να μας διευκολύνει με τις πράξεις μας
    F = cellfun(@find, A, 'UniformOutput', false); % βρίσκουμε τα cells με τα μη μηδενικά στοιχεία
    f = cellfun(@isempty, F); % τα οποία cells τα σημειώνουμε αν είναι άδεια (δηλαδή αν αποτελούνται μόνο από μηδενικά στοιχεία)
    Sum = sum(f(:) == 0); % βρίσκουμε πόσα cells έχουν μη μηδενικά στοιχεία
    val = zeros(1,Sum*nb*nb); % κάνουμε init τους πίνακες val, bcol_ptr
    bcol_ptr = zeros(1,1+s/nb); 
    bcol_ptr(1,1) = 1;
    [i,j] = find(~f); % βρίσκουμε τις θέσεις των cells με μη μηδενικά στοιχεία
    brow_idx = transpose(i); % το i μας δίνει κατευθείαν το brow_idx
    n = size(i, 1);
    for a = 1:n
        if a == 1
            p = 1;
        else
            p = (a - 1) * nb^2 + 1;
        end
        for b = 1:nb
            for c = 1:nb
                val(1, p) = A{i(a,1),j(a,1)}(c,b); % εισάγουμε 
                p = p + 1;
            end
        end
    end
    for  k = 2:s/nb+1
        bcol_ptr(k) = bcol_ptr(k-1) + size(j(j==k-1),1);
    end
    else
    disp('Error, nb must have 0 remainder in division with the size of A!')
end
