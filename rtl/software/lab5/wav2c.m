% Load .wav file
[y, Fs] = audioread('C:\Users\joshl\Documents\Audacity\song2.wav');

% Convert the audio signal to mono if it's stereo
if size(y, 2) == 2
    y = sum(y, 2) / 2;
end

% Desired total samples
totalSamples = 30 * 44000;

% Resample audio to 44000 Hz if the sample rate is different
if Fs ~= 44000
    [P, Q] = rat(44000 / Fs);
    y = resample(y, P, Q);
end

% Manually resize the array 'y' to totalSamples length
if length(y) > totalSamples
    y = y(1:totalSamples);  % Truncate if 'y' is too long
elseif length(y) < totalSamples
    y = [y; zeros(totalSamples - length(y), 1)];  % Zero-pad if 'y' is too short
end

% Convert to 8-bit unsigned integer
A = uint8(255 * (y + 1) / 2);

% Open file to write
fID = fopen('song_2.c', 'w');

% Write size of the song
fprintf(fID, 'const unsigned int size_song = %d;\n', totalSamples);

% Start array declaration
fprintf(fID, 'const unsigned char song[%d] = {', totalSamples);

% Write each byte of song data
for i = 1 : totalSamples
    if i < totalSamples
        fprintf(fID, '%d,\n', A(i));
    else
        fprintf(fID, '%d', A(i));
    end
end

% End array declaration
fprintf(fID, '};\n');

% Close file
fclose(fID);