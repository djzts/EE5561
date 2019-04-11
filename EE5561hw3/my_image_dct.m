function output=my_image_dct(name)
Cameraman_unit8=imread(name);
Cameraman=im2double(Cameraman_unit8);
n=8;
Block=zeros(256/n,256/n,n,n);
output=zeros(256,256);
    for i=1:256/n
        for j=1:256/n
            Block(i,j,:,:)=Cameraman(n*(i-1)+1:n*i,n*(j-1)+1:n*j); % E(yyT) is 8*8 block
            output(n*(i-1)+1:n*i,n*(j-1)+1:n*j)= dct(reshape(Block(i,j,:,:),[n,n]));
        end
    end
end