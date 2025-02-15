In cadrul rezolvarii primului task al temei, citirea datelor de intrare, am folosit 2 identificatori de fisier, fid1 respectiv fid2, pentru deschiderea fisierelor file_params resprectiv file_points in modul de deschidere read. Pentru file_params am citit numarul de puncte folosind instructiunea fscanf, iar pentru citirea matricei de puncte din file_points am folosit instructiunea dlmread(fid2,' ',5,0) care citeste datele numerice din fisier si le converteste automat in format matriceal,citirea incepand de la linia 5, coloana 0.

In cadrul taskului 2, pentru generarea initiala a NC centroizi alesi aleator din multimea de puncte (matricea points), am folosit functia randperm(NC) pentru generarea unui numar intreg din intervalul [1 NC] (astfel incat cei NC centroizi se vor initializa cu primele NC puncte din multimea points, ordinea acestora fiind aleatoare).

Dupa calcularea distantei minime de la fiecare element al multimii points pana la cei NC centroizi initializati anterior, pentru a atribui fiecare punct grupului reprezentat de cel mai apropiat centroid, am definit un vector (groups) de nr linii, initial continand doar 0, si care in final va retine pe linia i indicele centroidului asociat grupului in care este inclus punctul de pe linia i din matricea points (indicii centroizilor vor avea valori de la 1 la NC). Pentru a include elementul din matricea points in grupul corespunzator, la gasirea celui mai apropiat centroid fata de elementul de pe linia i al matricei, am atribuit elementului groups(i) valoarea indicelui centroidului identificat prin calcularea distantelor euclidiene.

In continuare, pentru determinarea pozitiilor centroizilor ca fiind centrele de masa ale punctelor atribuite fiecarui grup, am calculat pentru fiecare din cei NC centroizi suma coordonatelor punctelor care fac parte din grupul centroidului curent(validarea apartenentei punctului de pe linia w din matricea points la grupul centroidului de indice k se face verificand valoarea situata de pozitia w in vectorul groups). Varibila N memoreaza pentru fiecare centroid numarul de elemente continute in grupul asociat acestuia, sumele determinate anterior impartindu-se la N pentru aflarea centrului de masa aferent grupului unui anume centroid. 
Apoi se reatribuie punctele din multimea points grupurilor asociate noilor centroizi si se recalculeaza pozitiile centroizilor pana cand acestea nu se modifica. Pentru a verifica daca pozitiile centroizilor se modifica sau nu, am folosit variabila test ok, initializata cu 1, care ia valoarea 0 atunci cand pozitiile centroizilor calculate la pasul curent sunt egale cu cele de la pasul precedent.

In rezolvarea taskului 3, Vizualizarea rezultatului K-Means, am folosit vectorul groups cu exact aceeasi structura si semnificatie ca in cadrul taskului anterior. Acesta a fost definit determinand pentru fiecare punct din points centroidul fata de care distanta euclidiana este minima. Apoi am memorat, pentru punctul de pe linia i din matrice, indicele asociat centroidului cel mai apropiat. Vectorul groups ar putea fi returnat in cadrul functiei clustering_pc(points, NC) pentru a nu fi nevoie sa il determinam la fiecare utilizare, insa antetul acestei functii prezinta in scheletul de cod, ca rezultat, doar matricea de centroizi. Pentru reprezentarea grafica a punctelor am folosit instructiunea scatter3 care primeste ca argumente coordonatele x,y,z ale punctelor, acestea fiind extrase din matricea points. Pentru a reprezenta punctele de culori diferite in functie de grupul din care fac parte, am definit sirul de caractere colors='ymcrgb' care memoreaza initialele culorilor predefinite si am trimis ca parametru functiei scatter3 unul din caracterele acestui sir, indicele caracterului fiind dat de valoarea lui groups(i) (pentru ca punctele din acelasi grup sa fie reprezentate cu aceeasi culoare). Instructiunea 'hold on' este folosita pentru a pastra pe grafic si punctele de la pasul anterior(in absenta acesteia graficul ar contine doar ultimul punct din matricea points).
Pentru rezolvarea taskului 4, functia de cost, am determinat din nou grupul asociat fiecarui centroid la fel ca la taskul anterior. Apoi, pentru fiecare din cei NC centroizi, am parcurs multimea de puncte, identificand elementele care fac parte din grupul centroidului curent si insumand distantele euclidiene(distantele de la centroidul evaluat la pasul curent pana la fiecare element din grupul asociat centroidului).

![alt-text](https://github.com/andreea-h/Tema1-Metode-Numerice--k-means-Clustering/blob/master/figure_1_2.png)

Pentru rezolvarea taskului 5 al temei, Determinarea numarului de grupuri, am memorat in points matricea de puncte din fisierul file_points primit ca parametru de functia view_cost_vs_nc, la fel ca in cadrul taskului 1.  Asa cum este sugerat in enuntul temei, am considerat variabil numarul de clustere, apeland clustering_pc(points,NC) cu NC luand pe rand valori din [1,10], apoi am determinat pentru fiecare valoare a lui NC costul si am memorat in vectorul cost_v valoarea calculata anterior. In final am apelat functia plot care primeste ca parametri 2 vectori, primul continand valori pentru x (numerele intregi din intervalul [1 10]) si al doilea valorile calculate anterior pentru cost(memorate in vectorul cost_v). Un minus in rezolvarea taskului 5 il reprezinta timpul ineficient de executie obtinut.












