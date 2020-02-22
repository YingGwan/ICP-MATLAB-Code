function [R]=SolveLinearEqu(corre,P_iter_centerlized,Xori_centerlized)
    %A X = B;
    
    %%
    %Establish B matrix
    size_P=size(P_iter_centerlized);
    size_P=size_P(2);
   % disp(size_P);
    for i=1:size_P
        index=corre(1,i);
        B(:,i)=Xori_centerlized(:,index);
    end
    B=transpose(B);
    %%
    %Establish A matrix
    A=transpose(P_iter_centerlized);
   
    
    %%
    %Linear solver
    A_TRAN=transpose(A);
    solve=inv(A_TRAN*A)*A_TRAN*B;
    R=transpose(solve);
  
    
end