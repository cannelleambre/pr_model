function [chemins] = routage_dynamique(mat_etats_liens,appel)
%UNTITLED Réalise le routage dynamique d'un réseau téléphonique
chemins=zeros(5);
mat_etats_liens2=1001-mat_etats_liens;
mat_etats_liens2(mat_etats_liens2==1001) = 0;
source=appel(1);
dest=appel(2);

% Algorithme de Dijkstra
[~,L] = dijkstra(mat_etats_liens2,source,dest);

% Création de la matrice des chemins
for i=1:length(L)-1
    if (mat_etats_liens(L(i),L(i+1))>0)
        chemins(L(i),L(i+1))=1; 
    end
    
end

end
