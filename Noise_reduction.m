clc;
clear;
close all;


[x, Fs] = audioread('NOISE AUDIO.wav.mp4');


if size(x,2) == 2
    x = mean(x,2);
end


t = (0:length(x)-1)/Fs;


figure(1);
plot(t, x);
title('Original Noisy Speech');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;


y = bandpass(x, [300 3400], Fs);


figure(2);
plot(t, y);
title('Noise Reduced Speech');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;


disp('Playing Original Noisy Speech');
soundsc(x, Fs);
pause(length(x)/Fs + 2);

disp('Playing Noise Reduced Speech');
soundsc(y, Fs);


audiowrite('clean_speech.wav', y, Fs);

disp('Processing completed!');
disp('Output saved as clean_speech.wav');
