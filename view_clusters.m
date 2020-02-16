function view_clusters(points, centroids)
  nc=size(centroids,1); %numarul de centroizi
  [centroids]=clustering_pc(points, nc);
	n=size(points,1); %n este numarul de puncte
  %se determina pentru fiecare punct din points centroidul cel mai apropiat
  groups=zeros(n,1);
  for i=1:n
    min=Inf;
    current=points(i,:);
    for j=1:nc
      q=centroids(j,:);
      dist=sqrt((norm(current))^2+(norm(q))^2-2*current*q');
      if(dist<min)
        min=dist;
        groups(i)=j; 
      endif
    endfor
  endfor
  colors='ymcrgb';
  % y yellow,m magenta,c cyan,r red,g green,b blue
  for i=1:n
    vx=points(i,1);
    vy=points(i,2);
    vz=points(i,3);
    scatter3(vx,vy,vz,'filled','square','markerFaceColor',colors(groups(i)));
    box on;
    set (gca, "boxstyle", "full");
    set(gca,'XDir','reverse'); 
    hold on; %pastreaza pe grafic punctele afisate la pasul precedent
  endfor
end
