function [centroids ] = clustering_pc(points, NC)
  centroids=zeros(NC,3);
  %s-au generat 3 centroizi aleatori atfel incat acestia sa nu se suprapuna 
  nr=size(points,1); %nr este numarul de puncte primite la input
  groups=zeros(nr,1);%vector de clustere(retine in linia i indicele centroidului grupului din care face parte points(i,:)
  p=randperm(NC);
  for i=1:NC
    centroids(i,:)=points(p(i),:);
  endfor
  % se determina cel mai apropiat centroid pentru fiecare element ramas din multime (centre)
  current=zeros(1,3);
  ok=1;
  while(ok==1)
  for i=1:nr % se parcurg toate elementele multimii points
    current=points(i,:); % current este elementul din points analizat la pasul curent
    min=Inf; % min va memora distanta euclidiana minima(de la current la cel mai apropiat centroid)
    % pentru fiecare centroid, se calculeaza distanta fata de current (dist)
    for j=1:NC 
      q=centroids(j,:);
      dist=sqrt((norm(current))^2+(norm(q))^2-2*current*q');
      if(dist<min)
        min=dist;
        centre=j; %centre este indicele celui mai apropiat centroid 
      endif
    endfor
    groups(i)=centre;
  endfor
  %se recalculeaza pozitiile centroizilor
  for k=1:NC 
    N=0; % N numara cate elemente sunt in grupul centroidului curent
    %coordonatele noului centroid 
    Sx=0;
    Sy=0;
    Sz=0;
    for w=1:nr
      if(groups(w)==k) % elementul curent din points face parte din grupul centroidului de indice k
       N=N+1;
       Sx=points(w,1)+Sx; 
       Sy=points(w,2)+Sy; 
       Sz=points(w,3)+Sz; 
      endif
    endfor
    if(N!=0)
      if(Sx/N!=centroids(k,1) && Sy/N!=centroids(k,2) && Sz/N!=centroids(k,3))
        centroids(k,1)=Sx/N;
        centroids(k,2)=Sy/N;
        centroids(k,3)=Sz/N;
      else 
        ok=0;
      endif
    endif
  endfor
  endwhile  
end
