function output = my_image_diff_x_y_mag(name)
x_out=im2double(my_image_diff_x(name));
y_out=im2double(my_image_diff_y(name));
output=(x_out.*x_out+y_out.*y_out).^(0.5);
end