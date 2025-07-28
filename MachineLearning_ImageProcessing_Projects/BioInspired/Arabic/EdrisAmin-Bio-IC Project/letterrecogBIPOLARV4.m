function letterrecogBIPOLARV4

disp(' Hit any key to view bit map representaion of the fundemental Arabic character set.')
disp(' ')
pause 
drawletterV1BIPOLAR()


disp(' Hit any key to view the ten fundemental features useful for identifying characters.') 
pause 

[A, B, C, D, E, F, G, H, I, J] = letterV4BIPOLAR();


p= [A(:), B(:), F(:), J(:)];%, G(F:), H(:), I(:), J(:)]
%p=[digit1(:),digit2(:),digit3(:),digit4(:),digit5(:),digit6(:),digit7(:),digit8(:),digit9(:),digit0(:)]

disp('Hit any key to define ten target vectors denoted by "t". ')
pause

t= [ 1 -1 -1 -1%01
    -1  1 -1 -1%02
    -1 -1  1 -1%03
    -1 -1 -1  1]; %04

disp(' Hit any key to define the weight matrix which maps p to t.')
pause 

W=[];
%build weight matrix W = sum((pi*ti), i, 1, 10);
    W = p(:,1)*(t(1,:));
for i=2:4
    W = W+ p(:,i)*(t(i,:));
end

%testing
disp('Hit any key to test the weight matrix for the 4 selected features.')
pause
t1 = sign(W'*p(:,1))
p1=sign(W*t1)
t2 = sign(W'*p(:,2))
p2=sign(W*t2)
t3 = sign(W'*p(:,3))
p3=sign(W*t3)
t4 = sign(W'*p(:,4))
p4=sign(W*t4)