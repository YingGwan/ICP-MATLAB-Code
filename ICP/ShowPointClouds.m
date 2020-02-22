function []=ShowPointClouds(PointCloud1,PointCloud2)

     size1=size(PointCloud1);
     if size1(1)==3
        PointCloud1=transpose(PointCloud1);
     end
     
     size2=size(PointCloud2);
     if size2(1)==3
        PointCloud2=transpose(PointCloud2);
     end
        
     
     pcshow(PointCloud1);
     hold on;
     pcshow(PointCloud2);
     xlabel("X");
     ylabel("Y");
     zlabel("Z");
    
end
