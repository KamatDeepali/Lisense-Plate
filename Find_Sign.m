function Find_Sign(img1)
imagein = imread(img1);
imgrey = rgb2gray(imagein);
BWH = edge(imgrey,'sobel', 'horizontal');
BWV = edge(imgrey,'sobel','vertical');
BW = imadd(BWH, BWV);
[H,T,R] = hough(BWH);
[H1,T1,R1] = hough(BWV);
P  = houghpeaks(H,5,'threshold',ceil(0.01*max(H(:))));
P1  = houghpeaks(H1,5,'threshold',ceil(0.01*max(H1(:))));
lines = houghlines(BW,T,R,P,'FillGap',45,'MinLength',35);
lines1 = houghlines(BW,T1,R1,P1,'FillGap',147,'MinLength',120);
figure(2);
imshow(imagein);
hold on
%refered from doc of houghlines
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

end

for k = 1:length(lines1)
   xy = [lines1(k).point1; lines1(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end

end
