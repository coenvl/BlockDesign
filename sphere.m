function p = sphere(radius)
% p = sphere(radius)
% Part of the blockdesign toolbox
%
% Create a sphere with a given radius at centre point 0,0. If you want to
% translate the sphere, you simply add the translation to any of the
% columns.
%
% Coen van Leeuwen
% Jan 7, 2012

if mod(radius, 1) == 0.5
    start = .5;
else
    start = 0;
end

p = [];
for z = start:radius
    for x = start:radius
        for y = start:radius %See footnote
            if abs((x^2) + (y^2) + (z^2) - (radius^2)) <= radius
                p = [p; [x y z]; [x -y z]; [-x y z]; [-x -y z]; [x y -z]; [x -y -z]; [-x y -z]; [-x -y -z]];
            end
        end
    end
end

% Note: Actually we should be able to calculate Y, and perhaps also for the
% other values. The problem however is that the equation may be true for
% multiple values of Y, creating a set of block next to eachother within 
% the sphere. If the exact value is calculated, only 1 block is drawn. The 
% same holds for Z and X.