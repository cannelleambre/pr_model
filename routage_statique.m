function [chemins] = routage_statique(mat_etats_liens,appel)
%ROUTAGE_STATIQUE Réalise le routage statique d'un réseau téléphonique
chemins=zeros(5);
    % Appel de 1 vers 2
    if(appel(1)==1 && appel(2)==2)
        if (mat_etats_liens(1,4)>0 && mat_etats_liens(4,2))
            chemins(1,4)=1;
            chemins(4,2)=1;
        end
    end

    % Appel de 1 vers 3
    if(appel(1)==1 && appel(2)==3)
        if (mat_etats_liens(1,5)>0 && mat_etats_liens(5,3))
            chemins(1,5)=1;
            chemins(5,3)=1;
        end
    end

    % Appel de 2 vers 3
    if(appel(1)==2 && appel(2)==3)
        if (mat_etats_liens(2,5)>0 && mat_etats_liens(5,3))
            chemins(2,5)=1;
            chemins(5,3)=1;
        end
    end

end

