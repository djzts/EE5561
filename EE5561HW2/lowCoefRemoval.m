function J_new =lowCoefRemoval(J)
    J_new=0.*J;
    Array=abs(reshape(J,1,[]));
    Top_10_list=maxk(Array,10);
    for num=Top_10_list
        [row,col] = find(abs(J)==num);
        for m=1:length(row)
            if(sum(sum(abs(J_new)>0))==10)
                break;
            end
            J_new(row(m),col(m))=J(row(m),col(m));
        end
    end
end