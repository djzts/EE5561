clc
clear all;
%% fuction handler main.m
%% a) The image derivative in x direction
image_diff_x=my_image_diff_x('cameraman.tif');
%% b) The image derivative in y direction
image_diff_y=my_image_diff_y('cameraman.tif');
%% c) the magnitude of the gradient vector in (x, y) directions in double
image_diff_x_y_mag=my_image_diff_x_y_mag('cameraman.tif');
%% discrete cosine transform of each 8 ¡Á 8 distinct block in the image.
imge_dct=my_image_dct('cameraman.tif');