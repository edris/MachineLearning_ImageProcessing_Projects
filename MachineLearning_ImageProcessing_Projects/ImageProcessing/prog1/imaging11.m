clear all
load lenna
colormap(gray(256))
image(lenna)
x=1:256;
y=zeros(1,256);
for i = 1:256;
    for j = 1:256;
        y(lenna(i,j))=y(lenna(i,j))+1;
    end
end
figure; bar(x,y)%outputs figure of bar graph
%bar(x,y)%outputs figure of bar graph
title('Intensity Histogram')
xlabel('Intensity')
ylabel('Numbers')

P = zeros(1,256);%P is the probabilities of intensities 1:256
C = 0;%count for intensity or Porb.
ival = 0; %intensity value of 20%
for i=1:256;
    P(i)=100*y(i)/(256*256);
    C = P(i)+C;
    if C>=20
        ival = i
        break
    end
end