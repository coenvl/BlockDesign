function p = square(len)
% p = square(radius)
% Part of the blockdesign toolbox
%
% Create a square with the first corner at point 0,0. If you want to
% translate the square, you simply add the translation to any of the
% columns.
%
% Coen van Leeuwen
% Jan 11, 2012

x = (0:(len-1))';
p1 = [x zeros(len, 1) zeros(len,1); x (len-1)*ones(len,1) zeros(len,1)];
p2 = [zeros(len, 1) x zeros(len,1); (len-1)*ones(len,1) x zeros(len,1)];
p = [p1; p2];

p = unique(p, 'rows');