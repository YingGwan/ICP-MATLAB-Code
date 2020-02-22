function [X_centerlizedMat]=CentrelizeMat(X_ori)
    size_X=size(X_ori);
    size_X=size_X(2);
    
    x_aver=sum(X_ori(1,:))/size_X;
    y_aver=sum(X_ori(2,:))/size_X;
    z_aver=sum(X_ori(3,:))/size_X;
    for i=1:size_X
        X_centerlized(1,i)=X_ori(1,i)-x_aver;
        X_centerlized(2,i)=X_ori(2,i)-y_aver;
        X_centerlized(3,i)=X_ori(3,i)-z_aver;
    end
    X_centerlizedMat=X_centerlized;
    
end