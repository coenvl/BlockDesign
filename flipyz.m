function p = flipyz(p)
% p = flipyz(p)
% Part of the BlockDesign toolbox
%
% Simply flips the Y and the Z coordinate of a structure. This means that
% left will be top, and right will be bottom.
%
% See also: FLIPXY, FLIPXZ
%
% Coen van Leeuwen
% Jan 8, 2012

Y = p(:,2);
p(:,2) = p(:,3);
p(:,3) = Y;

end

