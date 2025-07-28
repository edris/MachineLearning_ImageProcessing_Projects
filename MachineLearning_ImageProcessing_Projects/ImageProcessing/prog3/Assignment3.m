%Joseph Pietrykowski
%Image Analysis and Computer Vision Assignment 3
%Assistance from Rosetta Code

%This first block of code loads, computes, and saves all images that will
%be used in this assignment.
lena=im2double(imread('lena.jpg'));%Using double floating point for the sqrt involved in the gaussian.
lines=im2double(imread('lines.bmp'));
lenalines=(lena-lines);
imwrite(lenalines,'lenalines.bmp','BMP');%create .bmp of image for use in the report
noisylenalines=imnoise(lenalines,'gaussian'); %Generates gaussian noise to be added to the test image.
imwrite(noisylenalines,'noisylenalines.bmp','BMP');

%Smooth the noisy image because differential operators are so sensitive to
%noise.
for i=2:257
    for j=2:257
        edgenoisylenalines(i,j)=median([edgenoisylenalines(i,j),edgenoisylenalines(i-1,j),edgenoisylenalines(i+1,j),edgenoisylenalines(i,j-1),edgenoisylenalines(i,j+1),edgenoisylenalines(i+1,j+1),edgenoisylenalines(i-1,j-1),edgenoisylenalines(i+1,j-1),edgenoisylenalines(i-1,j+1)]);
    end
end

%Before applying the Hough transform, we must first detect edges.
%The euclidian gradient operator is being used to detect edges.
edgelena=sqrt(padarray(padarray((padarray(lena,[1 0],'replicate','post')-padarray(lena,[1 0],'replicate','pre')).^2,[0 1]),[1 0],'post')+padarray(padarray((padarray(lena,[0 1],'replicate','post')-padarray(lena,[0 1],'replicate','pre')).^2,[1 0]),[0 1],'post'));
edgelines=sqrt(padarray(padarray((padarray(lines,[1 0],'replicate','post')-padarray(lines,[1 0],'replicate','pre')).^2,[0 1]),[1 0],'post')+padarray(padarray((padarray(lines,[0 1],'replicate','post')-padarray(lines,[0 1],'replicate','pre')).^2,[1 0]),[0 1],'post'));
edgelenalines=sqrt(padarray(padarray((padarray(lenalines,[1 0],'replicate','post')-padarray(lenalines,[1 0],'replicate','pre')).^2,[0 1]),[1 0],'post')+padarray(padarray((padarray(lenalines,[0 1],'replicate','post')-padarray(lenalines,[0 1],'replicate','pre')).^2,[1 0]),[0 1],'post'));
edgenoisylenalines=sqrt(padarray(padarray((padarray(noisylenalines,[1 0],'replicate','post')-padarray(noisylenalines,[1 0],'replicate','pre')).^2,[0 1]),[1 0],'post')+padarray(padarray((padarray(noisylenalines,[0 1],'replicate','post')-padarray(noisylenalines,[0 1],'replicate','pre')).^2,[1 0]),[0 1],'post'));

%Perform thresholding of the image.
for i=2:257
    for j=2:257
        if edgelena(i,j)<0.0439*2.25%2.25 times the mean value of all pixels
            edgelena(i,j)=0;
        else edgelena(i,j)=1;
        end
        if edgelines(i,j)<0.0219%The mean value of all pixels
            edgelines(i,j)=0;
        else edgelines(i,j)=1;
        end
        if edgelenalines(i,j)<0.0650*2%2 times the mean value of all pixels
            edgelenalines(i,j)=0;
        else edgelenalines(i,j)=1;
        end
        if edgenoisylenalines(i,j)<0.1844*1.5%1.75 times the mean value of all pixels
            edgenoisylenalines(i,j)=0;
        else edgenoisylenalines(i,j)=1;
        end
    end
end

%Export images to bitmap files for inclusion in the report.
imwrite(edgelena,'edgelena.bmp','BMP');
imwrite(edgelines,'edgelines.bmp','BMP');
imwrite(edgelenalines,'edgelenalines.bmp','BMP');
imwrite(edgenoisylenalines,'edgenoisylenalines.bmp','BMP');

%Hough transforms will now be applied to the four edge detected images from
%the above section.
edgelena=flipud(edgelena);
edgelines=flipud(edgelines);
edgelenalines=flipud(edgelenalines);
edgenoisylenalines=flipud(edgenoisylenalines);
width=258;
height=258;
pMax=sqrt(width^2+height^2);%Diagonal length of the image aka maximum rho.
p=(-pMax:1:pMax);%Domain of rho.
thetares=0.01745*2;
theta=(0:thetares:pi);%Domain of theta.
houghedgelena=zeros(numel(p),numel(theta));%Domain of the Hough transform space.
houghedgelines=houghedgelena;%Duplicate for all four images
houghedgelenalines=houghedgelena;
houghedgenoisylenalines=houghedgelena;
[x1,y1]=find(edgelena);%Find the indices of non zero pixels. In this case we don't care about the element values because the images have been thresholded
[x2,y2]=find(edgelines);
[x3,y3]=find(edgelenalines);
[x4,y4]=find(edgenoisylenalines);
acc1=zeros(numel(x1),numel(theta));%Preallocate our accumulator matrix
acc2=zeros(numel(x2),numel(theta));%Preallocate our accumulator matrix
acc3=zeros(numel(x3),numel(theta));%Preallocate our accumulator matrix
acc4=zeros(numel(x4),numel(theta));%Preallocate our accumulator matrix



%The following indented section of code is courtesy of Rosetta Code:
%http://rosettacode.org/wiki/Example:Hough_transform/MATLAB
%Their precalculating of sine and cosine values greatly increased the speed
%at which hough transforms could be calculated for these four images.
%My code which was the same except for the precached values took
%considerably longer to run on my laptop.
    %Preallocate cosine and sine calculations to increase speed. In
    %addition to precallculating sine and cosine we are also multiplying
    %them by the proper pixel weights such that the rows will be indexed by 
    %the pixel number and the columns will be indexed by the thetas.
    %Example: cosine(3,:) is 2*cosine(0 to pi)
    %         cosine(:,1) is (0 to width of image)*cosine(0)
    cosine = (0:width-1)'*cos(theta); %Matrix Outerproduct  
    sine = (0:height-1)'*sin(theta); %Matrix Outerproduct
    acc1((1:numel(x1)),:)=cosine(x1,:)+sine(y1,:);
    acc2((1:numel(x2)),:)=cosine(x2,:)+sine(y2,:);
    acc3((1:numel(x3)),:)=cosine(x3,:)+sine(y3,:);
    acc4((1:numel(x4)),:)=cosine(x4,:)+sine(y4,:);
    %Scan over the thetas and bin the rhos 
    for i = (1:numel(theta))
        houghedgelena(:,i) = hist(acc1(:,i),p);
        houghedgelines(:,i) = hist(acc2(:,i),p);
        houghedgelenalines(:,i) = hist(acc3(:,i),p);
        houghedgenoisylenalines(:,i) = hist(acc4(:,i),p);
    end
    
    
    
%Plot hough transforms
subplot(2,2,1)
 pcolor(theta,p,houghedgelena)
    shading flat;
    title('Lena Hough Transform');
    xlabel('Theta (radians)');
    ylabel('Rho (pixels)');
    colormap('hot');
 subplot(2,2,2)
  pcolor(theta,p,houghedgelines)
    shading flat;
    title('Lines Hough Transform');
    xlabel('Theta (radians)');
    ylabel('Rho (pixels)');
    colormap('hot');
 subplot(2,2,3)
  pcolor(theta,p,houghedgelenalines)
    shading flat;
    title('Lena + Lines Hough Transform');
    xlabel('Theta (radians)');
    ylabel('Rho (pixels)');
    colormap('hot');
 subplot(2,2,4)
   pcolor(theta,p,houghedgenoisylenalines)
    shading flat;
    title('Noisy Lena+Lines Hough Transform');
    xlabel('Theta (radians)');
    ylabel('Rho (pixels)');
    colormap('hot');
        
%To remove the subjective bias of guessing pixels values from the Hough
%Images, the below code will do that. From the values we will see how
%likely a line is to exist at the coordinates
N=10;
[m,n]=size(houghedgelena);
[SV,SI] = sort(houghedgelena(:),'descend');%calculate the 'N' largest values of a matrix
%SV=sortedValues, SI=sortedIndex
maxSIlena=[floor(SI(1:N)./n)-pMax,mod(SI(1:N),n)*thetares]%Print the top 'N' most likely Hough coordinates
maxSVlena=SV(1:N)
[SV,SI] = sort(houghedgelines(:),'descend');%calculate the 'N' largest values of a matrix
%SV=sortedValues, SI=sortedIndex
maxSIlines=[floor(SI(1:N)./n)-pMax,mod(SI(1:N),n)*thetares]%Print the top 'N' most likely Hough coordinates
maxSVlines=SV(1:N)
[SV,SI] = sort(houghedgelenalines(:),'descend');%calculate the 'N' largest values of a matrix
%SV=sortedValues, SI=sortedIndex
maxSIlenalines=[floor(SI(1:N)./n)-pMax,mod(SI(1:N),n)*thetares]%Print the top 'N' most likely Hough coordinates
maxSVlenalines=SV(1:N)
[SV,SI] = sort(houghedgenoisylenalines(:),'descend');%calculate the 'N' largest values of a matrix
%SV=sortedValues, SI=sortedIndex
maxSInoisylenalines=[floor(SI(1:N)./n)-pMax,mod(SI(1:N),n)*thetares]%Print the top 'N' most likely Hough coordinates
maxSVnoisylenalines=SV(1:N)