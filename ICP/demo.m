%% demo.m
% ICP - Iterative Closest Point
% Data Provided by Jakob Wilm and Martin Kjer, Technical University of Denmark, 2012
% Rewriting Author: YINGJUN TIAN, MAE, CUHK, Hong Kong

%%
close all
clear;
clc;

%% Create Data.
m = 80; % width of grid
n = m^2; % number of points

[X,Y] = meshgrid(linspace(-2,2,m), linspace(-2,2,m));

X = reshape(X,1,[]);
Y = reshape(Y,1,[]);

Z = sin(X).*cos(Y);

% Create the data point-matrix
D = [X; Y; Z];

% Translation values (a.u.):
Tx = 0.5;
Ty = -0.3;
Tz = 0.2;

% Translation vector
T = [Tx; Ty; Tz];

% Rotation values (rad.):
rx = 0.3;
ry = -0.2;
rz = 0.05;

Rx = [1 0 0;
      0 cos(rx) -sin(rx);
      0 sin(rx) cos(rx)];
  
Ry = [cos(ry) 0 sin(ry);
      0 1 0;
      -sin(ry) 0 cos(ry)];
  
Rz = [cos(rz) -sin(rz) 0;
      sin(rz) cos(rz) 0;
      0 0 1];

% Rotation matrix
R = Rx*Ry*Rz;

% Transform data-matrix plus noise into model-matrix 
M = R * D + repmat(T, 1, n);

% Add noise to model and data
rng(2912673);
M = M + 0.01*randn(3,n);
D = D + 0.01*randn(3,n);

%% One input setting
P_ori=M(:,1:3200);
X_ori=D;
figure(1);
ShowPointClouds(P_ori,X_ori);
title("Initial Position");
%P is smaller point cloud.

%% Run ICP (standard settings)

% P->X
iterSum=50;
% iterShow=2;
ShowSet=[1,2,5,10,20,50];
P_iter=P_ori;

error_i=1;
for i=1:iterSum
    
    corre=FindNearestCorrespondance(P_iter,X_ori);% X_ori's center position 
    %will change because selected points are changing at different iter.
    %That is to say, in second or further iteration, P_iter will be
    %changed.
    Xiter_centerPos=GetXCenterPos(X_ori,corre);%3X1
    %Find X_iter's center position in correspondence part.
    X_iter_centerlizedMat=GetSubSetofX(Xiter_centerPos,X_ori);
    
    P_iter_centerlized=CentrelizeMat(P_iter);%Centerlize P_iter
    Affine_iter=SolveLinearEqu(corre,P_iter_centerlized,X_iter_centerlizedMat); %Solve linear equation
    
    [U,S,V]=svd(Affine_iter);
    R_iter=U*transpose(V);
    
    T_vector=GetTranslationVector(P_iter,Xiter_centerPos,R_iter); 
    P_iter=R_iter*P_iter+T_vector;
    
    if ismember(i,ShowSet)
        figure(2*i+1);
        ShowPointClouds(P_iter,X_ori);
        str=strcat("Iteration: ",num2str(i));
        title(str);
        
        ErrorData=ComputeErrorMap(corre,P_iter,X_ori);
        ErrorSet{i}=ErrorData;
%         figure(2*i);
%         ShowPointClouds(P_ori,P_iter);
%         str=strcat("P_ori and P_iter: ",num2str(i));
%         title(str);
    end
% 

%     
end

    figure(100);
    ShowPointClouds(ErrorSet{10},ErrorSet{50});
    str=strcat("Iteration Error: ",num2str(10));
    str1=strcat(" and ",num2str(50));
    str=strcat(str,str1);
    title(str);
