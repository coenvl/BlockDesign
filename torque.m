frontwidth = 25;
backwidth = 35;
extension = 10;
depth = 20;
layers = 60;

%Basic shape
x = [-.5*frontwidth -.5*backwidth 0 0.5*backwidth, 0.5*frontwidth -.5*frontwidth];
y = [-.5*depth .5*depth .5*depth+extension 0.5*depth, -.5*depth -.5*depth];
vx = zeros(layers, 5);
vy = zeros(layers, 5);

%Rotations to show
r = 0:.5*pi/layers:0.5*pi;

clf;
hold on;
blocks = 0;

for i = 1:numel(r)
    rot = r(i);
    [xr yr] = rotate(x,y,rot);

    clf;
    
    blocks = blocks + pixelplot(xr,yr); %,i*ones(1,numel(xr)));
    drawnow;
    vx(i,:) = xr(1:5);
    vy(i,:) = yr(1:5);
    grid on;
    title(sprintf('Torque Tower layer %02i', i));

    xlim([-19 22]);
    ylim([-19 22]);
    set(gca, 'xtick', -19:22);
    set(gca, 'ytick', -19:22);
    drawnow;
    print(gcf, '-dpng', sprintf('bouwtekeningfijn/laag%02ig.png',i));

end



for i = 1:5
    plot3(vx(:,i), vy(:,i), 1:numel(vx(:,i)), 'r');
end

axis equal;
shg

fprintf('You''re gonna need %i blocks\n', blocks);
