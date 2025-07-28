%letters V4 Bipolar
%only 3 pixels wide
function [A, B, C, D, E, F, G, H, I, J] = letterV4BIPOLAR()

%A-----------------
%%alif, jeem1.2.3, ra1.2, taa1.2, kaf, lam, meem
A=[1 -1 1
   1 -1 1
   1 -1 1];
letter=A;
draw(letter)
 
%B--------------------
%ba1.2.3, fa, qa
B =[ 1  1  1
    -1 -1 -1
     1  1  1];
figure
letter=B;
draw(letter)

%C---------------------
%jeem1.2.3, dal1.2, Saad1.2, fa, qa, waw, ya
C = [-1 -1 -1
      1  1 -1
     -1 -1 -1];
figure
letter=C;
draw(letter)

%D------------------------------
%See1.2, Saad1.2, lam, noon
D = [-1  1 -1
     -1  1 -1
     -1 -1 -1];
figure
letter=D;
draw(letter)
 
%E--------------------------
%Taa, fa, qa, meem, waw, ha, tah
E = [-1 -1 -1
     -1  1 -1
     -1 -1 -1];
figure
letter=E;
draw(letter)
 
%F-------------
%ba1.2.3, r1.2, kaf
F = [ 1  1 -1
      1  1 -1
     -1 -1 -1];
figure
letter=F;
draw(letter)

%G-----------------------
%jeem1.2.3, ya
G = [-1  1  1
     -1  1  1
     -1 -1 -1];
figure
letter=G;
draw(letter)
 
%H--------------------------
%single dot
%ba1, jeem2, dal2, ra2, saad2, Taa2, fa, noon
H = [1  1  1
     1  1  1
     -1  1  1];%base
figure
letter=H;
draw(letter)
 
%I----------------
%double dot
%ba2, qa, tah, ya
I = [-1  1 -1
      1  1  1
      1  1  1];%base
figure
letter=I;
draw(letter)
 
%J----------------
%triple dot
%ba3, seen2
J = [ 1 -1  1
      1  1  1
     -1  1 -1];%base
figure
letter=J;
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
% pause( 1.-1)
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
% pause( 1.-1)

