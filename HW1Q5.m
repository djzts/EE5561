clear all
clc
%% Q1
fprintf('Q(a)\n');
RGB = imread('lena512.bmp');
%PIC=rgb2gray(RGB);
fft_lena=fftshift(double(fft2(RGB)));
figure('name','FFT')
subplot 121
colormap gray;
magnitude=log(abs(fft_lena));
imagesc(magnitude);
title('RGB lena Image Magnitude throught Fourier Transforms');
subplot 122
colormap gray;
Phase=log(angle(fft_lena));
imagesc(angle(Phase));
title('RGB lena Image Phase throught Fourier Transforms');

%% Q2 LP filter
fprintf('Q(b)');
%% 128*128 LP
D1=128/2;
[M N]=size(RGB);
Lo(1:M,1:N)=0;
Lo(0.5*M-D1:0.5*M+D1-1,0.5*N-D1:0.5*N+D1-1)=1;
J=fft_lena.*Lo;
J1=ifftshift(J);
Lena_128=ifft2(J1);
figure('name','128*128 LP filter')
subplot(1,2,1)
imshow(RGB);
title('Original image','fontsize',14)
subplot(1,2,2)
imshow(abs(Lena_128),[12 290]), colormap gray
title('128*128 low pass filtered image','fontsize',14)
%% Calculate PSNR
Ratio_128 = myPSNR(RGB,abs(Lena_128));
fprintf('\n The 128 SNR value (my function) is %0.4f', Ratio_128);
[peaksnr, snr] = psnr(abs(Lena_128), abs(double(RGB)));
fprintf('\n The 128 Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 128 SNR value is %0.4f', snr);
%% 32*32 LP
D=32/2;
Lo1(1:M,1:N)=0;
Lo1(0.5*M-D:0.5*M+D-1,0.5*N-D:0.5*N+D-1)=1;
K=fft_lena.*Lo1;
K1=ifftshift(K);
Lena_32=ifft2(K1);
figure('name','32*32 LP filter')
subplot(1,2,1)
imshow(RGB);
title('Original image','fontsize',14)
subplot(1,2,2)
imshow(abs(Lena_32),[12 290]), colormap gray
title('32*32 low pass filtered image','fontsize',14)
%% Calculate PSNR

Ratio_32 = myPSNR(RGB,abs(Lena_32));
fprintf('\n The 32 SNR value (my function) is %0.4f', Ratio_32);
[peaksnr, snr] = psnr(abs(Lena_32), abs(double(RGB)));
fprintf('\n The 32 Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 32 SNR value is %0.4f', snr);

%% part C 384 samples
fprintf('\nQ(c)');
%select_row=1:512/384:512;
%row=floor(select_row);
RGB_sample1=RGB;
for i=1:4:512
    RGB_sample1(i,:)=zeros(512,1);
    %RGB_sample1(:,i)=zeros(1,512);
end
figure('name','384 samples pixel')
subplot(2,2,3)
imshow(RGB_sample1);

fft_sample1=fftshift(double(fft2(RGB_sample1)));
colormap gray;
magnitude=log(abs(fft_sample1));
subplot(2,2,1)
imagesc(magnitude);
title('RGB 384 sampled Image Magnitude throught Fourier Transforms');
colormap gray;
Phase=log(angle(fft_sample1));
subplot(2,2,2)
imagesc(angle(Phase));
title('RGB 384 sampled Image Phase throught Fourier Transforms');

D3=256/2;
[M N]=size(RGB_sample1);
Lo3(1:M,1:N)=0;
Lo3(0.5*M-D3:0.5*M+D3-1,0.5*N-D3:0.5*N+D3-1)=1;
S=fft_sample1.*Lo3;
S1=ifftshift(S);
Lena_384=ifft2(S1);
subplot(2,2,4)
imshow(abs(Lena_384),[12 290]), colormap gray
title('sampled image reconstructed','fontsize',14)

%% SNR

Ratio_384 = myPSNR(RGB,abs(Lena_384));
fprintf('\n The 384 samples SNR value (my function) is %0.4f', Ratio_384);
[peaksnr, snr] = psnr(abs(Lena_384), abs(double(RGB)));
fprintf('\n The 384 samples Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 384 samples SNR value is %0.4f', snr);
%% part C 256 samples
%select_row=1:512/384:512;
%row=floor(select_row);
RGB_sample1=RGB;
for i=1:2:512
    RGB_sample1(i,:)=zeros(512,1);
    RGB_sample1(:,i)=zeros(1,512);
end
figure('name','384 samples pixel')
subplot(2,2,3)
imshow(RGB_sample1);

fft_sample1=fftshift(double(fft2(RGB_sample1)));
colormap gray;
magnitude=log(abs(fft_sample1));
subplot(2,2,1)
imagesc(magnitude);
title('RGB 384 sampled Image Magnitude throught Fourier Transforms');
colormap gray;
Phase=log(angle(fft_sample1));
subplot(2,2,2)
imagesc(angle(Phase));
title('RGB 384 sampled Image Phase throught Fourier Transforms');

D4=256/2;
[M N]=size(RGB_sample1);
Lo4(1:M,1:N)=0;
Lo4(0.5*M-D4:0.5*M+D4-1,0.5*N-D4:0.5*N+D4-1)=1;
SS=fft_sample1.*Lo4;
SS1=ifftshift(SS);
Lena_256=ifft2(SS1);
subplot(2,2,4)
imshow(abs(Lena_256),[12 290]), colormap gray
title('sampled image reconstructed','fontsize',14)
%% SNR
Ratio_256 = myPSNR(RGB,abs(Lena_256));
fprintf('\n The 256 samples SNR value (my function) is %0.4f', Ratio_256);
[peaksnr, snr] = psnr(abs(Lena_256), abs(double(RGB)));
fprintf('\n The 256 samples Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 256 samples SNR value is %0.4f', snr);

%% question(D)
fprintf('\nQ(d)');
h1=1/9*ones(3);
Lena_33 = imfilter(RGB, h1);
h2=(1/7)^2*ones(7);
Lena_77 = imfilter(RGB, h2);
figure('name','Moving filter')
subplot 131
imshow(RGB);
title('original image','fontsize',10)
subplot 132
imshow(abs(Lena_33),[5 290]), colormap gray
title('3*3 moving filtered image','fontsize',10)
subplot 133
imshow(abs(Lena_77),[5 290]), colormap gray
title('7*7 moving filtered image','fontsize',10)
%% SNR
Ratio_33 = myPSNR(RGB,abs(double(Lena_33)));
fprintf('\n The 3*3 moving filter SNR value (my function) is %0.4f', Ratio_33);
[peaksnr, snr] = psnr(abs(double(Lena_33)), abs(double(RGB)));
fprintf('\n The 3*3 moving filter Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 3*3 moving filter SNR value is %0.4f', snr);
Ratio_77 = myPSNR(RGB,abs(double(Lena_77)));
fprintf('\n The 7*7 moving filter SNR value (my function) is %0.4f', Ratio_77);
[peaksnr, snr] = psnr(abs(double(Lena_77)), abs(double(RGB)));
fprintf('\n The 7*7 moving filter Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The 7*7 moving filter SNR value is %0.4f', snr);

%% add noise
Lena_noise=imnoise(RGB,'gaussian',0,10);
Lena_noise_33 = imfilter(Lena_noise, h1);
Lena_noise_77 = imfilter(Lena_noise, h2);
figure('name','Denoise with Moving filter')
subplot 131
imshow(Lena_noise);
title('original image','fontsize',10)
subplot 132
imshow(abs(Lena_noise_33),[5 290]), colormap gray
title('3*3 moving filtered image','fontsize',10)
subplot 133
imshow(abs(Lena_noise_77),[5 290]), colormap gray
title('7*7 moving filtered image','fontsize',10)

%% SNR
Ratio_noise_33 = myPSNR(RGB,abs(double(Lena_noise_33)));
fprintf('\n The denoised 3*3 moving filter SNR value (my function) is %0.4f', Ratio_noise_33);
[peaksnr, snr] = psnr(abs(double(Lena_noise_33)), abs(double(RGB)));
fprintf('\n The denoised 3*3 moving filter Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The denoised 3*3 moving filter SNR value is %0.4f', snr);
Ratio_noise_77 = myPSNR(RGB,abs(double(Lena_77)));
fprintf('\n The denoised 7*7 moving filter SNR value (my function) is %0.4f', Ratio_noise_77);
[peaksnr, snr] = psnr(abs(double(Lena_noise_77)), abs(double(RGB)));
fprintf('\n The denoised 7*7 moving filter Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The denoised 7*7 moving filter SNR value is %0.4f', snr);