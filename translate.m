function p = translate(p,t)
% p = translate(p)
% Part of the BlockDesign toolbox
%
% Translate the structure with the given transformation
%
% Coen van Leeuwen
% Jan 9, 2012

for d = 1:3
    p(:,d) = p(:,d) + t(d);
end

end