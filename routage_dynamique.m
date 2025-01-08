function [chemins] = routage_dynamique(mat_etats_liens,appel)
%UNTITLED Réalise le routage dynamique d'un réseau téléphonique
chemins=zeros(5);
mat_etats_liens=1000-mat_etats_liens;
source=appel(1);
dest=appel(2);

% Algorithme de Dijkstra
[e L] = dijkstra(mat_etats_liens,source,dest);

% Création de la matrice des chemins
for i=1:length(L)-1
    chemins(L(i),L(i+1))=1;
end

end

