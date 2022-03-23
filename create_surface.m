function [surface] = create_surface(table_file)
surface_points = readtable(table_file);
x = table2array(surface_points(:,3));
y = table2array(surface_points(:,2));
z = table2array(surface_points(:,4));

stem3(x, y, z);
xv = linspace(min(x), max(x), 20);
yv = linspace(min(y), max(y), 20);
[X,Y] = meshgrid(xv, yv);
Z = griddata(x,y,z,X,Y);
surface = surf(X, Y, Z);
set(gca, 'ZLim',[-10 20])
shading interp
end

