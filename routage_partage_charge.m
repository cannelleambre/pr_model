function [chemins] = routage_partage_charge(mat_etats_liens,appel, nb)
%ROUTAGE_PARTAGE_CHARGE Réalise le routage par partage de charge d'un
% Réseau téléphonique
% chemins=zeros(5);
% mat_probas=[0 0.06 0 0.47 0.47 ; 0.05 0 0.05 0.45 0.45 ; ...
%     0 0.06 0 0.47 0.47 ; 0.07 0.07 0.07 0 0.79 ; 0.07 0.07 0.07 0.79 0];
% mat_probas = mat_probas*nb;
% mat_probas=1-mat_probas;
% source=appel(1);
% dest=appel(2);
% 
% % Algorithme de Dijkstra
% [~,L] = dijkstra(mat_probas,source,dest);
% 
% % Création de la matrice des chemins
% for i=1:length(L)-1
%     if (mat_etats_liens(L(i),L(i+1))>0)
%         chemins(L(i),L(i+1))=1; 
%     end
% end

% NEW VERSION, NEW YEAR, NEW ME. HAPPY BIRTHDAYYYYYYYYYYYY (20 YEARS
% ALREADY ????? OMGGGGGG) I'm so bg 

liste_chemins = allpaths(graph(mat_etats_liens), appel(1), appel(2));
index = randi(1, length(liste_chemins));
chemin_trouve = liste_chemins{index};
chemins=zeros(5);
for i=1:length(chemin_trouve)-1
    if (mat_etats_liens(chemin_trouve(i),chemin_trouve(i+1))>0)
        chemins(chemin_trouve(i),chemin_trouve(i+1))=1; 
    end
end

