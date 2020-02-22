function []=outputOBJ(Mat)
    fileID = fopen('exp.obj','w');
    size1=size(Mat);
    if size1(1)==3
        Mat=transpose(Mat);
        size2=size1(2);
        disp("Transpose")
    else
        size2=size1(1);
        disp("No transpose")
    end
    fprintf(fileID,'%6d %12s\r\n',size2,'vertices');
    fprintf(fileID,'v %12.8f %12.8f %12.8f\r\n',Mat);
end