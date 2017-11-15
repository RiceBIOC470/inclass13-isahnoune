%Inclass 13
%GB comments
1a 100
1b 100
1c 100
1d 100
2a 100
2b 100
2c 100
overall: 100

%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 
image = imread('Dish1Well8Hyb1Before_w0001_m0006.tif');
imshow(image);

% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright. 

image = im2double(image);
image_dilate = imdilate(image, strel('disk',15));
image_norm = image./image_dilate;
imshow(image_norm,[]);

% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true. 

xmask3 = image_norm > 0.8;
imshow(xmask3);

% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.

edge_image = edge(xmask3, 'sobel');
imshow(edge_image, []);

% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue.

rgbImage = cat(3, image,xmask3,edge_image);
imshow(rgbImage)

%Part 2. Continue with your nuclear mask from part 1. 
%A. Use regionprops to find the centers of the objects

centroids = regionprops(xmask3, 'Centroid')

%B. display the mask and plot the centers of the objects on top of the
%objects

imtool(xmask3);
hold(imgca,'on');
plot(imgca,centroids(:,1), centroids(:,2), 'r*');
hold(imgca,'off')

%C. Make a new figure without the image and plot the centers of the objects
%so they appear in the same positions as when you plot on the image (Hint: remember
%Image coordinates). 

plot(centroids(:,1), centroids(:,2),'r*')

