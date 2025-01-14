clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% projet reseaux télécoms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A = [0 10 0 100 100; 10 0 10 100 100;0 10 0 100 100;100 100 100 0 1000; 100 100 100 1000 0];
matPrejet = zeros(1,20);
matNbappels = zeros(1,20);
compteur = 0;
for l=2:5:100
    A = [0 10 0 100 100; 10 0 10 100 100;0 10 0 100 100;100 100 100 0 1000; 100 100 100 1000 0];
    cRejet = 0;                                 %compteur de rejet
    mat_appels = [];
    mat_routes = [];
    cRoutes = 0;
    nAppels = 0;
    for i=0:0.5:100
        for j=1:randi([1,l])                       %itération sur les nouveaux appels (nb aléatoire de nouveaux appels)
            r = unifrnd(1,5);                   % durée appel
            src = randi([1,3]);                 % numero de la source
            dest = randi([1,3]);                % numero de la destination
            while (dest == src)                 % on s'assure que la destination n'est pas egale à la source
                dest  = randi([1,3]);
            end
            bool = 0;                           % indique si l'appel est en cours ( 1 si terminé, 0 sinon)
            appel = [src dest r bool];
            nAppels = nAppels + 1;
            nb = rand;
            route = routage_partage_charge(A,appel,nb);
            %route = routage_statique(A,appel);
            %route = routage_dynamique(A,appel);
            cRoutes = cRoutes + 1;
            id = cRoutes;
            mat_routes = [mat_routes, route];
            appel = [src dest r bool id];          % vecteur représentant un appel
            if sum(sum(route)) ~= 0
                mat_appels = [mat_appels; appel];
                A = A - route;                  % mise à jour de l'etat des liens
            else 
                cRejet = cRejet + 1;            % appel rejeté; on incrémente le compteur de rejet
            end  
        end
        mat_appels(:,3) = mat_appels(:,3) - 0.5;  % on enlève 30 à la durée des appels en cours
        [nLigne, nColonne] = size(mat_appels);
        for k = 1:nLigne
            if (mat_appels(k,3) <= 0 && mat_appels(k,4) ==0)
                mat_appels(k,4) = 1;
                A = A + mat_routes(:,[(mat_appels(k, 5)*5 +1) : (mat_appels(k, 5)*5+5)]);       % on libère le lien (verifier les indice de mat_routes
    
            end
        end
    end
    compteur = compteur +1;
    matPrejet(1,compteur) = cRejet/nAppels;
    matNbappels(1,compteur) = nAppels;
end

figure
plot(matNbappels,matPrejet)
xlabel("nombre d'appel")
ylabel("probabilité de rejet")
