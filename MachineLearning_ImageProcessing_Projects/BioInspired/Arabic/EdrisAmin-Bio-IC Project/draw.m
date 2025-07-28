function draw(letter);

[m n]=size(letter);
draw=[letter letter(:,[n])]';
draw=[draw draw(:,[m])]';
pcolor(draw)
colormap(gray)
axis('ij')
axis image
pause(0.2)

end