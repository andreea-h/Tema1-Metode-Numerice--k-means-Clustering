function view_cost_vs_nc(file_points)
   fid=fopen(file_points,'r');
   points=dlmread(fid,' ',5,0);
   fclose(fid);
   cost_v=zeros(10,1);
	 for i=1:10
    [centroids]=clustering_pc(points,i);
    cost=compute_cost_pc(points,centroids);
    cost_v(i)=cost;
   endfor
   vect=[1:10];
  plot(vect,cost_v);
  ylim([100 700]); 
end

