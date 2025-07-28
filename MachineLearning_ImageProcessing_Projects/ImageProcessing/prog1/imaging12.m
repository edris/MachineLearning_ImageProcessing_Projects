xn = randn(256);
yn = 20*xn+40;
for i=1:256;
    for j=1:256;
        Y(i,j)=5*lenna(i,j)+10;
    end
end
colormap(gray(256))
image(Y)