function [t]=GetTranslationVector(P_iter,Xiter_centerPos,R_iter)
    %P is 3X3200 Xiter_centerPos is 3X1 R_iter is 3X3
    Xsum=0;Ysum=0;Zsum=0;
    
    size1=size(P_iter);
    size1=size1(2);
    
    for i=1:size1
       Xsum=Xsum+P_iter(1,i);
       Ysum=Ysum+ P_iter(2,i);
        Zsum=Zsum+P_iter(3,i);
    end
    P_center(1,1)=Xsum/size1;
    P_center(2,1)=Ysum/size1;
    P_center(3,1)=Zsum/size1;
    
    t=Xiter_centerPos-R_iter*P_center;
    
end