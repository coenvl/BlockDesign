function p = pointline(x,y,res)
%POINTLINE Summary of this function goes here
%   Detailed explanation goes here

if nargin < 3
    res = 100;
end

npoints = size(x,2);

p = [];
for i = 1:npoints
    p = [p; [linspace(x(i), x(mod(i,npoints)+1), res)' ...
             linspace(y(i), y(mod(i,npoints)+1), res)']];
end

p = round(p);
p = unique(p, 'rows');

end

