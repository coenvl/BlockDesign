function saveLayerPlot(directory, P)
%SAVELAYERPLOT Summary of this function goes here
%   Detailed explanation goes here

if ~exist(directory, 'dir')
    mkdir(directory);
end

pixelplot3(P);
drawnow;
save2pdf(fullfile(directory, 'overview.pdf'), gcf, 600);
saveplot(fullfile(directory, 'overview.png'));

for i = min(P(:,3)):max(P(:,3))
    
    clf;    
    pixelplot(P(P(:,3) == i - 1, :), [.9 .9 .9]);
    hold on;
    pixelplot(P(P(:,3) == i, :), [.5 .5 .5]);
    xlim([min(P(:,1))-1 max(P(:,1))+1]);
    ylim([min(P(:,2))-1 max(P(:,2))+1]);
    drawnow;
%     title('Layer %d', i);
    saveplot(fullfile(directory, sprintf('layer%d', i)));

end

