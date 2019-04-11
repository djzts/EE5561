function output = my_image_diff_x(name)
Cameraman=imread(name);
[m,n]=size(Cameraman);
makeup=zeros(1,n);
output=[diff(Cameraman);makeup];
end