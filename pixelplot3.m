function blocks = pixelplot3(p, color, res, linewidth)
% num = pixelplot3(p, color, res, linewidth)
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
% See also: PIXELPLOT
%
% Coen van Leeuwen
% Jan 7, 2012

if nargin < 2 || isempty(color)
    color = [.8 .8 .8; .1 .1 .1; .4 .4 .4; .5 .5 .5; .6 .6 .6; .5 .5 .5];
end

if size(color,1) < 6
    color = repmat(color, ceil(6 / size(color,1)), 1);
end

if nargin < 3 || isempty(res)
    res = 1;
end

if nargin < 4 || isempty(linewidth)
    linewidth = .1;
end

xPixA = res * [0 0 1 1];
yPixA = res * [0 1 1 0];
zPixA = res * [0 0 0 0];

xPixB = xPixA;
yPixB = zPixA;
zPixB = yPixA;

xPixC = zPixA;
yPixC = yPixA;
zPixC = xPixA;

p = unique(p, 'rows');

blocks = size(p,1);

XA = p(:,1) * ones(1,4) + ones(blocks, 1) * xPixA;
YA = p(:,2) * ones(1,4) + ones(blocks, 1) * yPixA;
ZA = p(:,3) * ones(1,4) + ones(blocks, 1) * zPixA;

XB = p(:,1) * ones(1,4) + ones(blocks, 1) * xPixB;
YB = p(:,2) * ones(1,4) + ones(blocks, 1) * yPixB;
ZB = p(:,3) * ones(1,4) + ones(blocks, 1) * zPixB;

XC = p(:,1) * ones(1,4) + ones(blocks, 1) * xPixC;
YC = p(:,2) * ones(1,4) + ones(blocks, 1) * yPixC;
ZC = p(:,3) * ones(1,4) + ones(blocks, 1) * zPixC;

try
    set(gcf, 'renderer', 'opengl')
catch ME
    fprintf('Unable to select OpenGL');
end

patch(XA', YA', ZA'+1, color(1,:), 'lineWidth', linewidth);   %Top
patch(XA', YA', ZA', color(2,:), 'lineWidth', linewidth);     %Bottom

patch(XB', YB'+1, ZB', color(3,:), 'lineWidth', linewidth);   %Front
patch(XB', YB', ZB', color(4,:), 'lineWidth', linewidth);     %Back

patch(XC'+1, YC', ZC', color(5,:), 'lineWidth', linewidth);   %Left
patch(XC', YC', ZC', color(6,:), 'lineWidth', linewidth);     %Right

axis equal;
view([1 1 1]);

xlim([min(p(:,1)) max(p(:,1)) + 1]);
ylim([min(p(:,2)) max(p(:,2)) + 1]);
zlim([min(p(:,3)) max(p(:,3)) + 1]);

title(['Number of blocks: ' num2str(blocks)]);

end

