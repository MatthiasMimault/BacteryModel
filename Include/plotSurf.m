function plotSurf(X,Y,P,Vx,Vy,Axis)
% V1.1 Colormap winter
%% Plot        
    Pmax = 200;
    % Faster graph
    P(P>Pmax) = Pmax;
    P(P<0.1) = NaN;
    contourf(X,Y,P,100,'EdgeColor','none')
    
    % Higher resolution + 3D
%     surf(X,Y,P,'EdgeColor','none')
%     view(2)

    % Vector field
    % plotQuiver(X,Y,Vx,Vy)
    axis(Axis)
    axis normal
    axis equal
    colorbar
    colormap(winter)
    caxis([0.1 Pmax])
end

