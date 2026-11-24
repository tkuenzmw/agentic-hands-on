%% Cell segmentation and analysis

img = imread("data/cells.png");

gray = im2gray(img);
gray = imgaussfilt(gray,2);

bw = imbinarize(gray,"adaptive", ...
    "Sensitivity",0.63);

bw = bwareaopen(bw,80);
bw = imfill(bw,"holes");

L = bwlabel(bw);

stats = regionprops("table",L,gray, ...
    "Area","MeanIntensity","Centroid");

figure
imshow(labeloverlay(img,L))
title("Segmentation result")

writetable(stats,"cell_measurements.csv");