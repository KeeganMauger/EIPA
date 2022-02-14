close all
clc
clear all
set(0,'DefaultFigureWindowStyle','docked')

nx = 50;
ny = 50;
G = sparse(nx*ny);
V = zeros(nx,ny);

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i == 1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == 1
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nyp = j+1 + (i-1)*ny;
            
            G(n,n) = 1;
        elseif j == ny
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nym = j-1 + (i-1)*ny;
            
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            
            G(n,n) = -(4);
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end
            
    end
end
figure(1)
spy(G)
figure(2)
[E,D] = eigs(G,9,'SM');
plot(diag(D),'o')
figure(3)
% Remapping

numModes = 9;
for k = 1:numModes
    for i = 1:nx
        for j = 1:ny
            n = j + (i-1)*ny;
            V(i,j) = E(n,k);
        end
    end
    subplot(3,3,k)
    surf(V)
end

% surf(V)
        
            
            
            
            
            
            
    