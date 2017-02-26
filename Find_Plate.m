function Find_Plate(img)
imagein = imread(img);
fil_im = fspecial('gaussian');
new_im= imagein(:,:,3);
im1=imfilter(new_im, fil_im);
ime=edge(im1,'canny',0.839, 3.699);
figure(1)
imshow(ime);
end