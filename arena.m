L = 100;
W = 50;
H = 20;

outerring = ellipse(W,L);

p = [];
for z = 1:H;
    innerring = ellipse(W-(H-z),L-(H-z));
    p = [p; translate(outerring, [0 0 z])];
    p = [p; translate(innerring, [0 0 z])];
end


pixelplot3(p);