function p = ring(radius)
% p = ring(radius)
% Part of the blockdesign toolbox
%
% Create a ring with a given radius at centre point 0,0. If you want to
% translate the ring, you simply add the translation to any of the
% columns.
%
% see also: SQUARE SPHERE
%
% Coen van Leeuwen
% Jan 8, 2012

if mod(radius, 1) == 0.5
    start = .5;
else
    start = 0;
end

p = [];
for x = start:radius
    for y = start:radius %See footnote
        if abs((x^2) + (y^2) - (radius^2)) <= radius
            p = [p; [x y 0]; [x -y 0]; [-x y 0]; [-x -y 0]];
        end
    end
end

p = unique(p, 'rows');

% Note: Actually we should be able to calculate Y, and perhaps also for the
% other values. The problem however is that the equation may be true for
% multiple values of Y, creating a set of block next to eachother within 
% the sphere. If the exact value is calculated, only 1 block is drawn. The 
% same holds for Z and X.