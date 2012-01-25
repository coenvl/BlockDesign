function [p ellipsness] = ellipse(w, l)
% p = ellipse(w, l)
% Part of the blockdesign toolbox
%
% Create an ellipse with given width and length at centre point 0,0. If you
% want to translate the ellipse, you simply add the translation to any of
% the columns.
%
% see also: RING
%
% Coen van Leeuwen
% Jan 24, 2012

if (w > l)
    t = w;
    w = l;
    l = t;
end

a = l / 2;
b = w / 2;
f = sqrt((a.^2) - (b.^2));

p = [];
ellipsness = [];
for x = 0:a
    for y = 0:b %See footnote
        d1 = sqrt(abs(x-f).^2 + abs(y).^2); 
        d2 = sqrt(abs(x+f).^2 + abs(y).^2);
        if (abs(d1 + d2 - (2*a)) <= 1)
             p = [p; [x y 0]; [x -y 0]; [-x y 0]; [-x -y 0]];
        end
    end
end

p = unique(p, 'rows');