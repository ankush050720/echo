close all;
clear;
clc;
%% Reading Impulse Response of Clap
[x,fs]=audioread('test_clap.wav');
s=x(:,1);
sound(x,fs);
subplot(2,2,1);
plot(s);
xlabel('Time');
ylabel('Amplitude');
title('Clap');
%% Reading input audio file
[y,fs]=audioread('test_speech.wav');
r=y(:,1);
sound(r, fs);
subplot(2,2,2);
plot(r, 'g');
xlabel('Time');
ylabel('Amplitude');
title('Input');
%% Convolution of Impulse response and Input Signal To produce echo effect
z=conv(s,r);
sound(z,fs);
subplot(2,2,3);
plot(z, 'y');
xlabel('Time');
ylabel('Amplitude');
title('Output');
% audiowrite('output.wav', z, fs);

%% Echo removal
l=max([length(z);length(s)]);
a=fft([z;zeros(l-length(z),1)]);
b=fft([s;zeros(l-length(s),1)]);
c=real(ifft(a./b));
sound(c,fs);
subplot(2,2,4);
plot(c, 'r');
xlabel('Time');
ylabel('Amplitude');
title('echo free sound');