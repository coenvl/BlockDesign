function blocks = pixelplot(p, color, res, linewidth)
% num = pixelplot(p, color, res, linewidth)
% Part of the BlockDesign toolbox
%
% This function plots a 3D design of the points in p. For each point a cube
% is drawn with the defined colors. Each cube has the size defined in res,
% and is drawn with the given linewidth.
%
% The color argument takes a Nx3 matrix, in which each row defines a color.
% The first row is the top of the cube, the second row the bottom, third is
% the front, then bottom, then left and finally right. If you put less then
% six rows, then the colors are cycled.
%
% Note that all arguments but the first are optional. The default color is
% a variation of grey shades, the default resolution is 1 and the linewidth
% is .1
%
% See also: PIXELPLOT3
%
% Coen van Leeuwen
% Jan 7, 2012

if nargin < 2 || isempty(color)
    color = [.8 .8 .8];
end

if nargin < 3 || isempty(res)
    res = 1;
end

if nargin < 4 || isempty(linewidth)
    linewidth = .1;
end

xPix = res * [0 0 1 1];
yPix = res * [0 1 1 0];

p = unique(p, 'rows');

blocks = size(p,1);

if blocks == 0
    return;
end

X = p(:,1) * ones(1,4) + ones(blocks, 1) * xPix;
Y = p(:,2) * ones(1,4) + ones(blocks, 1) * yPix;

patch(X', Y', zeros(size(X))', color, 'lineWidth', linewidth);   %Top

axis equal;

xlim([min(p(:,1)) max(p(:,1)) + 1]);
ylim([min(p(:,2)) max(p(:,2)) + 1]);

title(['Number of blocks: ' num2str(blocks)]);

end

