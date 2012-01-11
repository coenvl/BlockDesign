function saveplot(name)

dot = strfind(name, '.');

if isempty(dot)
    ext = 'png';
    name = [name '.png'];
else
    ext = name((dot+1):end);
end

switch ext
    case 'png'
        method = '-dpng';
    case 'jpg'
        method = '-djpeg';
    case 'tiff'
        method = '-dtiff';
    otherwise
        method = '-dpng';
end

print(gcf, method, '-r300', name);

end

