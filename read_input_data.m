function [NC points] = read_input_data(file_params, file_points)
	NC=0;
	points=[];
  fid1=fopen(file_params,'r');
  NC=fscanf(fid1,"%d",1);
  fclose(fid1);
  fid2=fopen(file_points,'r');
  points=dlmread(fid2,' ',5,0);
  fclose(fid2);
end

