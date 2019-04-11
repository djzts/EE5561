clc
clear all;
Cameraman_unit8=imread('cameraman.tif');
Cameraman=im2double(Cameraman_unit8);
%% Add Gaussian noise
sigma=0.05;
Shitted_Cameraman=imnoise(Cameraman,'gaussian',0,sigma);
figure(1)
subplot(121)
imshow(Shitted_Cameraman);

%% distinct 8*8 blocks
n=8;
Block=zeros(256/n,256/n,n,n);
Block_mean=zeros(256/n,256/n);
Block_xx2=zeros(256/n,256/n);
H_weiner=zeros(256/n,256/n);
Block_reconstuct=zeros(256,256);
for i=1:256/n
    for j=1:256/n
        Block(i,j,:,:)=Shitted_Cameraman(n*(i-1)+1:n*i,n*(j-1)+1:n*j); % E(yyT) is 8*8 block
        %Block(i,j,:,:)=Cameraman(n*(i-1)+1:n*i,n*(j-1)+1:n*j);
        temp= reshape(Block(i,j,:,:),[n*n,1]);                         %reshape E(yyT) to 64*1 vector
        Block_xx2(i,j,:,:)=var(temp)-sigma^2;   %sum(yijyij)-uxux-sigma^2(in practice extimate)
        
        %sigmaxI=reshape(Block_xx2(i,j,:,:),[n^2,n^2]);
        %sigmaxI=sigma_r*eye(64);
        sigmaxI=reshape(Block_xx2(i,j,:,:),[1,1]);
        
        H_weiner(i,j)=(sigmaxI^2)/(sigmaxI^2+sigma^2);%H Wenier
        
        X_reconstruct=H_weiner(i,j)*(temp-mean(temp))+mean(temp); %x'=Hy'-> x-ux=H(y-ux) -> x=H*(y-ux)+ux
        
        Block_reconstuct(n*(i-1)+1:n*i,n*(j-1)+1:n*j)=reshape(X_reconstruct,[n,n]);
    end
end
    %E_xx1=reshape(H_weiner(1,1,:,:),[64,64])
    %mean(mean(E_xx1))
    subplot(122)
    %imshow(Block_reconstuct-Shitted_Cameraman,[]);

    imshow(Block_reconstuct);
