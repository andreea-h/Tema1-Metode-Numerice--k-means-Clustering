function cost = compute_cost_pc(points, centroids)
	cost=0; 
  nc=size(centroids,1); % nc este numarul de clustere
  n=size(points,1);
	[centroids]=clustering_pc(points, nc);
  % se determina grupul din care face parte fiecare punct din matricea points
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
  for i=1:nc 
    p=centroids(i,:); 
    for j=1:n
      q=points(j,:);
      if(groups(j)==i) 
        cost=cost+sqrt((norm(p))^2+(norm(q))^2-2*p*q');
      endif
    endfor
  endfor
end

