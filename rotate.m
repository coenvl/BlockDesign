function [x y] = rotate(x, y, alpha)

r = hypot(x,y);
t = atan2(x,y);

tn = t + alpha;
x = r.*sin(tn);
y = r.*cos(tn);

end