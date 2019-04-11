function output = my_image_diff_y(name)
Cameraman=imread(name);
[m,n]=size(Cameraman);
makeup=zeros(m,1);
output=[diff(Cameraman')',makeup];
end