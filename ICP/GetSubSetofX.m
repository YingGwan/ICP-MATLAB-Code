function [X_subset_centerlizedMat]=GetSubSetofX(Xiter_centerPos,X_ori)

    size1=size(X_ori);
    size1=size1(2);
    for i=1:size1
        X_ori(:,i)= X_ori(:,i)-Xiter_centerPos;
    end
    X_subset_centerlizedMat=X_ori;
end