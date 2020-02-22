function [Xcenter]=GetXCenterPos(X_ori,Corre)
    size_Sum=size(Corre);
    size_Sum=size_Sum(2);
    xsum=0;
    ysum=0;
    zsum=0;
    for i=1:size_Sum
        xsum=xsum+X_ori(1,Corre(1,i));
        ysum=ysum+X_ori(2,Corre(1,i));
        zsum=zsum+X_ori(3,Corre(1,i));
    end
    
    Xcenter(1,1)=xsum/size_Sum;
    Xcenter(2,1)=ysum/size_Sum;
    Xcenter(3,1)=zsum/size_Sum;
end