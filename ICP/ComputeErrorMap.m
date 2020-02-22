function [ErrorData]=ComputeErrorMap(corre,P_iter,X_ori)
    size_P=size(P_iter);
    size_P=size_P(2);
    
    for i=1:size_P
        x=X_ori(1,corre(i))-P_iter(1,i);
        y=X_ori(2,corre(i))-P_iter(2,i);
        z=X_ori(3,corre(i))-P_iter(3,i);
        err=x^2+y^2+z^2;
        err=sqrt(err);
        P_iter(3,i)=err;
    end
    ErrorData=P_iter;
    
end