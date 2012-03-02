radius = 100;
pillarheight = 5;

figure(1)
clf;
hold on;

p = ring(radius);

pixelplot3(p);

npillars = 24;

pA = 2*pi/npillars;
pillarAlpha = -pi:pA:pi;
pillarAlpha = pillarAlpha + pi/npillars;

pbase = round(radius .* [sin(pillarAlpha)' cos(pillarAlpha)']);

p2 = [repmat(pbase, pillarheight, 1) reshape(repmat(1:pillarheight,size(pbase, 1), 1),[],1)];

pixelplot3(p2);

% xybottom = p(p(:,3) == 0,1:2);
% 
% p3 = [];
% for i=2:npillars
%     base1 = p2(i-1,:);
%     base2 = p2(i,:);
%     cx = mean([base1(1) base2(1)]);
%     cy = mean([base1(2) base2(2)]);
%     
%     radius2 = ceil(hypot(base1(1) - base2(1), base1(2) - base2(2)) / 2);
%     
%     for z = 0:radius2
%         for x = min(base1(1),base2(1)):max(base1(1),base2(1))
%             for y = min(base1(2),base2(2)):max(base1(2),base2(2))
%                 if ismember([x y], xybottom, 'rows') && ... 
%                         abs(((x-cx)^2) + ((y-cy)^2) + (z^2) - (radius2^2)) <= radius2
%                     p3 = [p3; [x y z]];
%                 end
%             end
%         end
%     end    
% end
% 
% pixelplot3(p3);

% print(gcf, '-dpng', '-r300', sprintf('museumbottom_r%d_p%d.png', radius, npillars));