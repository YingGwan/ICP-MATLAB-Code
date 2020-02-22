function [Corre]=FindNearestCorrespondance(P_iter,X_ori)
        
    size_P=size(P_iter);
    size_P=size_P(2);
    
    size_X=size(X_ori);
    size_X=size_X(2);
  
    
    for i=1:size_P
       
        smallest=1e10;
        correspondence(1,i)=0;
     
        for j=1:size_X
             dis=(P_iter(1,i)-X_ori(1,j))^2+(P_iter(2,i)-X_ori(2,j))^2+(P_iter(3,i)-X_ori(3,j))^2;
             if dis<smallest
                 smallest=dis;
                 correspondence(1,i)=j;
             end
        end
%         if mod(i,100)==0
%             disp(i/size_P);
%         end
    end
    Corre=correspondence;
end