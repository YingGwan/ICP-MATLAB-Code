fid=fopen("C:\Users\Yingjun\Desktop\MATLAB_WORKSPACE\ICP&NICP\ICP\model1.txt","r")
fid2=fopen("C:\Users\Yingjun\Desktop\MATLAB_WORKSPACE\ICP&NICP\ICP\model1_data.txt","w")
% a="hello world!"
% fprintf(fid2,'%s\n',a); [name,data1,data2,data3]=
ans1=fscanf(fid,'%*s %f %f %f ',[inf,3]);


fclose('all')