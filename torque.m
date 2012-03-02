frontwidth = 15;
backwidth = 30;
extension = 30;
depth = 30;
layers = 192;

% outDir = 'layers';
% if ~exist(outDir, 'dir');
%     mkdir(outDir);
% end

%Basic shape
x = [-.5*frontwidth -.5*backwidth 0 0.5*backwidth, 0.5*frontwidth -.5*frontwidth];
y = [-.5*depth .5*depth .5*depth+extension 0.5*depth, -.5*depth -.5*depth];
x = x - mean(x);
y = y - mean(y);
vx = zeros(layers, 5);
vy = zeros(layers, 5);

%Rotations to show
r = 0:.5*pi/layers:0.5*pi;

clf;
hold on;

p = [];
for i = 1:numel(r)
    rot = r(i);
    [xr yr] = rotate(x,y,rot);

    clf;
    
    p_layer = pointline(xr,yr,100000); 
    
    p = [p; [p_layer i*ones(size(p_layer, 1), 1)]];
    
%     pixelplot(p_layer); %,i*ones(1,numel(xr)));
% 
%     grid on;
%     title(sprintf('Torque Tower layer %02i', i));
%     waitforbuttonpress;
%     print(gcf, '-dpng', fullfile(outDir, sprintf('laag%02ig.png',i)));
end

pixelplot3(p);

axis equal;
shg

fprintf('You''re gonna need %i blocks\n', size(p,1));
fprintf('That''s %i stacks\n', ceil(size(p,1) / 64));
