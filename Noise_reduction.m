clc;
clear;
close all;

% Step 1: Load noisy speech audio
[x, Fs] = audioread('NOISE AUDIO.wav.mp4');

% Convert stereo to mono
if size(x,2) == 2
    x = mean(x,2);
end

% Step 2: Create time axis
t = (0:length(x)-1)/Fs;

% Step 3: Display original noisy speech
figure(1);
plot(t, x);
title('Original Noisy Speech');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Step 4: Apply bandpass filter
y = bandpass(x, [300 3400], Fs);

% Step 5: Display filtered speech
figure(2);
plot(t, y);
title('Noise Reduced Speech');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Step 6: Play original audio
disp('Playing Original Noisy Speech');
soundsc(x, Fs);
pause(length(x)/Fs + 2);

% Step 7: Play filtered audio
disp('Playing Noise Reduced Speech');
soundsc(y, Fs);

% Step 8: Save filtered audio
audiowrite('clean_speech.wav', y, Fs);

disp('Processing completed!');
disp('Output saved as clean_speech.wav');
