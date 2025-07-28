function [alif,ba,jeem,dal,ra,seen,Saad,Taa,a3en,fa,Qa,kaf,lam,meem,noon,waw,ha,tah,ya] = drawletterV1BIPOLAR()

%Alif-----------------
alif=[1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1
      1 1 1 1 -1 1 1 1];%base
letter=alif;
draw(letter)

%Ba,--------------------
ba = [1  1  1  1  1  1  1  1
      1  1  1  1  1  1  1  1
      1 -1  1  1  1  1  1 -1
      1 -1  1  1  1  1  1 -1
      1 -1 -1 -1 -1 -1 -1 -1%base
      1  1  1  1  1  1  1  1
      1  1  1 -1  1  1  1  1];
figure
letter=ba;
draw(letter)

%Jeem---------------------
jeem = [1 1 1  -1  -1  -1  -1  -1
        1 1 1 1 1 1 1  -1
        1 1 1  -1  -1  -1  -1  -1%base
        1 1 1  -1 1 1 1 1
        1 1 1  -1 1  -1 1 1
        1 1 1  -1 1 1 1  -1
        1 1 1  -1  -1  -1  -1  -1];
figure
letter=jeem;
draw(letter)

%dal------------------------------
dal = [1 1 1 1 1 1 1 1
       1  -1  -1  -1  -1  -1  -1 1
       1 1 1 1 1 1  -1 1
       1  -1  -1  -1  -1  -1  -1 1%base
       1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1
       1 1 1 1 1 1 1 1];
figure
letter=dal;
draw(letter)

%ra--------------------------
ra = [1 1 1 1 1 1 1 1
      1 1 1 1 1  -1 1 1
      1 1 1 1 1  -1 1 1
      1 1 1 1 1  -1 1 1
      1 1 1 1 1  -1 1 1%base
      1 1 1 1 1  -1 1 1
      1 1 1  -1  -1  -1 1 1];
figure
letter=ra;
draw(letter)

%seen-------------
seen = [1 1 1 1 1 1 1 1
        1 1 1  -1 1  -1 1  -1
         -1  -1 1  -1 1  -1 1  -1
         -1 1 1  -1  -1  -1  -1  -1
         -1 1 1  -1 1 1 1 1
         -1  -1  -1  -1 1 1 1 1
        1 1 1 1 1 1 1 1];
figure
letter=seen;
draw(letter)

%Saad-----------------------
Saad = [1 1 1 1 1 1 1 1
        1 1 1 1 1 1 1 1
        1 1 1 1  -1  -1  -1  -1
         -1 1  -1 1  -1 1 1  -1
         -1 1  -1  -1  -1  -1  -1  -1
         -1 1  -1 1 1 1 1 1
         -1  -1  -1 1 1 1 1 1];
figure
letter=Saad;
draw(letter)

%Taa--------------------------
Taa = [1 1  -1 1 1 1 1 1
       1 1  -1 1 1 1 1 1
       1 1  -1 1 1 1 1 1
       1 1  -1 1 1 1 1 1
       1 1  -1  -1  -1  -1  -1  -1
       1 1  -1 1 1 1 1  -1
        -1  -1  -1  -1  -1  -1  -1  -1];%base
figure
letter=Taa;
draw(letter)

%a3en----------------
a3en= [1 1 1 1 1 1 1 1
       1 1 1  -1  -1  -1 1 1
       1 1 1  -1 1 1 1 1
       1  -1  -1  -1  -1  -1 1 1
       1  -1 1 1 1 1 1 1%base
       1  -1  -1  -1  -1  -1 1 1
       1 1 1 1 1 1 1 1];
figure
letter=a3en;
draw(letter)

%fa-------------------
fa = [1 1 1 1 1 1  -1 1
      1 1 1 1 1 1 1 1
      1 1 1 1 1  -1  -1  -1
      1 1 1 1 1  -1 1  -1
      1  -1 1 1 1  -1  -1  -1
      1  -1 1 1 1 1 1  -1
      1  -1  -1  -1  -1  -1  -1  -1];%base
figure
letter=fa;
draw(letter)

%Qa-------------------------
Qa = [1 1 1  -1 1  -1 1 1
      1 1 1 1 1 1 1 1
      1  -1 1  -1  -1  -1 1 1
      1  -1 1  -1 1  -1 1 1
      1  -1 1  -1  -1  -1 1 1
      1  -1 1 1 1  -1 1 1%base
      1  -1  -1  -1  -1  -1 1 1];
figure
letter=Qa;
draw(letter)

%kaf-------------------------
kaf = [1 1 1 1 1 1 1  -1
       1 1 1 1 1 1 1  -1
       1 1 1  -1  -1  -1 1  -1
       1 1 1  -1 1 1 1  -1
       1  -1 1  -1  -1  -1 1  -1
       1  -1 1 1 1 1 1  -1
       1  -1  -1  -1  -1  -1  -1  -1];%base
figure
letter=kaf;
draw(letter)

%lam----------------------------
lam = [1 1 1 1 1  -1 1 1
       1 1 1 1 1  -1 1 1
       1 1 1 1 1  -1 1 1
       1 1 1  -1 1  -1 1 1
       1 1 1  -1 1  -1 1 1
       1 1 1  -1 1  -1 1 1%base
       1 1 1  -1  -1  -1 1 1];
figure
letter=lam;
draw(letter)

%meem----------------------------
meem = [1 1 1 1 1 1 1 1
        1  -1  -1  -1  -1  -1 1 1
        1  -1 1  -1 1  -1 1 1
        1  -1 1  -1  -1  -1 1 1%base
        1  -1 1 1 1 1 1 1
        1  -1 1 1 1 1 1 1
        1  -1 1 1 1 1 1 1];
figure
letter=meem;
draw(letter)

%noon----------------------------
noon = [1 1 1  -1 1 1 1 1
        1 1 1 1 1 1 1 1
        1 1  -1 1  -1 1 1 1
        1 1  -1 1  -1 1 1 1
        1 1  -1 1  -1 1 1 1%base
        1 1  -1  -1  -1 1 1 1
        1 1 1 1 1 1 1 1];
figure
letter=noon;
draw(letter)

%waw------------------------------
waw = [1 1 1 1 1 1 1 1
       1 1 1 1  -1  -1  -1 1
       1 1 1 1  -1 1  -1 1
       1 1 1 1  -1  -1  -1 1%base
       1 1 1 1 1 1  -1 1
       1 1 1 1  -1  -1  -1 1
       1 1 1 1 1 1 1 1];
figure
letter=waw;
draw(letter)

%ha---------------------------------
ha = [1 1 1 1 1 1 1 1
      1 1  -1  -1  -1  -1  -1  -1
      1 1 1 1 1 1 1  -1
      1 1 1  -1  -1  -1 1  -1
      1 1 1  -1 1  -1 1  -1
       -1  -1  -1  -1  -1  -1  -1  -1%base
      1 1 1 1 1 1 1 1];
figure
letter=ha;
draw(letter)

%tah----------------------
tah= [1 1  -1 1  -1 1 1 1
      1 1 1 1 1 1 1 1
      1 1  -1  -1  -1 1 1 1
      1 1  -1 1  -1 1 1 1
      1 1  -1  -1  -1 1 1 1%base
      1 1 1 1 1 1 1 1
      1 1 1 1 1 1 1 1];
figure
letter=tah;
draw(letter)

%ya----------------------------------
ya = [1 1 1 1 1  -1  -1  -1
      1 1 1 1 1  -1 1  -1
      1 1 1 1 1  -1 1  -1%base
      1 1 1 1 1  -1 1 1
       -1  -1  -1 1 1  -1 1 1
       -1 1 1 1 1  -1 1 1
       -1  -1  -1  -1  -1  -1 1 1];
figure
letter=ya;
draw(letter)

% function draw(letter);
% 
% [m n]=size(letter);
% draw=[letter letter(:,[n])]';
% draw=[draw draw(:,[m])]';
% pcolor(draw)
% colormap(gray)
% axis('ij')
% axis image
% pause( -1.1)
% 
% function digit_plot(digit);
% 
% [m n]=size(digit);
% digit_plot=[digit digit(:,[n])]';
% digit_plot=[digit_plot digit_plot(:,[m])]';
% pcolor(digit_plot)
% colormap(gray)
% axis('ij')
% axis image
% pause( -1.1)